<template>
  <v-data-table
    :headers="headers"
    :items="tarea"
    :items-per-page="5"
    class="elevation-1"
  ></v-data-table>
</template>

<script>
export default ({data()
{  return {
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
      { text: "Voluntarios requeridos", value: "cant_vol_requeridos" },
      { text: "Voluntarios inscritos", value: "cant_vol_inscritos" },
      { text: "Id emergencia", value: "id_emergencia" },
    ]
  }
}
})
</script>
