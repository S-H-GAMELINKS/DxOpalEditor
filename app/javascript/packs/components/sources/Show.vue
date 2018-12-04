<template>
    <div class="container">
        <h1><p> Name: {{name}} </p></h1>

        <h2><p> Code </p></h2>
        <p>{{code}}</p>

        <h2><p> Game </p></h2>
        <script type="text/ruby">
            DXOpal.dump_error{ require_remote 'main' }
        </script>

        <canvas id="dxopal-canvas"></canvas>
        <div id="dxopal-errors"></div>
        <input type='button' id='pause' value='Pause/Resume'>
    </div>
</template>

<script>
import axios from 'axios';
import $ from 'jquery';

export default {
    data: function() {
        return {
            name: "",
            code: ""
        }
    },
    mounted: function() {
        this.getSource();
    },
    methods: {
        getSource: function() {
            const id = String(this.$route.path).replace(/\/sources\//, '');
            axios.get('/api/sources/' + id).then((response) => {
                this.name = response.data.name;
                this.code = response.data.code;
            }, (error) => {
                alert(error);
            })
        }
    }
}
</script>