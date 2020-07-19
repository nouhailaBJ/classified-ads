<template>
      <!-- =-=-=-=-=-=-= Main Content Area =-=-=-=-=-=-= -->
      <div class="main-content-area clearfix">
        <!-- =-=-=-=-=-=-= Registration Form =-=-=-=-=-=-= -->
         <section class="section-padding gray">
            <!-- Main Container -->
            <div class="container">
               <!-- Row -->
               <div class="row">
                  <!-- Middle Content Area -->
                  <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                     <!--  Form -->
                     <div class="form-grid">
                        <form @submit.prevent="createUser()">
                          <h2 class="no-span"><b> Create Your Account</b></h2>
                           <div class="form-group">
                                <label for="inputProjectLeader">Name</label>
                                <input type="text"  placeholder="name" v-model="form.name" name="name"
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
                              <label>Email</label>
                                <input type="email"  placeholder="email" v-model="form.email" name="email"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                <has-error :form="form" field="email"></has-error>
                           </div>
                            <div class="form-group">
                            <label>Avatar</label>
                            <input  type="file" name="avatar" @change="updateProfile"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('avatar') }">
                            <has-error :form="form" field="avatar"></has-error>
                            </div>     
                           <div class="form-group">
                              <label>Password</label>
                                <input type="password"  placeholder="password" v-model="form.password" name="password"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                                <has-error :form="form" field="password"></has-error>
                           </div>
                            <div class="form-group">
                            <label>Confirmation Password</label>
                            <input v-model="form.password_confirmation"  placeholder="confirmation password"  type="password" name="password_confirmation"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('password_confirmation') }">
                            <has-error :form="form" field="password_confirmation"></has-error>
                            </div>
                           <button class="btn btn-theme btn-lg btn-block">Register</button>
                         
                        </form>
                     </div>
                     <!-- Form -->
                  </div>
                  <!-- Middle Content Area  End -->
               </div>
               <!-- Row End -->
            </div>
            <!-- Main Container End -->
         </section>
          <!-- =-=-=-=-=-=-= Registration Form End =-=-=-=-=-=-= -->
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
                    email: '',
                    number: '',
                    avatar: '',
                    password: '',
                    password_confirmation: '',
                })
            }
        },
        methods:
        {
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
          createUser()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/register')  // for send request to data
            .then( () => { // for success post
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
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
