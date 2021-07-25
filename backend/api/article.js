const queries = require('./queries')

module.exports = app => {
    const { existsOrError } = app.api.validation

    const save = (req, res) => {
        const article = { ...req.body }
        if(req.params.id) article.id = req.params.id

        try {
            existsOrError(article.name, 'Nome não informado')
            existsOrError(article.description, 'Descrição não informada')
            existsOrError(article.categoryId, 'Categoria não informada')
            existsOrError(article.userId, 'Autor não informado')
            existsOrError(article.content, 'Conteúdo não informado')
        } catch(msg) {
            res.status(400).send(msg)
        }

        if(article.id) {
            app.db('articles')
                .update(article)
                .where({ id: article.id })
                .then(_ => res.status(204).send())
                .catch(err => res.status(500).send(err))
        } else {
            app.db('articles')
                .insert(article)
                .then(_ => res.status(204).send())
                .catch(err => res.status(500).send(err))
        }
    }

    const remove = async (req, res) => {
        try {
            const rowsDeleted = await app.db('articles')
                .where({ id: req.params.id }).del()
            
            try {
                existsOrError(rowsDeleted, 'Artigo não foi encontrado.')
            } catch(msg) {
                return res.status(400).send(msg)    
            }

            res.status(204).send()
        } catch(msg) {
            res.status(500).send(msg)
        }
    }

    const limit = 50
    const get = async (req, res) => {
        const page = req.query.page || 1
        const search = req.query.search || '';

        const result = await app.db('articles').count('id').first()
        const count = parseInt(result.count)

        const query = app.db('articles')
            .select('id', 'name', 'description')
            .limit(limit).offset(page * limit - limit);

        if (search) {
            query.where('name', 'LIKE', `%${search}%`)
                .orWhere('description', 'LIKE', `%${search}%`);
        }

        query.then(data => {
            res.json({
                data,
                count,
                limit
            });
        }).catch(err => res.status(500).send(err));
    }

    const getById = (req, res) => {
        app.db('articles')
            .where({ id: req.params.id })
            .first()
            .then(article => {
                article.content = article.content.toString()
                return res.json(article)
            })
            .catch(err => res.status(500).send(err))
    }

    const getByCategory = async (req, res) => {
        const search = req.query.search ?? null;

        const categoryId = req.params.id
        const page = req.query.page || 1
        const categories = await app.db.raw(queries.categoryWithChildren, categoryId)
        const ids = categories.rows.map(c => c.id)

        let length = app.db({a: 'articles', u: 'users'})
                .whereRaw('?? = ??', ['u.id', 'a.userId'])
                .whereIn('categoryId', ids)

        if (search) {
            length.where('a.name', 'LIKE', `%${search}%`);
        }   

        length = await length.count('a.id').first();

        const query = app.db({a: 'articles', u: 'users'})
            .select('a.id', 'a.name', 'a.description', 'a.imageUrl', {author: 'u.name'})
            .orderBy('id', 'asc')
            .limit(limit).offset(page * limit - limit);

        if (search) {
            query.where('a.name', 'LIKE', `%${search}%`)
            //    .orWhere('a.description', 'LIKE', `%${search}%`);
        }

        query.whereRaw('?? = ??', ['u.id', 'a.userId'])
            .whereIn('categoryId', ids);
        
        query.then(articles => {
            res.json({
                articles,
                length: length.count
            })
        }).then(err => res.status(500).send(err));
    }

    return { save, remove, get, getById, getByCategory }
}