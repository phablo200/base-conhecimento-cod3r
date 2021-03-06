<template>
    <div class="category-admin">
        <b-form>
            <input type="text" id="category-id" hidden="hidden" v-model='category.id' />
            
            <b-form-group label='Nome: ' label-for='category-name'>
                <b-form-input 
                    id='category-name'
                    type='text'
                    v-model='category.name'
                    required
                    :readonly='mode === "remove"'
                    placeholder='Informe o Nome do Categoria'
                />
            </b-form-group>
            
            <b-form-group label='Categoria pai: ' label-for='category-parentId'>
                <b-form-select id='category-parentId' v-if='mode === "save"'
                    :options='categories' v-model='category.parentId' 
                />
                <b-form-input v-else 
                    id='category-parendId' type='text'
                    v-model='category.path'
                    readonly
                />  
            </b-form-group>
    
            <b-button variant='primary' v-if='mode === "save"' @click='save'>Salvar</b-button>
            <b-button variant='danger' v-if='mode === "remove"' @click='remove'>Excluir</b-button>
            <b-button class='ml-2' @click='reset'>Cancelar</b-button>
                
        </b-form>
        <hr/>

        <Search @toSearch="toSearch" />

        <b-table hoved striped :items='categories' :fields='fields'>
            <template slot='actions' slot-scope='data'>
                <b-button variant='warning' @click='loadCategory(data.item)' class='mr-2'>
                    <i class="fa fa-pencil"></i>
                </b-button>

                <b-button variant='danger' @click='loadCategory(data.item, "remove")' class='mr-2'>
                    <i class="fa fa-trash"></i>
                </b-button>
            </template>
        </b-table>
    </div>
</template>

<script>
import axios from 'axios'
import { baseApiUrl, showError } from '@/global'
import Search from '@/components/template/Search';


export default {
    name: 'CategoryAdmin',
    components: {Search},
    data () {
        return {
            mode: 'save',
            search: '',
            category: {},
            categories: [],
            fields: [
                {key: 'id', label: 'Código', sortable: true},
                {key: 'name', label: 'Nome', sortable: true},
                {key: 'path', label: 'Caminho', sortable: true},
                {key: 'actions', label: 'Ações'}
            ]
        }
    },
    methods: {
        loadCategories() {
            const search = this.search ? `?search=${this.search}` : ''

            const url = `${baseApiUrl}/categories${search}`;
            axios.get(url).then(res => {
                this.categories = res.data.map(category => {
                    return {...category, value: category.id, text: category.path}
                })            
            })
        },
        save () {
            const method = this.category.id ? 'put' : 'post'
            const id = this.category.id ? `/${this.category.id}` : ''
            axios[method](`${baseApiUrl}/categories${id}`, this.category).then(() => {
                this.$toasted.global.defaultSuccess()
                this.reset()
            }).catch(showError)
        },
        reset () {
            this.mode = 'save'
            this.category = {}
            this.loadCategories()
        },
        remove () {
            const id = this.category.id
            axios.delete(`${baseApiUrl}/categories/${id}`)
                .then(() => {
                    this.$toasted.global.defaultSuccess()
                    this.reset()
                }).catch(showError)
        },
        loadCategory (category, mode= 'save') {
            this.mode = mode
            this.category = {...category}
        },
        toSearch (search) {
            this.search = search;
            this.loadCategories();
        }
    },
    mounted () {
        this.loadCategories()
    }
}
</script>

<style>

</style>
