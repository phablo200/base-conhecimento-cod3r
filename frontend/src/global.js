import Vue from 'vue'
export const userKey = '_knowledge_user'
export const baseApiUrl = ['production'].includes(process.env.NODE_ENV)
    ? 'http://192.168.1.108:3005'
    : 'http://localhost:3005';

export function showError(e) {
    if (e && e.response && e.response.data) {
        Vue.toasted.global.defaultError({ msg: e.response.data })
    } else if (typeof e === 'string') {
        Vue.toasted.global.defaultError({ msg: e }) 
    } else {
        Vue.toasted.global.defaultError()
    }
}

export default { baseApiUrl, showError, userKey }

