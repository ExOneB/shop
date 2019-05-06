<template>
    <main-layout>
    <div>
        <h1>Тут должна быть какая-то страница</h1>
    </div>
    </main-layout>
</template>

<script>
    import mainLayout from '@/layout/mainLayout';
    export default {
        name: 'home',
        components: {
            mainLayout
        },
        data() {
            return {}
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
*{
    background: #fff;
}
</style>
