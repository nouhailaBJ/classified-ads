<template>
      <!-- =-=-=-=-=-=-= Main Content Area =-=-=-=-=-=-= -->
      <div class="main-content-area clearfix">
         <!-- =-=-=-=-=-=-= contact =-=-=-=-=-=-= -->
         <section class="section-padding gray  ">
            <!-- Main Container -->
            <div class="container">
               <!-- Row -->
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12 no-padding commentForm">
                     <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                        <div class="page-header-area-2 gray">
                            <div class="container">
                                <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="small-breadcrumb">
                                        <div class=" breadcrumb-link">
                                        </div>
                                        <div class="header-page">
                                            <h1>Fell Free To Contact Us</h1>
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                         <form @submit.prevent="createPage()">
                                <div v-if="success" role="alert" class="alert alert-success alert-dismissible">
                                    <button aria-label="Close" data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span></button>
                                    <strong>Success</strong> - {{ success }}
                                </div>
                                 <div class="form-group">
                                    <input type="text" placeholder="Name" id="name" v-model="form.name" class="form-control" :class="{ 'is-invalid': form.errors.has('name') }"  required>
                                    <has-error :form="form" field="name"></has-error>
                                 </div>
                                 <div class="form-group">
                                    <input type="email" placeholder="Email" id="email"  v-model="form.email" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" required>
                                    <has-error :form="form" field="email"></has-error>
                                 </div>
                                 <div class="form-group">

                                    <input type="text" placeholder="Subject" id="subject" v-model="form.subject"   class="form-control" :class="{ 'is-invalid': form.errors.has('subject') }" required>
                                     <has-error :form="form" field="subject"></has-error>
                                 </div>
                                 <div class="form-group">
                                    <textarea cols="12" rows="7"  placeholder="Message..." v-model="form.message" 
                                    class="form-control" :class="{ 'is-invalid': form.errors.has('message') }"></textarea>
                                    <has-error :form="form" field="message"></has-error>
                                 </div>
                                  <button class="btn btn-theme" type="submit">Send Message</button>
                        </form>
                     </div>

                  </div>
               </div>
               <!-- Row End --> 
            </div>
            <!-- Main Container End --> 
         </section>
    </div>
</template>

<script>
    export default {
       data()
       {
           return{
               success: '',
               form: new Form({
                  id: '',
                  name: '',
                  email: '',
                  subject: '',
                  message: ''
               })
           }
       },
       methods:
       {
            createPage()
            {
               this.$Progress.start(); // for progress begin
               this.form.post('/api/contact/message')  // for send request to data
               .then( () => { // for success post
               this.form.reset();
               this.success = 'Successfully send your Message We Will respond you soon';
               Toast.fire({
                  icon: 'success',
                  title: 'Successfully sended'
               })
               this.$Progress.finish(); //for finish the progress
               })
               .catch( () => { //for not success post

               });

            },
       },
    }
</script>
