<template>
  <v-data-table
    :headers="headers"
    :items="tareas"
    :items-per-page="15"
    class="elevation-1"
  ></v-data-table>
</template>

<script>
import axios from 'axios'
export default ({
  data(){
    return {
      headers:
      [
        {
          text: "Id",
          align: "start",
          sortable: false,
          value: "id",
        },
        { text: "Nombre", value: "nombre" },
        { text: "Descripción", value: "descrip" },
        { text: "Voluntarios requeridos", value: "cant_vol_requerido" },
        { text: "Voluntarios inscritos", value: "cant_vol_inscritos" },
        { text: "Fecha de inicio", value: "finicio" },
        { text: "Fecha de fin", value: "ffin" },
        { text: "Id estado", value: "id_estado" }
      ],
      tareas: []
    }
  },
  mounted() {
    this.getTask()
  },
  methods: {
    async getTask(){
      const url = 'http://localhost:8080/tasks'
      await axios.get(url)
      .then(response => {
        console.log(response.data)
        this.tareas = response.data
      })
      .catch(error => {
        console.log(error)
      })
    }
  },
})
</script>
