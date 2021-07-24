<template>
    <div class="article-admin">
        <b-form>
            <input type="text" id="article-id" hidden="hidden" v-model='article.id' />
            
            <b-form-group label='Nome: ' label-for='article-name'>
                <b-form-input 
                    id='article-name'
                    type='text'
                    v-model='article.name'
                    required
                    :readonly='mode === "remove"'
                    placeholder='Informe o nome do Artigo'
                />
            </b-form-group>
            <b-form-group label='Descrição: ' label-for='article-description'>
                <b-form-input 
                    id='article-description'
                    type='text'
                    v-model='article.description'
                    required
                    :readonly='mode === "remove"'
                    placeholder='Informe a descrição do Artigo'
                />
            </b-form-group>

            <b-form-group v-if="mode === 'save'" label='Imagem (URL): ' label-for='article-imageUrl'>
                <b-form-input 
                    id='article-imageUrl'
                    type='text'
                    v-model='article.imageUrl'
                    required
                    :readonly='mode === "remove"'
                    placeholder='Informe a URL da imagem'
                />
            </b-form-group>
            
            <b-form-group v-if='mode === "save"' label='Categoria: ' label-for='article-categoryId'>
                <b-form-select id='article-categoryId'
                    :options='categories' v-model='article.categoryId' 
                />
            </b-form-group>
            <b-form-group v-if='mode === "save"' 
                label='Autor: ' 
                label-for='article-userId'>
                <b-form-select id='article-userId'
                    :options='users' v-model='article.userId' 
                />
            </b-form-group>
            <b-form-group v-if='mode === "save"' label='Conteúdo' label-for='article-content'>
                <VueEditor 
                    v-model='article.content'
                    placeholder='Informe o conteudo do artigo'
                />
            </b-form-group>
            <b-button variant='primary' v-if='mode === "save"' @click='save'>Salvar</b-button>
            <b-button variant='danger' v-if='mode === "remove"' @click='remove'>Excluir</b-button>
            <b-button class='ml-2' @click='reset'>Cancelar</b-button>  
        </b-form>
        <hr/>
        
        <Search @toSearch="toSearch" />
            
        <b-table hoved striped :items='articles' :fields='fields'>
            <template slot='actions' slot-scope='data'>
                <b-button variant='warning' @click='loadArticle(data.item)' class='mr-2'>
                    <i class="fa fa-pencil"></i>
                </b-button>

                <b-button variant='danger' @click='loadArticle(data.item, "remove")' class='mr-2'>
                    <i class="fa fa-trash"></i>
                </b-button>
            </template>
        </b-table>
        <b-pagination size='md' v-model='page' 
            :total-rows='count' 
            :per-page='limit' 
        /> 
    </div>
</template>

<script>
import { VueEditor } from 'vue2-editor'
import axios from 'axios'
import { baseApiUrl, showError } from '@/global'
import { debounce } from 'lodash';
import Search from '@/components/template/Search';

export default {
    name: 'ArticleAdmin',
    components: { VueEditor, Search },
    data () {
        return {
            mode: 'save',
            article: {},
            articles: [],
            categories: [],
            users: [],
            page: 1,
            search: '',
            limit: 0,
            count: 0,
            fields: [
                {key: 'id', label: 'Código', sortable: true},
                {key: 'name', label: 'Nome', sortable: true},
                {key: 'description', label: 'Descrição', sortable: true},
                {key: 'actions', label: 'Ações'}
            ]
        }
    },
    methods: {
        loadArticles() {
            const params = {
                page: this.page,
                search: this.search
            }

            const url = `${baseApiUrl}/articles`
            axios.get(url, {params: { ...params }})
            .then(res => res.data)
            .then(res => {
                this.articles = res.data
                this.count = res.count
                this.limit = res.limit            
            })
        },
         reset () {
            this.mode = 'save'
            this.article = {}
            this.loadArticles()
        },
        save (reset = true) {
            const method = this.article.id ? 'put' : 'post'
            const id = this.article.id ? `/${this.article.id}` : ''
            axios[method](`${baseApiUrl}/articles${id}`, this.article).then(() => {
                this.$toasted.global.defaultSuccess()
                reset && this.reset()
            }).catch(showError)
        },
        remove () {
            const id = this.article.id
            axios.delete(`${baseApiUrl}/articles/${id}`)
                .then(() => {
                    this.$toasted.global.defaultSuccess()
                    this.reset()
                }).catch(showError)
        },
        loadArticle (article, mode= 'save') {
            this.mode = mode
            axios.get(`${baseApiUrl}/articles/${article.id}`)
                .then(res => res.data)
                .then(data => this.article = data)
        },
        loadCategories () {
            const url = `${baseApiUrl}/categories`
            axios.get(url).then(res => {
                this.categories = res.data.map(category => {
                    return { value: category.id, text: category.path }
                })
            })
        },
        loadUsers () {
            const url = `${baseApiUrl}/users`
            axios.get(url).then(res => {
                this.users = res.data.map(user => {
                    return {value: user.id, text: `${user.name} - ${user.email}`}
                })
            })
        },
        toSearch (search) {
            this.search = search
            this.loadArticles()
        }
    },
    watch: {
        page () {
            this.loadArticles()
        },
        'article.content': debounce (function () {
            const canAutoSave = this.article.id 
                && this.article.name 
                && this.article.description 
                && this.article.categoryId 
                && this.article.userId 
                && this.article.content;
            
            if (canAutoSave) {
                this.save(false)
            }
        }, 5000)
        
    },
    mounted () {
        this.loadUsers()
        this.loadCategories()
        this.loadArticles()
    }
}
</script>

<style>

</style>
