import {
    createRouter,
    createWebHistory
} from 'vue-router'
import login from '../components/login'
import logout from '../components/logout'

const routes = [{
        name: 'login',
        path: '/',
        component: login
    },
    {
        name: 'logout',
        path: '/logout',
        component: logout
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router