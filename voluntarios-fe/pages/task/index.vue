<template>
  <v-data-table
    :headers="headers"
    :items="tareas"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar
        flat
      >
        <v-toolbar-title>Tareas</v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="attrs"
              v-on="on"
            >
              Crear tarea
            </v-btn>
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.nombre"
                      label="Nombre"
                      type="text"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >

                  <v-text-field
                      v-model="editedItem.descrip"
                      label="Descripción"
                      type="text"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.cant_vol_requeridos"
                      label="Voluntarios requeridos"
                      type="number"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.cant_vol_inscritos"
                      label="Voluntarios inscritos"
                      type="number"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.finicio"
                      label="Fecha de inicio"
                      type="date"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.ffin"
                      label="Fecha de fin"
                      type="date"
                      required
                    ></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-select
                      v-model="editedItem.id_estado"
                      :items="estados"
                      item-text="descrip"
                      item-value="id"
                      label="Estado">
                    </v-select>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-select
                      v-model="editedItem.id_emergencia"
                      :items="emergencias"
                      item-text="nombre"
                      item-value="id"
                      label="Emergencia">
                    </v-select>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="blue darken-1"
                text
                @click="close"
              >
                Cancelar
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                href = "/task"
                @click="save"
              >
                Guardar
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5">¿Está seguro que desea eliminar la tarea?</v-card-title>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete">Cancelar</v-btn>
              <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:[`item.actions`]="{ item }">
      <v-icon
        small
        class="mr-2"
        @click="editItem(item)"
      >
        mdi-pencil
      </v-icon>
      <v-btn icon href="/task">
      <v-icon
        small
        @click="deleteTask(item)" 
      >
        mdi-delete
      </v-icon>
      </v-btn>
    </template>
    <template v-slot:item.id_estado = {item}>
      <div v-text="getNombre(item.id_estado, 0)"></div>
    </template>
    <template v-slot:item.id_emergencia = {item}>
      <div v-text="getNombre(item.id_emergencia, 1)"></div>
    </template>
    <template v-slot:no-data>
      <v-btn
        color="primary"
        @click="initialize"
      >
        Reset
      </v-btn>
    </template>
  </v-data-table>
</template>

<script>
  import axios from 'axios'
  export default {
    data: () => ({
      dialog: false,
      dialogDelete: false,
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
        { text: "Fecha de inicio", value: "finicio" },
        { text: "Fecha de fin", value: "ffin" },
        { text: "Estado", value: "id_estado" },
        { text: "Emergencia", value: "id_emergencia"},
        { text: "Acciones", value: "actions" }
      ],
      tareas: [],
      estados: [],
      emergencias: [],
      editedIndex: -1,
      editedItem: {
        id: 0,
        nombre: '',
        descrip: '',
        cant_vol_requeridos: 0,
        cant_vol_inscritos: 0,
        finicio: '',
        ffin: '',
        id_estado: 0,
        id_emergencia: 0,
      },
      defaultItem: {
        id: 0,
        nombre: '',
        descrip: '',
        cant_vol_requeridos: 0,
        cant_vol_inscritos: 0,
        finicio: '',
        ffin: '',
        id_estado: 0,
        id_emergencia: 0,
      },
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'Nueva tarea' : 'Editar tarea'
      },
    },

    watch: {
      dialog (val) {
        val || this.close()
      },
      dialogDelete (val) {
        val || this.closeDelete()
      },
    },

    async mounted() { 
      this.getStatusTask()
      await this.getEmergencies()
      this.getTask()
    },

    methods: {
       getTask(){
        const url = 'http://localhost:8080/tasks'
         axios.get(url)
        .then(response => {
          this.tareas = response.data.sort((a,b) => a.id - b.id)
        })
        .catch(error => {
          console.log(error)
        })
      },

       getStatusTask(){
        const url = 'http://localhost:8080/status_tasks'
         axios.get(url)
        .then(response => {
          this.estados = response.data.sort((a,b) => a.id - b.id)

        })
        .catch(error => {
          console.log(error)
        })
      },

      async getEmergencies(){
        const url = 'http://localhost:8080/emergencies'
        await axios.get(url)
        .then(response => {
          this.emergencias = response.data.sort((a,b) => a.id - b.id)
        })
        .catch(error => {
          console.log(error)
        })
      },

      getNombre(id, n){
        if(n==0){
          return this.estados[id].descrip
        }else{
          return this.emergencias[id].nombre
        }
      },

      editItem (item) {
        this.editedIndex = item.id
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      async deleteTask (et) {
        const url = 'http://localhost:8080/tasks/'+String(et.id)
        await axios.delete(url)
        .then(response => {
          console.log(response)
        }).catch(error => {
          console.log(error)
        })
      },

      deleteItemConfirm () {
        this.tareas.splice(this.editedIndex, 1)
        this.closeDelete()
      },

      close () {
        this.dialog = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      closeDelete () {
        this.dialogDelete = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      async createTask(et){
        const url = 'http://localhost:8080/tasks'
        await axios.post(url, et)
        .then(response => {
          console.log(response)
        }).catch(error => {
          console.log(error)
        })
      },


      async updateTask(et){
        const url = 'http://localhost:8080/tasks'
        await axios.put(url, et)
        .then( response => {
          console.log(response)
        })
        .catch( error => {
          console.log(error)
        })
      },

      save () {
        if (this.editedIndex > -1) {
          this.editedItem.id = this.editedIndex
          console.log(this.editedItem)
          this.updateTask(this.editedItem)
        } else {
          this.editedItem.id = this.tareas.length
          this.createTask(this.editedItem)
        }
        //this.close()
      },
    },
  }
</script>
