<template>
    <div>
        <div class="container">
            <p v-for="(source, key, index) in sources" :key=index>
                <router-link :to="{name: 'sources_show', params: {id: source.id}}">{{source.name}}</router-link>
                <router-link :to="{name: 'sources_edits', params: {id: source.id}}" >Edit</router-link>
            </p>
            <router-link to="/sources/new" >New</router-link>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import $ from 'jquery';

export default {
    data: function() {
        return {
            sources: []
        }
    },
    mounted: function() {
        this.getSources();
    },
    methods: {
        getSources: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/sources').then((response) => {
                for(var i = 0; i < response.data.length; i++) {
                    this.sources.push(response.data[i]);
                }
            }, (error) => {
                console.log(error);
            })
        },
    }
}
</script>