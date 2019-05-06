<template>
    <div>
        <main v-if="add === false">
            <br>
            <i @click="add = true" style="font-size: 30px; font-weight: 800; color: #000000" class="fas fa-plus-square"> Добавить магазин</i>
            <div v-for="item in posts" @click="pushPhoto(item.id)"><p>{{ item.adres }}</p><p style="font-size: 10px; margin-top: -16px; color: green">Добафить фотографии офиса</p></div>
            <h3 style="color: red" @click="mainPush()">Вернуться на главную</h3>
            <br>
        </main>
        <main v-else>
            <h1>Админ-панель</h1>
            <h3 @click="add = false">Назад</h3>
            <h2>Добавление магазина</h2>
            <input v-model="adres" type="text" placeholder="Адрес">
            <input v-for="(find, index) in phoneArr" v-model="find.value" type="text" :placeholder="'Телефон №' + index"> <p class="math minus"  v-if="phoneArr.length > 1" @click="delFind"> Убрать телефон </p> <p class="math" @click="addFind">Добавить еще телефон</p>
            <input v-for="item in timeArr" v-model="item.value" type="text" placeholder="Время работы"> <p class="math minus" v-if="timeArr.length > 1" @click="timeDel"> Убрать время </p> <p class="math" @click="timeAdd">Добавить другое время</p>
            <input v-model="email" type="text" placeholder="Email">
            <input type="file" accept="image/jpeg" @change="fileSelected" multiple>
            <h2 @click="adders()">Добавить магазин</h2>
        </main>
    </div>
</template>

<script>
    import mainLayout from '@/layout/mainLayout';

    export default {
        name: 'add',
        components: {
            mainLayout
        },
        data() {
            return {
                posts: [],
                adres: '',
                email: '',
                add: false,
                phoneArr: [{value: ''}],
                timeArr: [{value: ''}],
                img: '',
                imgArr: [],
            }
        },
        methods: {
            pushPhoto: function(id){
                const ids = id;
                this.$router.push({name: 'add_photo', params: {ids}})
            },
            imgAdd: function () {
                this.imgArr.push({ value: '' });
            },
            imgDel: function () {
                this.imgArr.splice(this.imgArr.length-1, 1)
            },
            timeAdd: function () {
                this.timeArr.push({ value: '' });
            },
            timeDel: function () {
                this.timeArr.splice(this.timeArr.length-1, 1)
            },
            addFind: function () {
                this.phoneArr.push({ value: '' });
            },
            delFind: function () {
                this.phoneArr.splice(this.phoneArr.length-1, 1)
            },
            adders: function () {
                var jsonString = JSON.stringify(this.phoneArr);
                var jsonStringTime = JSON.stringify(this.timeArr);
                let formData = new FormData();
                formData.append('func','app_api_add');
                formData.append('adres',this.adres);
                formData.append('phone',jsonString);
                formData.append('time',jsonStringTime);
                formData.append('email',this.email);
                formData.append('File',this.img);
                this.$http.post(this.$root.url, formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    }).then(response => {
                    console.log(response);
                    this.phoneArr = [{value: ''}];
                    this.timeArr = [{value: ''}];
                    this.add = false;
                }, response => {
                    console.error(response.body);
                });
            },
            mainPush: function () {
                this.$root.activeIndex = 0;
                this.$router.push('/')
            },
            fileSelected:function($event){
                this.img =$event.target.files[0];
                console.log(this.img);
            },
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
        },
        created() {
            this.contacts();
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    * {
        color: #000;
    }

    body {

    }

    main {
        background: #fff;
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
    .math{
        color: #fff;
        font-weight: 800;
        width: 200px;
        margin: 10px auto;
        border-radius: 20px;
        padding: 5px;
        background: green;
    }

    .math.minus {
        background: red;
    }

    @media screen and (max-width: 440px) {
        h1 {
            font-size: 20px;
        }
    }

</style>
