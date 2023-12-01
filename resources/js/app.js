require('./bootstrap');
import {
    createApp
} from 'vue'
import navbar from './components/navbar'
import bootstrap from 'bootstrap/dist/css/bootstrap.min.css'
import router from './router/index'
import store from './store/index'
import {
    library
} from '@fortawesome/fontawesome-svg-core'
import {
    fas
} from '@fortawesome/free-solid-svg-icons'
import {
    FontAwesomeIcon
} from '@fortawesome/vue-fontawesome'

library.add(fas)
const app = createApp({})
app.component('navbar', navbar)
    .component('FontAwesomeIcon', FontAwesomeIcon)
    .use(bootstrap)
    .use(router)
    .use(store)


app.mount('#app')