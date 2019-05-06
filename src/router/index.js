import Vue from 'vue'
import Router from 'vue-router'
import home from '@/components/home'
import shop from '@/components/shop'
import contacts from '@/components/contacts'
import about from '@/components/about'
import login from '@/components/login'
import add from '@/components/add'
import add_photo from '@/components/add_photo'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/shop',
      name: 'shop',
      component: shop
    },
    {
      path: '/contacts',
      name: 'contacts',
      component: contacts
    },
    {
      path: '/about',
      name: 'about',
      component: about
    },
    {
      path: '/login',
      name: 'login',
      component: login
    },
    {
      path: '/add',
      name: 'add',
      component: add
    },
    {
      path: '/add_photo',
      name: 'add_photo',
      component: add_photo
    },
  ]
})
