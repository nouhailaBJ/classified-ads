<template>
    <div>
        <div  v-if="$gate.isAuth()">
            load
        </div>
        <div  v-if="!$gate.isAuth()">
            not load
        </div>
    </div>
    
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
