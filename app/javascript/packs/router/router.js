import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';

import SourceIndex from '../components/sources/Index.vue';
import SourceCreate from '../components/sources/Create.vue';
import SourceShow from '../components/sources/Show.vue';
import SourceEdit from '../components/sources/Edit.vue';

Vue.use(VueRouter)

export default new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: Index },
        { path: '/about', component: About },
        { path: '/contact', component: Contact },
        { path: '/sources', component: SourceIndex },
        { path: '/sources/new', component: SourceCreate },
        { path: '/sources/:id', component: SourceShow, name: 'sources_show'},
        { path: '/sources/:id/edit', component: SourceEdit, name: 'sources_edits'},
    ]
})