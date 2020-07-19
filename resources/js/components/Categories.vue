<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-users" aria-hidden="true"></i> Categories</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->    
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Categories Table</h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-dark" @click="newModal">
                    <i class="fas fa-plus"></i> Add New
                  </button>
                  <button type="button" class="btn btn-dark" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead class="bg-dark">
                  <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Added At </th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="category in categories.data" :key="category.id">
                    <td>{{ category.name}}</td>
                    <td>
                        <div v-show="!category.parents"> Parent</div>
                        <div v-show="category.parents"> Sub Category</div>
                    </td>
                    <td>{{ category.created_at | myDate}}</td>
                    <td>
                      <a class="btn btn-info white-text bg-info btn-sm" @click="editModal(category)">
                        <i class="fas fa-edit"></i> Edit
                      </a>
                      <a class="btn btn-danger white-text bg-danger btn-sm" @click="deleteCategory(category.id)" > 
                        <i class="fas fa-trash"></i> Delete
                      </a>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="card-footer">
                <pagination :data="categories" @pagination-change-page="getResults"></pagination>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
    <!-- Modal new  -->
      <div class="modal fade" id="addNew">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" v-show="!editmode"><i class="fas fa-plus"></i> Add New category</h4>
              <h4 class="modal-title" v-show="editmode"><i class="fas fa-edit"></i>Update category</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form @submit.prevent="editmode ? updateCategory(): createCategory()">
            <div class="modal-body">  
                <div class="form-group">
                <label>Name</label>
                <input v-model="form.name" type="text" name="name"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                <has-error :form="form" field="name"></has-error>
                </div>
                <div class="form-group">
                <label>Icon</label>
                <input v-model="form.icon" type="text" name="icon"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('icon') }">
                <has-error :form="form" field="icon"></has-error>
                </div>
                <div class="form-group">
                     <label>Parents</label>
                    <select name="parents" v-model="form.parents" id="parents" 
                    class="form-control" :class="{ 'is-invalid': form.errors.has('parents') }">
                        <option value="">Select Parent Category</option>
                        <option value="0">Parent</option>
                        <option v-for="parent in parents.data" :key="parent.id" v-bind:value="parent.id">
                        {{ parent.name }}
                        </option>
                    </select>
                    <has-error :form="form" field="parents"></has-error>
                </div>             
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn  btn-danger" data-dismiss="modal">Close</button>
              <button v-show = "editmode" type="submit" class="btn btn-success">Update</button>
              <button v-show = "!editmode" type="submit" class="btn btn-primary">Create</button>
            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
  </div>
  <!-- /.content-wrapper -->

</template>
<script>
    export default {
        data()
        {
            return {
              editmode: true,
              categories: {},
              parents: {},
              form: new Form({
                    id: '',
                    name: '',
                    parents: '',
                    icon: '',
                })
            }
        },
        methods: {
        loadParent()
        {
            axios.get('/api/cat_product').then(({ data }) => (this.parents = data));
        },
          getResults(page = 1) {
            axios.get('/api/category?page=' + page)
              .then(response => {
                this.categories = response.data;
              });
          },
          newModal()
          {
            this.editmode = false;
            this.form.reset();
            $('#addNew').modal('show');
          },
          editModal(category)
          {
            this.editmode = true;
            this.form.reset();
            $('#addNew').modal('show');
            this.form.fill(category);
          },
          loadCategory()
          {
            axios.get("/api/category").then(({data}) => (this.categories = data));
          },
          createCategory()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/category')  // for send request to data
            .then( () => { // for success post
              Fire.$emit('AfterCreate');
              $('#addNew').modal('hide') // for hide the modal
              $("#addNew").removeClass("in");
              $(".modal-backdrop").remove();
              $('body').removeClass('modal-open');
              $('body').css('padding-right', '');
              $("#addNew").hide();
              // for show the message success
              Toast.fire({
                icon: 'success',
                title: 'Successfully create new category'
              })
              
              this.$Progress.finish(); //for finish the progress
            })
            .catch( () => { //for not success post

            });

          },
          deleteCategory(id)
          {
            Swal.fire({
              title: 'Are you sure?',
              text: "You won't be able to revert this!",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
              if (result.value) {
              this.form.delete('/api/category/'+id).then(() => {
                Fire.$emit('AfterCreate');
              
                  Swal.fire(
                    'Deleted!',
                    'Your category has been deleted.',
                    'success'
                  )
              }).catch(() => {
                  Swal.fire(
                    'Failed!',
                    'Your category has been deleted.',
                    'warning'
                  )
                })
              }
            })
          },
        updateCategory()
        {
          //console.log('editing mode');
          this.$Progress.start();
          this.form.put('/api/category/'+this.form.id)
          .then( () => {
             $('#addNew').modal('hide');
                Swal.fire(
                  'Updated!',
                  'Your information has been updated.',
                  'success'
                )
                this.$Progress.finish();
                Fire.$emit('AfterCreate');
          }).catch( () => {
              this.$Progress.fail();
          });
        },

        },
        created() 
        {
          Fire.$on('searching', () => {
            let query = this.$parent.search; // get the data from parent  its in app.js
                axios.get('/api/findCategory?q=' + query)
                .then((data) => {
                    this.categories = data.data
                })
                .catch(() => {
                })
          })
          this.loadCategory();
          this.loadParent();
          Fire.$on('AfterCreate', () => {
            this.loadCategory();
            this.loadParent();
          });
        }
    }
</script>
