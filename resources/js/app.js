require('./bootstrap');
import {
    createApp
} from 'vue'
import navbar from './components/navbar'
import bootstrap from 'bootstrap/dist/css/bootstrap.min.css'
import router from './router/index'
import store from './store/index'

const app = createApp({})
app.component('navbar', navbar)
    .use(bootstrap)
    .use(router)
    .use(store)


app.mount('#app')