<template>
    <div>
        <div class="login">
            <h1>Авторизация</h1>
            <p style="color: red;">{{ error }}</p>
            <p>(login: admin, password: admin)</p>
            <input v-model="login" type="text" placeholder="login">
            <input v-model="password" type="password" placeholder="password">
            <br>
            <h2 @click="auth()">Войти</h2>
            <h4 @click="mainPush()">Отмена</h4>
        </div>
    </div>
</template>

<script>
    import mainLayout from '@/layout/mainLayout';

    export default {
        name: 'login',
        components: {
            mainLayout
        },
        data() {
            return {
                login: '',
                password: '',
                posts: [],
                error: '',
            }
        },
        methods: {
            auth: function () {
                const formData = {
                    func: 'app_api_auth',
                    login: this.login,
                    password: this.password,
                };
                this.$http.post(this.$root.url, formData, {emulateJSON: true}).then(response => {
                    console.log(response.body);
                    if (!response.body.error) {
                        localStorage.token = response.body.data;
                        this.$router.push('add')
                    } else {
                        this.error = 'Такого пользователя нету';
                    }
                }, response => {
                    console.error(response.body);
                });
            },
            mainPush: function () {
                this.$root.activeIndex = 0;
                this.$router.push('/')
            }
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    * {
        color: #000;
    }

    body{

    }

    .login{
        padding: 20px;
        margin: 10% auto;
        width: 50%;
        background: #fff;
        border-radius: 20px;
    }

    a {
        text-decoration: none;
    }

    input {
        outline: none;
        font-size: 20px;
        color: #000;
        text-align: center;
        border-radius: 20px;
        margin: 10px;
        height: 30px;
        width: 90%;
    }

    h4 {
        color: red;
    }

    @media screen and (max-width: 440px) {
        h1{
            font-size: 20px;
        }
    }

</style>
