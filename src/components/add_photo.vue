<template>
    <div>
        <main>
            <br>
            <i style="font-size: 30px; font-weight: 800; color: #000000" class="fas fa-plus-square"> Добавление фотографии офиса</i>
            <h3 @click="mainPush()">Вернуться назад</h3>
            <input type="file" accept="image/jpeg" @change="fileSelected" multiple>
            <h2 @click="adders()">Добавить фото</h2>
            <br>
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
                id: this.$route.params.ids,
                img: '',
            }
        },
        methods: {

            adders: function () {
                let formData = new FormData();
                formData.append('func','app_api_photo');
                formData.append('id',this.id);
                formData.append('File',this.img);
                this.$http.post(this.$root.url, formData,
                    {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    }).then(response => {
                    console.log(response);
                }, response => {
                    console.error(response.body);
                });
            },
            mainPush: function () {
                this.$root.activeIndex = 0;
                this.$router.push('/add')
            },
            fileSelected:function($event){
                this.img =$event.target.files[0];

            },
        },
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
