import {
    createStore
} from 'vuex'
import auth from './modules/auth'
import client from './modules/client'

export default createStore({
    modules: {
        auth,
        client
    }
})