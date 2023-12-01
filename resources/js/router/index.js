import {
    createRouter,
    createWebHistory
} from 'vue-router'
import login from '../components/login'
import logout from '../components/logout'
import clients from '../components/clients'

const routes = [{
        name: 'login',
        path: '/',
        component: login
    },
    {
        name: 'logout',
        path: '/logout',
        component: logout,
    },
    {
        name: 'clients',
        path: '/clients',
        component: clients,
    },
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})



export default router