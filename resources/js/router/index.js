import {
    createRouter,
    createWebHistory
} from 'vue-router'
import login from '../components/login'
import logout from '../components/logout'
import clients from '../components/clients'
import store from '../store/index'

const routes = [{
        name: 'login',
        path: '/',
        component: login
    },
    {
        name: 'logout',
        path: '/logout',
        component: logout,
        meta: {
            requiresAuth: true
        }
    },
    {
        name: 'clients',
        path: '/clients',
        component: clients,
        meta: {
            requiresAuth: true
        }
    },
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!store.getters.isLoggedIn) {
            next('/')
        } else {
            next()
        }
    } else {
        next();
    }
})

export default router