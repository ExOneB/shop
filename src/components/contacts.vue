<template>
    <main-layout>
        <div>
            <h1>Контакты</h1>
            <main class="main" v-if="!id">
                <h2>Контактные данные филиалов Nike по городу Вологда</h2>
                <div v-for="item in posts" @click="shop(item.id, item.adres, item.email, item['phonesArr'], item['timesArr'], item.long, item.lat, item.img, item['imagesArr'])" class="shop"
                     :style="{ 'background-image': 'url('+item.img+')' }">
                    <div class="title">
                        <a>{{ item.adres }}</a>
                    </div>
                </div>
            </main>
            <main v-else>
                <h4 style="color: red;" @click="id = null">Назад</h4>
                <h2>{{ adres }}</h2>
                <flickity ref="flickity" :options="flickityOptions">
                    <img :src="img"
                         width="100%" height="400px" alt="" class="carousel-cell">
                    <img v-for="item in imageArr" :src="item.img" width="100%" height="400px" alt="" class="carousel-cell">
                </flickity>
                <div style="padding-top: 50px">
                    <div class="phone">
                        <i class="fas fa-phone-square"> Телефоны:</i>
                        <div v-for="item in phoneArr">
                            <a :href="'tel:'+item.phone"> {{ item.phone }} </a>
                            <br>
                        </div>
                    </div>
                    <br>
                    <div class="time">
                        <i class="fas fa-clock"> Часы работы:</i>
                        <div v-for="item in timeArr">
                            <p>{{ item.time }}</p>
                        </div>
                    </div>
                    <br>
                    <div class="email">
                        <i class="fas fa-envelope-open-text"> Email:</i>
                        <div>
                            <a :href="'mailto:'+email"> {{ email }} </a>
                        </div>
                    </div>
                    <div>
                        <yandex-map
                                :coords="[lat, long]"
                                zoom="11"
                                style="width: 100%; height: 600px;"
                                :cluster-options="{
    1: {clusterDisableClickZoom: true}
  }"
                                :behaviors="['default']"
                                :controls="['trafficControl']"
                                :placemarks="placemarks"
                                @map-was-initialized="initHandler"
                        >

                            <ymap-marker
                                    marker-type="placemark"
                                    :coords="[lat, long]"
                                    hint-content="Hint content 1"
                                    :balloon="{header: adres, body: email}"
                                    :icon="{color: 'green'}"
                                    cluster-name="1"
                            ></ymap-marker>

                        </yandex-map>
                    </div>
                </div>

            </main>
        </div>
    </main-layout>
</template>

<script>
    import mainLayout from '@/layout/mainLayout';
    import Flickity from 'vue-flickity';
    import {yandexMap, ymapMarker} from 'vue-yandex-maps'

    export default {
        name: 'contacts',
        components: {
            mainLayout,
            Flickity,
            yandexMap,
            ymapMarker,
        },
        data() {
            return {
                flickityOptions: {
                    prevNextButtons: true,
                    pageDots: true,
                    wrapAround: true
                },
                id: null,
                posts: [],
                adres: '',
                email: '',
                long: '',
                lat: '',
                phoneArr: [],
                timeArr: [],
                imageArr: [],
                img: '',
            }
        },
        methods: {
            contacts: function () {
                const formData = {
                    func: 'app_api_contacts',
                };
                this.$http.post(this.$root.url, formData, {emulateJSON: true}).then(response => {
                    this.posts = response.body.data;
                    console.log(response.body.data);
                }, response => {
                    console.error(response.body);
                });
            },
            shop: function (idArr, adres, email, pArr, tArr,long,lat,img, iArr) {
                this.id = idArr;
                this.adres = adres;
                this.email = email;
                this.phoneArr = pArr;
                this.timeArr = tArr;
                this.long = long;
                this.lat = lat;
                this.img = img;
                this.imageArr = iArr;
            },
            next() {
                this.$refs.flickity.next();
            },

            previous() {
                this.$refs.flickity.previous();
            },
        },

        created() {
           this.contacts();
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    * {
        background: #fff;
    }

    .title {
        padding: 37px;
        border-radius: 20px;
        background: #000;
        opacity: 0.5;
    }

    .shop {

        background: black;
        border-radius: 20px;
        margin: 20px auto;
        height: 100px;
        width: 90%;
    }

    .main a {
        background: #000;
        font-size: 20px;
        font-weight: 800;
        color: #fff;
        text-decoration: none;
    }

    .phone a {
        color: red;
        font-weight: 800;
        text-decoration: none;
    }

    .email a {
        color: red;
        font-weight: 800;
        text-decoration: none;
    }
</style>
