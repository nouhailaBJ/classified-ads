<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-users" aria-hidden="true"></i> Users</h1>
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
                <h3 class="card-title">Users Table</h3>
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
                    <th>Avatar</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Number</th>
                    <th>Added At </th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="user in users.data" :key="user.id">
                    <td>
                      
                    <a :href="'/uploads/avatar/'+ user.avatar" data-toggle="lightbox" v-bind:data-title="user.name" data-gallery="gallery">
                      <img :src="'/uploads/avatar/'+ user.avatar" v-bind:title="user.name" class="img-size-64">
                    </a>
                    </td>
                    <td>{{ user.name}}</td>
                    <td>{{ user.email}}</td>
                    <td>{{ user.number}}</td>
                    <td>{{ user.created_at | myDate}}</td>
                    <td>
                      <a class="btn btn-info white-text bg-info btn-sm" @click="editModal(user)">
                        <i class="fas fa-edit"></i> Edit
                      </a>
                      <a class="btn btn-danger white-text bg-danger btn-sm" @click="deleteUser(user.id)" > 
                        <i class="fas fa-trash"></i> Delete
                      </a>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <div class="card-footer">
                <pagination :data="users" @pagination-change-page="getResults"></pagination>
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
    <!-- Modal new user -->
      <div class="modal fade" id="addNew">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" v-show="!editmode"><i class="fas fa-plus"></i> Add New User</h4>
              <h4 class="modal-title" v-show="editmode"><i class="fas fa-edit"></i>Update User</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form @submit.prevent="editmode ? updateUser(): createUser()">
            <div class="modal-body">  
                <div class="form-group">
                <label>Name</label>
                <input v-model="form.name" type="text" name="name"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                <has-error :form="form" field="name"></has-error>
                </div>
                <div class="form-group">
                <label>Number</label>
                <input v-model="form.number" type="text" name="number"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('number') }">
                <has-error :form="form" field="number"></has-error>
                </div>
                <div class="form-group">
                <label>Email address</label>
                <input v-model="form.email" type="email" name="email"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                <has-error :form="form" field="email"></has-error>
                </div>
                <div class="form-group">
                    <select name="admin" v-model="form.admin" id="admin" 
                    class="form-control" :class="{ 'is-invalid': form.errors.has('admin') }">
                        <option value="">Select User Role</option>
                        <option value="1">Admin</option>
                        <option value="0">Standard User</option>
                    </select>
                    <has-error :form="form" field="type"></has-error>
                </div>
                  <div class="form-group">
                    <label for="inputProjectLeader">Location</label>
                    <select  v-model="form.location" name="location"   placeholder="Select one"
                      class="custom-select form-control" :class="{ 'is-invalid': form.errors.has('location') }">
                      <option selected disabled>Select one</option>
                      <option v-for="location in locations.data" :key="location.id" v-bind:value="location.name">
                        {{ location.name }}
                        </option>
                    </select>
                    <has-error :form="form" field="location"></has-error>
                  </div>
                <div class="form-group">
                <label>Password</label>
                <input v-model="form.password" type="password" name="password"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                <p v-show="editmode">Not required if you don't want change your password</p>
                <has-error :form="form" field="password"></has-error>
                
                </div>
                <div class="form-group">
                <label>Confirmation Password</label>
                <input v-model="form.password_confirmation" type="password" name="password_confirmation"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('password_confirmation') }">
                <p v-show="editmode">Not required if you don't want change your password</p>
                <has-error :form="form" field="password_confirmation"></has-error>
               
                </div>
                <div class="form-group">
                <label>Avatar</label>
                <input  type="file" name="avatar" @change="updateProfile"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('avatar') }">
                <has-error :form="form" field="avatar"></has-error>
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
              users: {},
              locations:{},
              form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    number: '',
                    admin: '',
                    avatar: '',
                    password: '',
                    location: '',
                    password_confirmation: '',
                })
            }
        },
        methods: {
          updateProfile(e)
            {
              let file = e.target.files[0];
              let reader = new FileReader();
              let limit = 1024 * 1024 * 2;
              if(file['size'] > limit){
                    Swal.fire(
                  'Failed!',
                  'You are uploading a large file.',
                  'warning'
                     )
                    return false;
              }
              reader.onloadend = (file) =>
              {
                this.form.avatar = reader.result
              }
              reader.readAsDataURL(file);
          },
          getResults(page = 1) {
            axios.get('/api/user?page=' + page)
              .then(response => {
                this.users = response.data;
              });
          },
          newModal()
          {
            this.editmode = false;
            this.form.reset();
            $('#addNew').modal('show');
          },
          editModal(user)
          {
            this.editmode = true;
            this.form.reset();
            $('#addNew').modal('show');
            this.form.fill(user);
          },
          loadUsers()
          {
            axios.get("/api/user").then(({data}) => (this.users = data));
          },
          createUser()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/user')  // for send request to data
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
                title: 'Successfully create new user'
              })
              
              this.$Progress.finish(); //for finish the progress
            })
            .catch( () => { //for not success post

            });

          },
          deleteUser(id)
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
              this.form.delete('/api/user/'+id).then(() => {
                Fire.$emit('AfterCreate');
              
                  Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                  )
              }).catch(() => {
                  Swal.fire(
                    'Failed!',
                    'Your file has been deleted.',
                    'warning'
                  )
                })
              }
            })
          },
        loadLocation()
        {
            axios.get('/api/location').then(({ data }) => (this.locations = data));
        },     
        updateUser()
        {
          //console.log('editing mode');
          this.$Progress.start();
          this.form.put('/api/user/'+this.form.id)
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
                axios.get('/api/findUser?q=' + query)
                .then((data) => {
                    this.users = data.data
                })
                .catch(() => {
                })
          })
          this.loadUsers();
          this.loadLocation();
          Fire.$on('AfterCreate', () => {
            this.loadUsers();
          });
        }
    }
</script>
