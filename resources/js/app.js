require('./bootstrap');
window.Vue = require('vue');

// Vue Router
import VueRouter from 'vue-router'
Vue.use(VueRouter)

import Gate from "./Gate";
Vue.prototype.$gate = new Gate(window.user);
let routes = [
    { path: '/admin/home', component:  () => import("./components/Dashboard") },
    { path: '/admin/users', component:  () => import("./components/Users") },
    { path: '/admin/products', component:  () => import("./components/Products") },
    { path: '/admin/media', component:  () => import("./components/Media") },
    { path: '/admin/categories', component:  () => import("./components/Categories") },
    { path: '/admin/todo', component:  () => import("./components/Todo") },
    { path: '/admin/blogs', component:  () => import("./components/Blogs") },
    { path: '/admin/pages', component:  () => import("./components/Page") },
    { path: '/admin/calender', component:  () => import("./components/Calender") },
    { path: '/admin/messages', component:  () => import("./components/Messages") },
    { path: '/admin/settings', component:  () => import("./components/Setting") },
    { path: '/admin/profile', component:  () => import("./components/Profile") },
    { path: '/admin/devolopper', component:  () => import("./components/Devolopper") },
    { path: '/admin/location', component:  () => import("./components/Location") },
    { path: '/admin/*', component: () => import("./components/404")  },

    //site path
    { path: '/', component: () => import("./components/view/Home")  },
    { path: '/home', component: () => import("./components/view/ExampleComponent")  },
    { path: '/blog/:id', component: () => import("./components/view/Blog")  },
    { path: '/blogs', component: () => import("./components/view/Blogs")  },
    { path: '/category/:id', component: () => import("./components/view/Category")  },
    { path: '/page/:id', component: () => import("./components/view/Page")  },
    { path: '/contact', component: () => import("./components/view/Contact")  },
    { path: '/signin', component: () => import("./components/view/Signin")  },
    { path: '/addProduct', component: () => import("./components/view/AddProduct")  },
    { path: '/thanks', component: () => import("./components/view/Thanks")  },
    { path: '/profile', component: () => import("./components/view/Profile")  },
    { path: '/announces', component: () => import("./components/view/Announce")  },
    { path: '/messenger', component: () => import("./components/view/Messenger")  },
    { path: '*', component: () => import("./components/view/notFound")  }
  ]

const router = new VueRouter({
    mode: 'history',
    routes // short for `routes: routes`
  })
// end vue router

// vform

import { Form, HasError, AlertError } from 'vform'

window.Form = Form;

Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

// end vform

// moment and filters

import moment from 'moment';
Vue.filter('myDate',function(created){
  return moment(created).format('MMMM Do YYYY');
});
Vue.filter('myDay',function(created){
  return moment(created).format('MMMM Do YYYY, h:mm a')
});
Vue.filter('truncate', function (text, stop, clamp) {
  return text.slice(0, stop) + (stop < text.length ? clamp || '...' : '')
})
Vue.filter('striphtml', function (value) {
  var div = document.createElement("div");
  div.innerHTML = value;
  var text = div.textContent || div.innerText || "";
  return text;
});
// end moment and filters

// progresser when upload
import VueProgressBar from 'vue-progressbar'

Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '2px'
})

// end progresser when upload

// sweetalert
import Swal from 'sweetalert2'

window.Swal = Swal;

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  onOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
})

window.Toast = Toast;

// event
let Fire = new Vue();
window.Fire = Fire;

//pagination
Vue.component('pagination', require('laravel-vue-pagination'));
Vue.component(
  'passport-clients',
  require('./components/passport/Clients.vue').default
);

Vue.component(
  'passport-authorized-clients',
  require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
  'passport-personal-access-tokens',
  require('./components/passport/PersonalAccessTokens.vue').default
);

Vue.component(
  'not-found',
  require('./components/view/notFound.vue').default
);
Vue.component(
  'user-login',
  require('./components/view/ExampleComponent').default
);
// editor
import CKEditor from 'ckeditor4-vue';
Vue.use( CKEditor );

//  caresoul
import VueAgile from 'vue-agile'

Vue.use(VueAgile)

///scroll
import VueChatScroll from 'vue-chat-scroll'
Vue.use(VueChatScroll)

const app = new Vue({
    el: '#app',
    router,
    data: {
      search: '',
      getsetting: '',
    },
    methods:
    {
      getSetting(namesite)
      {
           axios.get("/api/getsetting/"+namesite).then(({data}) => (this.getsetting = data));
           return this.getsetting;
      },
      searchit: _.debounce(() => {
        Fire.$emit('searching');
      }, 1000)
    }
});
