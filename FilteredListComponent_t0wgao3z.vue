<template>
  <div class="filtered-list-component">
    <h2>Lista Filtrada</h2>
    
    <!-- Campo de busca -->
    <input 
      v-model="searchTerm" 
      type="text" 
      placeholder="Buscar itens..."
      class="search-input"
    />

    <!-- Lista filtrada -->
    <ul>
      <li v-for="item in filteredList" :key="item.id">
        {{ item.name }}
      </li>
    </ul>

    <!-- Mensagem quando não há resultados -->
    <p v-if="filteredList.length === 0" class="no-results">
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
        { id: 7, name: 'Melancia' },
        { id: 8, name: 'Pera' }
      ]
    }
  },

  computed: {
    /**
     * Propriedade computada para filtrar a lista de itens
     * baseado no termo de busca digitado pelo usuário
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
.filtered-list-component {
  max-width: 400px;
  margin: 20px auto;
  padding: 20px;
  font-family: Arial, sans-serif;
}

.search-input {
  width: 100%;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  padding: 10px;
  border-bottom: 1px solid #eee;
}

li:last-child {
  border-bottom: none;
}

.no-results {
  color: #999;
  text-align: center;
  font-style: italic;
}
</style>
