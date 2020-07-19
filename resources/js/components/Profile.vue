<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12">
            <h1>Profile</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                     :src="getPhotoPicture()"
                       alt="">
                </div>

                <h3 class="profile-username text-center">{{ this.form.name }}</h3>

                <p class="text-muted text-center" v-if="this.form.name">Admin User</p>
                <p class="text-muted text-center" v-if="!this.form.name">Standard User</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">About Me</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <strong><i class="fas fa-book mr-1"></i> Biography</strong>
                <p class="text-muted">
                  B.S. in Computer Science from the University of Tennessee at Knoxville
                </p>
                <hr>
                <strong><i class="fas fa-map-marker-alt mr-1"></i> Location</strong>
                <p class="text-muted">Malibu, California</p>
                <hr>
                <strong><i class="fas fa-map-marker-alt mr-1"></i> Number</strong>
                <p class="text-muted">{{ this.form.number }}</p>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="active  tab-pane" id="settings">
                    <form class="form-horizontal">
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                          <input type="name"  v-model="form.name" class="form-control" :class="{ 'is-invalid': form.errors.has('name') }" id="inputName" placeholder="Name">
                         <has-error :form="form" field="name"></has-error>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" v-model="form.email"  class="form-control" :class="{ 'is-invalid': form.errors.has('email') }"  placeholder="Email">
                        <has-error :form="form" field="email"></has-error>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Picture</label>
                        <div class="col-sm-10">
                          <input type="file" class="form-control" :class="{ 'is-invalid': form.errors.has('avatar') }" 
                          id="avatar" placeholder="avatar" @change="updateProfile" />
                           <has-error :form="form" field="avatar"></has-error>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">number</label>
                        <div class="col-sm-10">
                          <input type="number"  v-model="form.number" class="form-control" :class="{ 'is-invalid': form.errors.has('number') }" id="inputName" placeholder="number">
                         <has-error :form="form" field="number"></has-error>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">Password</label>
                        <div class="col-sm-10">
                          <input type="password" v-model="form.password" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }" id="password" placeholder="password">
                          <has-error :form="form" field="password"></has-error>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">Confirmation Password</label>
                        <div class="col-sm-10">
                          <input type="password" v-model="form.password_confirmation" class="form-control" :class="{ 'is-invalid': form.errors.has('password_confirmation') }" id="password" placeholder="password confirmation">
                          <has-error :form="form" field="password_confirmation"></has-error>
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button @click.prevent = "updateInfo" type="submit" class="btn btn-danger">Update my info</button>
                        </div>
                      </div>
                    </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
</template>

<script>
    export default {
	        data()
        {
          return {
            form: new Form({
                id: '',
                name: '',
                number: '',
                email: '',
                password: '',
                avatar: ''
            })
          }
        },
        methods:
        {
            getPhotoPicture()
            {
                 let photo = (this.form.avatar.length > 200) ? this.form.avatar : "/uploads/avatar/"+ this.form.avatar ;
                return photo;
            },    
            updateInfo()
            {
               this.$Progress.start();
                if(this.form.password == ''){
                    this.form.password = undefined;
                }
              this.form.put('/api/profile/'+  this.form.id).then(() => {
                Swal.fire(
                  'Updated!',
                  'Your information has been updated.',
                  'success'
                )
                Fire.$emit('AfterCreate');
                    this.$Progress.finish();
              }).catch( () => {
                 this.$Progress.fail();
              });
            },
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
            getUser()
            {
                axios.get("/api/profile")
                .then(({data}) => (this.form.fill(data)));
            }
        },
        created()
        {
            this.getUser();
            Fire.$on('AfterCreate', () => {
                this.getUser();
            });
        }
    }
</script>
