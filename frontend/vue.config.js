
const baseUrl = ['production'].includes(process.env.NODE_ENV)
    ? 'http://192.168.1.108/studies'
    : '';

module.exports = {
    baseUrl
}