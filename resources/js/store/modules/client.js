import axios from 'axios'

export default {
    state: {
        clients: [],
    },
    getters: {
        allTheClients(state) {
            return state.clients
        },
    },
    mutations: {
        getAllClients(state, clients) {
            state.clients = clients;
        }
    },
    actions: {
        /**
         * Gets all the clients from the database 
         * @param {*} param0 
         */
        getAllClient({
            commit
        }) {
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token');
            return new Promise((resolve, reject) => {
                axios.get('api/clients')
                    .then((response) => {
                        commit('getAllClients', response.data.clients)
                        resolve(response)
                    })
                    .catch((error) => {
                        reject(error)
                    })
            })
        },
        /**
         * filters client details base on phone,email,
         * @param {*} param0 
         * @param {*} filter 
         */
        filterClient({
            commit
        }, filter) {
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token');
            return new Promise((resolve, reject) => {
                axios.post('api/client_search', {
                        filter: filter
                    })
                    .then((response) => {
                        resolve(response);
                    })
                    .catch((error) => {
                        reject(error)
                    })
            })
        },
    }
}