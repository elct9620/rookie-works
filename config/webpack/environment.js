const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const erb =  require('./loaders/erb')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
environment.loaders.append('erb', erb)
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment
