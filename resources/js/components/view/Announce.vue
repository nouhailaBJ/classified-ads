<style>
    @media(min-width:768px)
    {
        .post-img img
        {
            height:200px;
        }
    }
    .img-size-64
    {
        width: 64px;
        height: 64px;
    }
</style>
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
                              <img class="img-circle" :src="'/uploads/avatar/'+this.form.avatar" alt="">
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
                    <div class="row">
                        <!-- Blog Archive -->
                        <div class="posts-masonry">
                           <!-- Blog Post-->
                           <div class="col-md-6 col-sm-6 col-xs-12" v-for="product in products.data" :key="product.id">
                              <div class="blog-post">
                                 <div class="post-img">
                                    <a :href="'#ad-preview-'+product.id" data-toggle="modal"> <img class="img-responsive" alt="" height="200px"  :src="'/uploads/product/'+ product.image"> </a>
                                 </div>
                                 <div class="post-info"> 
                                    <a href="#">{{ product.created_at | myDate }}</a> 
                                    <a href="#">
                                       <span v-if="product.status" class="label label-success">Enabled</span>
                                       <span v-if="!product.status" class="label label-danger">Disabled</span>
                                    </a> 
                                 </div>
                                 <h3 class="post-title"> <a :href="'#ad-preview-'+product.id" data-toggle="modal"> {{ product.title }} </a> </h3>
                                <a class="btn btn-primary margin-bottom-10" style="color:#fff" :href="'#ad-preview-'+product.id" data-toggle="modal">
                                    <i class="fa fa-eye"></i>
                                </a>
                                <a class="btn btn-success margin-bottom-10" style="color:#fff" @click="editModal(product)">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a class="btn btn-warning margin-bottom-10" style="color:#fff" @click="newModal2(product.id)">
                                    <i class="fa fa-picture-o"></i> 
                                </a>
                                <a class="btn btn-danger margin-bottom-10" style="color:#fff" @click="deleteProduct(product.id)">
                                    <i class="fa fa-trash"></i> 
                                </a>
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
                                                      <p>{{ product.location }}</p>
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
                           </div>
                        </div>
                        <!-- Row End -->
                     </div>
                    <!-- Row End -->
                 </div>
                 <div class="col-md-12">
                     <pagination :data="products" @pagination-change-page="getResults"></pagination>
                 </div>
                  <!-- Middle Content Area  End -->
               </div>

            </div>
                <div class="modal price-quote" id="addNew" aria-hidden="true">
                     <div class="modal-dialog">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                              <h3 class="modal-title" id="lineModalLabel">Edit Announce</h3>
                           </div>
                    <form @submit.prevent="updateProduct()">
                    <div class="modal-body">
                        <div class="form-group">
                        <label>Title</label>
                        <input v-model="form3.title" type="text" name="title"
                            class="form-control" :class="{ 'is-invalid': form3.errors.has('title') }">
                        <has-error :form="form3" field="title"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputDescription" >Product Description</label>
                        <textarea v-model="form3.description" name="description" id="textarea"
                            class="description form-control" :class="{ 'is-invalid': form3.errors.has('description') }" placeholder="Place some text here"
                                style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                        <has-error :form="form3" field="description"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputClientCompany">Price</label>
                            <input type="number" id="inputClientCompany"  v-model="form3.price" name="price"
                            class=" form-control" :class="{ 'is-invalid': form3.errors.has('price') }">
                            <has-error :form="form3" field="price"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputProjectLeader">Tags</label>
                            <input type="text" id="inputProjectLeader" placeholder="tags" v-model="form3.tags" name="tags"
                            class="form-control" :class="{ 'is-invalid': form3.errors.has('tags') }">
                            <has-error :form="form3" field="tags"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputProjectLeader">Category</label>
                            <select  v-model="form3.cat_id" name="cat_id"  @change="changeSub" placeholder="Select one"
                            class="custom-select form-control" :class="{ 'is-invalid': form3.errors.has('cat_id') }">
                            <option selected disabled>Select one</option>
                            <option v-for="category in categories.data" :key="category.id" v-bind:value="category.id">
                                {{ category.name }}
                                </option>
                            </select>
                            <has-error :form="form3" field="cat_id"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputProjectLeader">Sub Category</label>
                            <select  v-model="form3.sub_id" name="sub_id" placeholder="Select one"
                            class="custom-select form-control" :class="{ 'is-invalid': form3.errors.has('sub_id') }">
                            <option selected disabled>Select one</option>
                            <option v-for="subcat in subcats.data" :key="subcat.id" v-bind:value="subcat.id" >
                                {{ subcat.name }}
                                </option>
                            </select>
                            <has-error :form="form3" field="sub_id"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputProjectLeader">Location</label>
                            <select  v-model="form3.location" name="location"  placeholder="Select one"
                            class="custom-select form-control" :class="{ 'is-invalid': form3.errors.has('location') }">
                            <option selected disabled>Select one</option>
                            <option v-for="location in locations.data" :key="location.id" v-bind:value="location.name">
                                {{ location.name }}
                                </option>
                            </select>
                            <has-error :form="form3" field="location"></has-error>
                        </div>
                        <div class="form-group">
                            <label for="inputClientCompany">Main Image Product</label>
                            <input type="file" id="inputClientCompany" name="image" @change="uploadImage"
                            class=" form-control" :class="{ 'is-invalid': form3.errors.has('image') }">
                            <has-error :form="form3" field="image"></has-error>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-dark"> <i class="fa fa-plus"></i>Update</button>
                        </div>
                    </div>
                    </form>
                        </div>
                     </div>
             </div>
            <div class="modal price-quote" id="images">
                <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h3 class="modal-title" id="lineModalLabel">Images of Your Announce</h3>
                    </div>
                    <div class="modal-body">
                    <form @submit.prevent="uploadFile()" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Upload Files</label>
                            <input id="upload-file" required="required" type="file" multiple class="form-control" @change="fieldChange">
                            <input type="hidden"  id="proid"/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-dark"> <i class="fa fa-plus"></i> upload</button>
                        </div>
                    </form>
                    <table class="table">
                        <thead class="bg-dark">
                        <tr>
                            <th>Image</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="media in medias.data" :key="media.id">
                            <td><img :src="'/uploads/product/'+ media.image" alt="Product Image" class="img-size-64"></td>
                            <td class="text-right py-0 align-middle">
                            <div class="btn-group btn-group-sm">
                                <a :href="'/uploads/product/'+media.image" target="_blank" class="btn btn-info"><i class="fa fa-eye"></i></a>
                                <a @click="deleteImage(media.id)" class="btn btn-danger"><i class="fa fa-trash"></i></a>
                            </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
                <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
         </section>
         <!-- =-=-=-=-=-=-= Ads Archives End =-=-=-=-=-=-= -->
        <div v-if="!$gate.isAuth()">
           <not-found></not-found>
        </div>
      </div>
</template>

<script>
import carousel from 'vue-owl-carousel'

    export default {
        components: { carousel  },
	    data()
        {
          return {
            categories: {},
            products: {},
            locations: {},
            subcats: {},
            form2: new FormData,
            attachments:[],
            medias: {},
            form: new Form({
                id: '',
                name: '',
                number: '',
                email: '',
                password: '',
                avatar: '',
                location:''
            }),
            form3: new Form({
                id: '',
                title: '',
                description: '',
                tags: '',
                location: '',
                status: '',
                price: '',
                cat_id: '',
                image: '',
                sub_id: ''
              })
          }
        },
        methods:
        {
            changeSub()
            {
            Fire.$emit('AfterShow');
            },
            uploadImage(e)
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
                    this.form3.image = reader.result
                }
                reader.readAsDataURL(file);
            },
            editModal(product)
            {
                this.editmode = true;
                this.form3.reset();
                $('#addNew').modal('show');
                this.form3.fill(product);
            },
            loadCategory()
            {
            axios.get('/api/cat_product').then(({ data }) => (this.categories = data));
            },
            loadSubCategory()
            {
            if(this.form3.cat_id != '')
                axios.get('/api/sub_cat/'+this.form3.cat_id).then(({ data }) => (this.subcats = data));
            },
            loadLocation()
            {
                axios.get('/api/location').then(({ data }) => (this.locations = data));
            }, 
            updateProduct()
            {
                //console.log('editing mode');
                this.$Progress.start();
                this.form3.put('/api/product/'+this.form3.id)
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
            loadPicture(id)
            {
            axios.get('/api/pro_image/'+id).then(({data}) => (this.medias = data));
            },
            newModal2(id)
            {
            //document.getElementById('proid').value= this.form.id;
            this.form2.append('proid', id);
            this.attachments.length = 0; 
            this.form2.delete("pics[]");
            $('#images').modal('show');
            this.loadPicture(id);
            },
            fieldChange(e){
            let selectedFiles=e.target.files;
            if(!selectedFiles.length){
                return false;
            }
            for(let i=0;i<selectedFiles.length;i++){
                this.attachments.push(selectedFiles[i]);
            }
            },
            uploadFile(){
                for(let i=0; i<this.attachments.length;i++){
                this.form2.append('pics[]',this.attachments[i]);
                }
                this.$Progress.start(); // for progress begin
                document.getElementById('upload-file').value=[];
                axios.post('/api/pro_image',this.form2).then(response=>{
                    $('#images').modal('hide') // for hide the modal
                    $("#images").removeClass("in");
                    $(".modal-backdrop").remove();
                    $('body').removeClass('modal-open');
                    $('body').css('padding-right', '');
                    $("#images").hide();
                    // for show the message success
                Toast.fire({
                    icon: 'success',
                    title: 'Successfully added new Picture'
                })
                this.$Progress.finish(); //for finish the progress
                // window.location.reload();
                })
                .catch(response=>{
                //error
                });
            },
            deleteImage(id)
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
                    axios.delete('/api/delete_image/' + id).then(() => {
                    $('#images').modal('hide') // for hide the modal
                    $("#images").removeClass("in");
                    $(".modal-backdrop").remove();
                    $('body').removeClass('modal-open');
                    $('body').css('padding-right', '');
                    $("#images").hide();
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
            deleteProduct(id)
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
                this.form.delete('/api/product/'+id).then(() => {
                    Fire.$emit('AfterCreate');
                
                    Swal.fire(
                        'Deleted!',
                        'Your Product has been deleted.',
                        'success'
                    )
                }).catch(() => {
                    Swal.fire(
                        'Failed!',
                        'Your Product has been not deleted.',
                        'warning'
                    )
                    })
                }
                })
            },
            getResults(page = 1) {
                axios.get('/api/announces?page=' + page)
                .then(response => {
                    this.products = response.data;
                });
            },
            loadProducts()
            {
                axios.get('/api/announces').then(({ data }) => (this.products = data));
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
            this.loadProducts();
            this.loadLocation();
            this.loadCategory();
            this.loadSubCategory();
            Fire.$on('AfterCreate', () => {
                this.loadProducts();
            });
            Fire.$on('AfterShow', () => {
                this.loadSubCategory();
            });
        }
    }
</script>
