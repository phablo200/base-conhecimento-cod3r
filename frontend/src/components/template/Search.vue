<template>
    <div class="box-search">
        <input type="text" 
            v-model='search' 
            @keyup="toSearch" 
            class="form-control"
            :placeholder="placeholder"
        />
    </div>
</template>

<script>
import { debounce } from 'lodash';
export default {
    name: 'Search',
    props: {
        placeholder: {
            default: 'Pesquisar...'
        }
    },
    data () {
        return {
            search: ''
        }
    },
    methods: {
        toSearch: debounce(function () {
            this.$emit('toSearch', this.search.trim());
        }, 1000)
    }
}
</script>
<style>
    .box-search {
        padding: 1% 0%;
        display: flex;
        justify-content: flex-end;
    }
    .box-search .form-control {
        max-width: 250px;
    }
</style>
