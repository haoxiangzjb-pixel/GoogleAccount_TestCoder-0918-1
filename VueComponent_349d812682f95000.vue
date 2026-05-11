<template>
  <div class="data-container">
    <h1>Datos Cargados</h1>
    <div v-if="loading">Cargando datos...</div>
    <div v-else-if="error" class="error">{{ error }}</div>
    <div v-else>
      <ul>
        <li v-for="item in data" :key="item.id">
          {{ item.name }}
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'VueComponent',
  data() {
    return {
      data: [],
      loading: false,
      error: null
    }
  },
  created() {
    this.loadData()
  },
  methods: {
    async loadData() {
      this.loading = true
      this.error = null
      
      try {
        // Simulación de carga de datos (puedes reemplazar con una llamada API real)
        const response = await fetch('https://jsonplaceholder.typicode.com/users')
        
        if (!response.ok) {
          throw new Error('Error al cargar los datos')
        }
        
        this.data = await response.json()
      } catch (err) {
        this.error = err.message
      } finally {
        this.loading = false
      }
    }
  }
}
</script>

<style scoped>
.data-container {
  padding: 20px;
  font-family: Arial, sans-serif;
}

.error {
  color: red;
  font-weight: bold;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  padding: 8px 0;
  border-bottom: 1px solid #eee;
}
</style>
