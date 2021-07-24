<template>
    <div>
        <PageTitle icon='fa fa-home' main='Dashboard' sub='Base de conhecimento'/>
        <div class='stats'>
            <Stat title='Categorias' 
                :value='stat.categories' 
                icon='fa fa-folder' 
                color='#d54d50' />

            <Stat title='Artigos' 
                :value='stat.articles' 
                icon='fa fa-folder' 
                color='#3bc480' />

            <Stat title='Categorias' 
                :value='stat.users' 
                icon='fa fa-folder' 
                color='#3282cd' />
        </div>
    </div>
</template>

<script>
import PageTitle from '../template/PageTitle'
import Stat from './Stat'
import axios from 'axios'
import { baseApiUrl } from '@/global'

export default {
    name: 'Home',
    components: { PageTitle, Stat },
    data: function () {
        return {
            stat: {}
        }
    },
    created () {
        this.getStats()
    },
    methods: {
        getStats() {
            axios.get(`${baseApiUrl}/stats`)
                .then(res => this.stat = res.data)
        }
    }

}
</script>

<style>
    .stats {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
</style>
