<template>
      <!-- =-=-=-=-=-=-= Main Content Area =-=-=-=-=-=-= -->
      <div class="main-content-area clearfix">
         <!-- =-=-=-=-=-=-= Latest Ads =-=-=-=-=-=-= -->
         <section class="section-padding gray"  v-if="$gate.isAuth()">
            <!-- Main Container -->
            <div class="container">
               <!-- Row -->
               <div class="row">
                  <!-- Middle Content Area -->
                  <div class="col-md-4 col-xs-12 col-sm-6">
                    <div class="white-bg user-contact-info">
                        <div class="user-info-card">
                           <div class="user-photo col-md-4 col-sm-3  col-xs-4">
                              <img class="img-circle" :src="getPhotoPicture()" alt="">
                           </div>
                           <div class="user-information  col-md-8 col-sm-9 col-xs-8">
                              <span class="user-name"><a class="hover-color" href="#">{{ this.form.name }}</a></span>
                              <div class="item-date">
                                 <span class="ad-pub">Joined At : {{ this.form.created_at | myDate }}</span><br>
                              </div>
                           </div>
                           <div class="clearfix"></div>
                        </div>
                        <hr>
                        <div class="ad-listing-meta">
                            <ul>
                               <li>Email Address : <span class="color">{{ this.form.email }}</span></li>
                               <li>Phone Number : <span class="color">{{ this.form.number }}</span></li>
                               <li>City: <span class="color">{{ this.form.location }}</span></li>
                            </ul>
                         </div>
                     </div>
                  </div>
                  <!-- Middle Content Area -->
                  <div class="col-md-8 col-xs-12 col-sm-6">
                    <!-- Row -->
                    <div class="profile-section margin-bottom-20">
                       <div class="profile-tabs">
                          <ul class="nav nav-justified nav-tabs">
                             <li class="active"><a href="">Edit Profile</a></li>
                          </ul>
                          <div class="tab-content">
                            <div class="profile-edit tab-pane fade in active" id="edit">
                                <h2 class="heading-md">Manage your Security Settings</h2>
                                <p>Manage Your Account</p>
                                <div class="clearfix"></div>
                                <form>
                                   <div class="row">
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                         <label>Your Name </label>
                                        <input type="name"  v-model="form.name" class="form-control margin-bottom-20" :class="{ 'is-invalid': form.errors.has('name') }"   placeholder="Name">
                                        <has-error :form="form" field="name"></has-error>
                                      </div>
                                      <div class="col-md-6 col-sm-6 col-xs-12">
                                         <label>Email Address <span class="color-red">*</span></label>
                                        <input type="email"  v-model="form.email" class="form-control margin-bottom-20" :class="{ 'is-invalid': form.errors.has('email') }"   placeholder="email">
                                        <has-error :form="form" field="email"></has-error>
                                      </div>
                                      <div class="col-md-12 col-sm-12 col-xs-12">  
                                         <label>Contact Number <span class="color-red">*</span></label>
                                        <input type="number"  v-model="form.number" class="form-control margin-bottom-20" :class="{ 'is-invalid': form.errors.has('number') }"   placeholder="number">
                                        <has-error :form="form" field="number"></has-error>                                         
                                      </div>
                                      <div class="col-md-12 col-sm-12 col-xs-12">  
                                        <label>Your Image <span class="color-red">*</span></label>
                                        <input type="file" class="form-control" :class="{ 'is-invalid': form.errors.has('avatar') }" 
                                        id="avatar" placeholder="avatar" @change="updateProfile" />
                                        <has-error :form="form" field="avatar"></has-error>                                    
                                      </div>
                                      <div class="col-md-12 col-sm-12 col-xs-12">  
                                          <label>Location</label>
                                          <select  v-model="form.location" name="location"  placeholder="Select one"
                                          class="form-control" :class="{ 'is-invalid': form.errors.has('location') }">
                                          <option selected disabled>Select one</option>
                                          <option v-for="location in locations.data" :key="location.id" v-bind:value="location.name">
                                             {{ location.name }}
                                             </option>
                                          </select>
                                          <has-error :form="form" field="location"></has-error>
                                       </div>
                                      <div class="col-md-12 col-sm-12 col-xs-12">  
                                        <label>Password</label>
                                        <input type="password" v-model="form.password" class="form-control" :class="{ 'is-invalid': form.errors.has('password') }" id="password" placeholder="password">
                                        <has-error :form="form" field="password"></has-error>                                     
                                      </div>
                                      <div class="col-md-12 col-sm-12 col-xs-12">  
                                          <label>Confirmation Password </label>
                                        <input type="password" v-model="form.password_confirmation" class="form-control" :class="{ 'is-invalid': form.errors.has('password_confirmation') }"  placeholder="password confirmation">
                                        <has-error :form="form" field="password_confirmation"></has-error>                                      
                                      </div>
                                   </div>

                                   <div class="clearfix"></div>
                                   <div class="row">
                                      <br>
                                      <div class="col-md-4 col-sm-4 col-xs-12 ">
                                         <button @click.prevent = "updateInfo" type="submit" class="btn btn-theme btn-sm">Update My Info</button>
                                      </div>
                                   </div>
                                </form>
                             </div>
                          </div>
                       </div>
                    </div>
                    <!-- Row End -->
                 </div>
                  <!-- Middle Content Area  End -->
               </div>

            </div>
            <!-- Main Container End -->
         </section>
         <!-- =-=-=-=-=-=-= Ads Archives End =-=-=-=-=-=-= -->
        <div v-if="!$gate.isAuth()">
           <not-found></not-found>
        </div>
      </div>
</template>

<script>
    export default {
	    data()
        {
          return {
            locations: {},      
            form: new Form({
                id: '',
                name: '',
                number: '',
                email: '',
                password: '',
                avatar: '',
                location: '',
            })
          }
        },
        methods:
        {
            loadLocation()
            {
                axios.get('/api/location').then(({ data }) => (this.locations = data));
            }, 
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
           this.loadLocation();
            this.getUser();
            Fire.$on('AfterCreate', () => {
                this.getUser();
            });
        }
    }
</script>
