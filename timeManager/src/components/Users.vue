<script>
export default {
  data() {
    return {
      user: '',
      selected: false
    }
  }
}
</script>

<script setup>
</script>



<template>
    <div>
        <div v-if="selected">
            <p>Bienvenue: {{user}}</p>
        </div>
        <div>
            <p>Select an user:</p>
            <select v-model="user" @change="selected=true">
                <option disabled value="">Please select one</option>
                <option>A</option>
                <option>B</option>
                <option>C</option>
            </select>
        </div>

    </div>
</template>

<style scoped>

</style>
