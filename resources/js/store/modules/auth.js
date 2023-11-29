import axios from 'axios'

export default {
    state: {
        $token: localStorage.getItem('access_token') || null,
        $user: localStorage.getItem('user') || null,
    },
    getters: {
        isLoggedIn(state) {
            if (state.$token !== null) {
                return true;
            } else {
                return false;
            }
        },
        isCurrentUser(state) {
            if (state.$user !== null) {
                return state.$user;
            } else {
                return null;
            }
        },
    },
    mutations: {
        userLogin(state, token) {
            state.$token = token;
        },
        logoutUser(state) {
            state.$token = null;
            state.$user = null;
        },
        currentUsername(state, username) {
            state.$user = username;
        },
    },
    actions: {
        /**
         *
         *  Logs the user in
         * @param input
         * @return token
         * 
         */
        login({
            commit
        }, input) {
            return new Promise((resolve, reject) => {
                axios.post('api/login', {
                        email: input.email,
                        password: input.password
                    })
                    .then((response) => {
                        const token = response.data.token;
                        localStorage.setItem('access_token', token);
                        commit('userLogin', token);
                        resolve(response)
                    })
                    .catch((error) => {
                        reject(error)
                    })
            })
        },
        /**
         * logs the user out 
         */
        logout({
            commit
        }) {
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.state.auth.$token;
            return new Promise((resolve, reject) => {
                axios.post('api/logout', {})
                    .then((response) => {
                        localStorage.removeItem('access_token');
                        localStorage.removeItem('user');
                        commit('logoutUser');
                        resolve(response);
                    })
                    .catch((error) => {
                        localStorage.removeItem('access_token');
                        localStorage.removeItem('user');
                        reject(error);
                    })
            })
        },

        /**
         * gets the current user name
         * @param {*} param0 
         */
        getCurrentUser({
            commit
        }) {
            axios.defaults.headers.common['Authorization'] = 'Bearer ' + this.state.auth.$token;
            return new Promise((resolve, reject) => {
                axios.get('api/user')
                    .then((response) => {
                        const username = response.data.name;
                        localStorage.setItem('user', username);
                        commit('currentUsername', username);
                        resolve(response);
                    })
                    .catch((error) => {
                        reject(error);
                    })
            })
        },

    },
}