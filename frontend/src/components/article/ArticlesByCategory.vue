<template>
    <div class='articles-by-category'>
        <PageTitle icon='fa fa-folder-o'
            :main='category.name' sub='Categoria'
        />

        <Search @toSearch="toSearch" />
        
        <ul>
            <li v-for='article in articles' :key='article.id'>
                <ArticleItem :article='article' />
            </li>
        </ul>

        <div class="load-more">
            <button v-if='loadMore' class='btn btn-lg btn-outline-primary' 
                @click='() => getArticles(true)'>
                Carregar mais artigos
            </button>
        </div>
    </div>
</template>

<script>
import {baseApiUrl} from '@/global'
import axios from 'axios'
import PageTitle from '../template/PageTitle'
import ArticleItem from './ArticleItem'
import Search from '@/components/template/Search';

export default {
    name: 'ArticlesByCategory',
    components: { PageTitle, ArticleItem, Search },
    data () {
        return {
            category: {},
            articles: [],
            page: 1,
            loadMore: false,
            search: ''
        }
    },
    methods: {
        getCategory () {
            const url = `${baseApiUrl}/categories/${this.category.id}`
            axios(url).then(res => {
                this.category = res.data    
            })
        },
        getArticles (loadMore = false) {
            const params = {
                page: this.page,
                search: this.search
            }

            const url = `${baseApiUrl}/categories/${this.category.id}/articles`
            axios(url, {params: { ...params }}).then(res => {
                if (loadMore) {
                    this.articles = this.articles.concat(res.data.articles)
                    this.page++

                    if (res.data.length > this.articles.length) {
                        this.loadMore = true
                    } else {
                        this.loadMore = false
                    }
                } else {
                    this.articles = res.data.articles;
                }   
            })
        },
        toSearch (search) {
            this.page = 1;
            this.search = search;
            this.getArticles(false);
        }
    },
    watch: {
        $route(to) {
            this.category.id = to.params.id
            this.articles = []
            this.page = 1;
            this.loadMore = true
            this.getCategory()
            this.getArticles()
        }
    },
    mounted () {
        this.category.id = this.$route.params.id
        this.getCategory()
        this.getArticles()
    }
}
</script>

<style>
    .articles-by-category ul {
        list-style: none;
    }

    .articles-by-category .load-more {
        margin-top: 25px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
</style>
