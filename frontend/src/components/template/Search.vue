<template>
    <div class="box-search">
        <input type="text" 
            v-model='search' 
            @keyup="toSearch" 
            class="form-control"
            :placeholder="placeholder"
        />
        <i @click="clear" class="fa fa-trash"></i>
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
        }, 1000),
        clear () {
            this.search = '';
            this.$emit('toSearch', this.search.trim());
        }
    }
}
</script>
<style>
    .box-search {
        position: relative;
        padding: 1% 0%;
        display: flex;
        justify-content: flex-end;
    }
    .box-search .form-control {
        max-width: 250px;
    }

    .box-search .fa-trash {
        position: absolute;
        right: 5px;
        top: 25px;
        cursor: pointer;
    }
</style>
