<template>
  <div class="filter-container">
    <h2>Filtro de Lista</h2>
    
    <!-- Campo de busca -->
    <input 
      v-model="searchTerm" 
      type="text" 
      placeholder="Digite para filtrar..."
      class="search-input"
    />

    <!-- Lista filtrada -->
    <ul class="items-list">
      <li v-for="item in filteredList" :key="item.id" class="list-item">
        {{ item.name }}
      </li>
    </ul>

    <!-- Mensagem quando não há resultados -->
    <p v-if="filteredList.length === 0 && searchTerm" class="no-results">
      Nenhum item encontrado.
    </p>
  </div>
</template>

<script>
export default {
  name: 'FilteredListComponent',
  data() {
    return {
      searchTerm: '',
      items: [
        { id: 1, name: 'Maçã' },
        { id: 2, name: 'Banana' },
        { id: 3, name: 'Laranja' },
        { id: 4, name: 'Morango' },
        { id: 5, name: 'Uva' },
        { id: 6, name: 'Abacaxi' },
        { id: 7, name: 'Manga' },
        { id: 8, name: 'Pera' },
        { id: 9, name: 'Kiwi' },
        { id: 10, name: 'Melancia' }
      ]
    }
  },
  computed: {
    /**
     * Propriedade computada que filtra a lista de itens
     * baseado no termo de busca digitado pelo usuário.
     * @returns {Array} Lista filtrada de itens
     */
    filteredList() {
      if (!this.searchTerm.trim()) {
        return this.items
      }
      
      const term = this.searchTerm.toLowerCase().trim()
      return this.items.filter(item => 
        item.name.toLowerCase().includes(term)
      )
    }
  }
}
</script>

<style scoped>
.filter-container {
  max-width: 400px;
  margin: 2rem auto;
  padding: 1.5rem;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  font-family: Arial, sans-serif;
}

h2 {
  color: #333;
  margin-bottom: 1rem;
  text-align: center;
}

.search-input {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ccc;
  border-radius: 4px;
  font-size: 1rem;
  box-sizing: border-box;
  margin-bottom: 1rem;
}

.search-input:focus {
  outline: none;
  border-color: #42b983;
  box-shadow: 0 0 0 2px rgba(66, 185, 131, 0.2);
}

.items-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.list-item {
  padding: 0.75rem;
  border-bottom: 1px solid #f0f0f0;
  color: #555;
}

.list-item:last-child {
  border-bottom: none;
}

.no-results {
  text-align: center;
  color: #999;
  font-style: italic;
  margin-top: 1rem;
}
</style>
