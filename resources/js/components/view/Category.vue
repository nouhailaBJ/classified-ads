<template>
      <div class="main-content-area clearfix">
                  <!-- =-=-=-=-=-=-= products  =-=-=-=-=-=-= -->
         <section class="section-padding gray">
            <!-- Main Container -->
            <div class="container">
               <!-- Row -->
               <div class="row">
                  <!-- Heading Area -->
                  <div class="heading-panel">
                     <div class="col-xs-12 col-md-12 col-sm-12 text-center">
                        <!-- Main Title -->
                        <h1>All  <span class="heading-color"> Annouces</span> Added in this Category</h1>
                     </div>
                  </div>
                  <!-- Middle Content Area -->
                  <div class="col-md-12 col-sx-12">
                     <!-- Row -->
                     <ul class="list-unstyled">
                        <!-- Listing Grid -->
                        <li v-for="product in announces.data" :key="product.id">
                           <div class="well ad-listing clearfix">
                              <div class="col-md-3 col-sm-5 col-xs-12 grid-style no-padding">
                                 <!-- Image Box -->
                                 <div class="img-box">
                                    <img :src="'/uploads/product/'+ product.image" class="img-responsive" alt="">
                                    <div class="quick-view"> <a :href="'#ad-preview-'+product.id" data-toggle="modal" class="view-button"><i class="fa fa-search"></i></a> </div>
                                 </div>
                                 <!-- Ad Status --><span class="ad-status"> {{  product.cat.name }} </span>
                                 <!-- User Preview -->
                                 <div class="user-preview">
                                    <a href="#"> <img :src="'/uploads/avatar/'+ product.user.avatar" class="avatar avatar-small" alt=""> </a>
                                 </div>
                              </div>
                              <div class="col-md-9 col-sm-7 col-xs-12">
                                 <!-- Ad Content-->
                                 <div class="row">
                                    <div class="content-area">
                                       <div class="col-md-9 col-sm-12 col-xs-12">
                                          <!-- Ad Title -->
                                          <h3><a :href="'#ad-preview-'+product.id" data-toggle="modal">{{  product.title }}</a></h3>
                                          <!-- Ad Meta Info -->
                                          <ul class="ad-meta-info">
                                             <li> <i class="fa fa-map-marker"></i><a href="#">London</a> </li>
                                             <li><i class="fa  fa-clock-o"></i> {{  product.created_at | myDate }}</li>
                                             <li><i v-bind:class="'fa '+product.cat.icon"></i> {{  product.cat.name }}</li>
                                          </ul>
                                          <!-- Ad Description-->
                                          <div class="ad-details">
                                             <p>{{ product.description | truncate(100) | striphtml }} </p>
                                          </div>
                                       </div>
                                       <div class="col-md-3 col-xs-12 col-sm-12">
                                          <!-- Price -->
                                          <h4 class="price_ad">Price : <span>$ {{ product.price }}</span></h4>
                                          <!-- Ad View Button -->
                                          <button class="btn btn-block btn-primary mt-10" :href="'#ad-preview-'+product.id" data-toggle="modal"><i class="fa fa-eye" aria-hidden="true"></i> View Ad.</button>
                                          <div v-if="$gate.isAuth()">
                                          <button v-if="!product.notme" class="btn btn-block btn-dark" @click="ContactSeller(product.id)" data-toggle="modal"><i class="fa fa-commenting" aria-hidden="true"></i> Contact Seller.</button>
                                          </div>
                                          <router-link to="/signin" v-if="!$gate.isAuth()" class="btn btn-block btn-dark" ><i class="fa fa-commenting" aria-hidden="true"></i> Contact Seller.</router-link>
                                          
                                       </div>
                                    </div>
                                 </div>
                                 <!-- Ad Content End -->
                              </div>
                           </div>
                           <div class="modal price-quote"  v-bind:id="'contact-'+product.id"  aria-hidden="true">
                                 <div class="modal-dialog">
                                    <div class="modal-content">
                                       <div class="modal-header">
                                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                          <h3 class="modal-title" id="lineModalLabel">Contact Seller</h3>
                   
                                       </div>
                              <form @submit.prevent="sendMessage(product.id, product.user.id)">
                              <div class="modal-body">
                                      <div v-if="error" role="alert" class="alert alert-danger alert-dismissible">
                                             <button aria-label="Close" data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span></button>
                                             <strong>Warning</strong> - {{ error }}
                                          </div>
                                    <div class="form-group">
                                       <label for="message" >Your Message</label>
                                    <textarea required="required" v-model="form.message" name="message"
                                       class="description form-control" :class="{ 'is-invalid': form.errors.has('message') }" placeholder="Your Message To seller"
                                          style="width: 100%; height: 100px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                    <has-error :form="form" field="message"></has-error>
                                    </div>
                                    <div class="form-group">
                                       <button type="submit" class="btn btn-dark"> <i class="fa fa-plus"></i> Send</button>
                                    </div>
                              </div>
                              </form>
                                    </div>
                                 </div>
                        </div>
                           <div class="quick-view-modal modalopen" v-bind:id="'ad-preview-'+product.id" tabindex="-1" role="dialog" aria-hidden="true">
                              <div class="modal-dialog modal-lg ad-modal">
                                 <button class="close close-btn popup-cls" aria-label="Close" data-dismiss="modal" type="button"> <i class="fa-times fa"></i> </button>
                                 <div class="modal-content single-product">
                                    <div class="diblock">
                                       <div class="col-lg-7 col-sm-12 col-xs-12">
                                             <carousel :autoplay="true"  :responsive="{0:{items:1,nav:false}}">
                                                <div>
                                                   <img :src="'/uploads/product/'+ product.image">
                                                </div>
                                                <div v-for="image in product.images" :key="image.id">
                                                   <img :src="'/uploads/product/'+ image.image">
                                                </div>
                                             </carousel>
                                       </div>
                                       <div class=" col-sm-12 col-lg-5 col-xs-12">
                                          <div class="summary entry-summary">
                                             <div class="ad-preview-details">
                                                <a href="#">
                                                   <h4> {{ product.title }}</h4>
                                                </a>
                                                <div class="overview-price">
                                                   <span>$ {{ product.price }}</span>
                                                </div>
                                                <div class="clearfix"></div>
                                                <p> {{ product.description }}</p>
                                               <ul class="ad-preview-info col-md-6 col-sm-6">
                                                   <li>
                                                      <span>Added At:</span>
                                                      <p> {{ product.created_at | myDate }}</p>
                                                   </li>
                                                   <li>
                                                      <span>Location:</span>
                                                      <p>{{ product.location}}</p>
                                                   </li>
                                                   <li>
                                                      <span>Category:</span>
                                                      <p> {{ product.cat.name }}</p>
                                                   </li>
                                                   <li>
                                                      <span>Tags:</span>
                                                      <p> {{ product.tags }}</p>
                                                   </li>
                                                </ul>
                                                <ul class="ad-preview-info col-md-6 col-sm-6">
                                                   <li>
                                                      <span> <a href="#"> <img :src="'/uploads/avatar/'+ product.user.avatar" class="avatar_ads" alt=""> </a></span>
                                                      <p> {{ product.user.name }}</p>
                                                   </li>
                                                   <li>
                                                      <span>Number</span>
                                                      <p>{{ product.user.number }}</p>
                                                   </li>
                                                   <li>
                                                      <span>Member since:</span>
                                                      <p>{{ product.user.created_at | myDate }}</p>
                                                   </li>
                                                </ul>
                                             </div>
                                          </div>
                                          <!-- .summary -->
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </li>
                     </ul>

                     <!-- Row End -->
                  </div>
                  <pagination :data="announces" @pagination-change-page="getResults"></pagination>
                  <!-- Middle Content Area  End -->
               </div>
               <!-- Row End -->
            </div>
            <!-- Main Container End -->
         </section>
         <!-- =-=-=-=-=-=-= end products   =-=-=-=-=-=-= -->
      </div>
</template>

<script>

import carousel from 'vue-owl-carousel'

   export default {
      components: { carousel  },
       data()
       {
           return{
               announces:{},
               form: new Form({
                  message: '',
                  product_id: '',
                  to_id: '',
                  from_id: '',
               }),
               errors: [],
               error: ''
           }
       },
       methods:
       {
         getResults(page = 1) {
            axios.get('/api/cat_product/'+this.$route.params.id +'?page=' + page)
              .then(response => {
                this.announces = response.data;
              });
         },
         sendMessage(id, user)
         {
            this.$Progress.start(); // for progress begin
            this.form.product_id = id
            this.form.to_id = user
            this.form.from_id = authuser.id
            this.form.post('/api/open_session')  // for send request to data
            .then( () => { // for success post
              $('#contact-'+id).modal('hide') // for hide the modal
              $('#contact-'+id).removeClass("in");
              $(".modal-backdrop").remove();
              $('body').removeClass('modal-open');
              $('body').css('padding-right', '');
              $('#contact-'+id).hide();
              // for show the message success
              Toast.fire({
                icon: 'success',
                title: 'Successfully send you Message'
              })
              
              this.$Progress.finish(); //for finish the progress
            })
            .catch((err) => {
               this.error = err.response.data.error
               console.log(this.error)
            });
         },
         ContactSeller(id)
         {
           $('#contact-'+id).modal('show');
         },
         loadProduct()
         {
            axios.get('/api/cat_product/'+this.$route.params.id).then(({ data }) => (this.announces = data));
         }
       },
       created()
       {
          this.loadProduct();
       },
      watch:
      {
         $route(to,from){
            this.loadProduct();
         }
      }
   }
</script>
