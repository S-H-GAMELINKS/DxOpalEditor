<template>
    <div class="container">
        <form>
            <div class="form-group">
                <label>Name</label>
                <input class="form-control" v-model="name" placeholder="Input your Source name ......">
            </div>
            <div class="form-group">
                <label>Code</label>
                <editor v-model="code" @init="editorInit" lang="ruby" theme="chrome" width="500" height="100"></editor>
            </div>
        </form>
        <p>
            <button type="button" class="btn btn-primary" v-if="creatable" v-on:click="createSource">Create</button>
            <button type="button" class="btn btn-primary" v-if="editable" v-on:click="editSource">Update</button>
        </p>
    </div>
</template>

<script>
import axios from 'axios';
import $ from 'jquery';

export default {
    data: function() {
        return {
            name: "",
            code: "",
            creatable: false,
            editable: false
        }
    },
    components: {
        editor: require('vue2-ace-editor')
    },
    mounted: function() {
        this.checkAddress();
        if(this.editable) {
            this.getSource();
        }
    },
    methods: {
        editorInit: function () {
            require('brace/ext/language_tools') //language extension prerequsite...
            require('brace/mode/html')                
            require('brace/mode/ruby')    //language
            require('brace/mode/less')
            require('brace/theme/chrome')
            require('brace/snippets/ruby') //snippet
        },
        checkAddress: function() {
            const url = String(this.$route.path);
            if(url.match(/edit/)) {
                this.editable = true;
            } else {
                this.creatable = true;
            }
        },
        getSource: function() {
            const id = String(this.$route.path).replace(/\/sources\//, '').replace(/\/edit/, '');

            axios.get('/api/sources/' + id).then((response) => {
                this.name = response.data.name;
                this.code = response.data.code;
            }, (error) => {
                alert(error);
            })
        },
        createSource: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            axios.post('/api/sources', {source: {name: this.name, code: this.code}}).then((response) => {
                if (this.name === "" || this.code === "") {
                    alert("Can't be black in Name or Code!!");
                } else {
                    alert("Success!");
                    this.$router.push({path: '/sources'});
                }
            }, (error) => {
                alert(error);
            })
        },
        editSource: function() {
            axios.defaults.headers['X-CSRF-TOKEN'] = $('meta[name=csrf-token]').attr('content');
            axios.defaults.headers['content-type'] = 'application/json';

            const id = String(this.$route.path).replace(/\/sources\//, '').replace(/\/edit/, '');
            
            axios.put('/api/sources/' + id, {source: {name: this.name, code: this.code}}).then((response) => {
                if (this.name === "" || this.code === "") {
                    alert("Can't be black in Name or Code!!");
                } else {
                    alert("Success!");
                    this.$router.push({path: '/sources'});
                }
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>