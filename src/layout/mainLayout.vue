<template>
    <div>
        <header :style="{ height: headerLenght+'px' }">
            <div class="logo">
                <img src="./../assets/images/logo.png" alt="">
                <a>NIKE</a>
            </div>
            <nav>
                <a @click="menu()" class="icon"><i class="fas fa-ellipsis-h"></i></a>
                <div class="top" :class="{ 'respons': respons }">
                    <a v-for="(item, index) in $root.navArr" @click="routers(indexs = index, href = item.href)" :to=item.href
                       :class="{ 'active': index === $root.activeIndex }">{{ item.title }}</a>
                </div>
            </nav>
        </header>
        <slot></slot>
        <footer>
            <router-link style="color: #ae001d" to="login">Админ панель </router-link><a href="https://vk.com/exoneb">| by Maxim Pyatovskiy</a>
        </footer>
    </div>
</template>

<script>
    export default {
        name: 'mainLayout',
        data() {
            return {
                respons: false,
                headerLenght: 25,
                windowWidth: window.innerWidth
            }
        },
        methods: {
            menu: function () {
                this.respons = !this.respons;
                if (this.respons) {
                    this.headerLenght = this.$root.navArr.length * 60
                } else {
                    this.headerLenght = 25
                }
            },
            routers: function (idnexs, href) {
                this.$root.activeIndex = idnexs;
                this.$router.push(href)
            }
        },
        mounted() {
            window.onresize = () => {
                this.windowWidth = window.innerWidth;
                if (this.windowWidth >= 600) {
                    this.headerLenght = 25;
                    this.respons = false;
                }
            };
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    header {
        height: 25px;
        padding: 16px;
        overflow: hidden;
        background: #333;
        color: #fff;
        font-size: 20px;
        text-align: center;
    }
    footer {
        height: 40px;
        padding: 16px;
        overflow: hidden;
        background: #333;
        font-size: 20px;
        text-align: center;
    }
    footer a{
        color: #fff;
        text-decoration: none;
    }

    .logo {
        font-weight: 800;
        float: left;
    }

    .logo img {
        filter: invert(1);
        height: 20px;
    }

    .logo:hover {
        filter: invert(1);
    }

    .top {
        float: right;
    }

    .top a {
        color: #fff;
        text-decoration: none;
        padding: 8px 16px;
    }

    .top a.active {
        border-bottom: 3px solid #fff;
    }

    .icon {
        color: #fff;
        text-decoration: none;
        padding: 8px 16px;
        float: right;
        display: none;
    }

    @media screen and (max-width: 600px) {
        .top a {
            display: none;
        }

        .top a.active {
            border-bottom: none;
            border-left: 3px solid #fff;
        }

        .icon {
            margin-top: -14px;
            font-size: 30px;
            display: block;
        }

        .top.respons {
            position: relative;
            top: 50px;
            float: left;
            left: -120px;
        }

        .top.respons a.icon {
            position: absolute;
            top: -50px;
        }

        .top.respons a {
            width: 100%;
            text-align: left;
            display: block;
        }
    }

    @media screen and (max-width: 327px) {
        .top.respons {
            padding-top: 20px;
            position: inherit;
        }
    }
</style>
