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
        },
        addNewClient(state, client) {
            state.clients.unshift(client);
        },
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
        /**
         * adds new client
         * @param {*} param0 
         * @param {*} input 
         */
        addNewClient({ commit }, input) {
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + localStorage.getItem('access_token');
            return new Promise((resolve, reject) => {
                axios.post('api/client', {
                        id_number: input.id_number,
                        date_of_birth: input.date_of_birth,
                        first_name: input.first_name,
                        last_name: input.last_name,
                        telephone: input.telephone,
                        email: input.email,
                        status: input.status
                    })
                    .then((response) => {
                        commit('addNewClient', response.data.client)
                        resolve(response);
                    })
                    .catch((error) => {
                        reject(error)
                    })
            })
        },
    }
}