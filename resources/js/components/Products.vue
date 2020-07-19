<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-tasks" aria-hidden="true"></i> Products</h1>
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
                <h3 class="card-title">Products Table</h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-dark" @click="newModal" data-toggle="modal" data-target="#add-new">
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
                    <th>Image</th>
                    <th>Title</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Added At</th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="product in products.data" :key="product.id">
                    <td>
                    <a :href="'/uploads/product/'+ product.image"  data-toggle="lightbox" v-bind:data-title="product.title" data-gallery="gallery">
                      <img :src="'/uploads/product/'+ product.image" alt="Product Image" class="img-size-64">
                    </a>
                    </td>
                    <td>{{ product.title }}
                    </td>
                    <td>{{ product.price }} $</td>
                      <td>
                          <span v-show="product.status" class="badge badge-success">Enabled</span>
                          <span v-show="!product.status" class="badge badge-danger">Disabled</span>
                      </td>
                    <td> {{ product.created_at | myDate }}</td>
                    <td>
                      <a class="btn btn-success white-text bg-success btn-sm"  @click="showModal(product.id)">
                        <i class="fas fa-eye"></i> 
                      </a>
                      <a class="btn btn-primary white-text bg-primary btn-sm"  @click="newModal2(product.id)">
                        <i class="fas fa-file-image"></i> 
                      </a>
                      <a class="btn btn-info white-text bg-info btn-sm" @click="editModal(product)">
                        <i class="fas fa-edit"></i> 
                      </a>
                      <a class="btn btn-danger white-text bg-danger btn-sm" @click="deleteProduct(product.id)">
                        <i class="fas fa-trash"></i> 
                      </a>
                    </td>
                    <!-- Modal show  -->
                      <div class="modal fade" v-bind:id="'show'+product.id">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h4 class="modal-title"><i class="fas fa-plus"></i> Show Product </h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col-md-12">
                                  <h3 class="d-inline-block ">{{ product.title }}</h3>
                                </div>
                                <div class="col-12 col-sm-6">
                                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                      <div class="carousel-item active">
                                        <img class="d-block w-100"  :src="'/uploads/product/'+ product.image" alt="First slide">
                                      </div>
                                      <div class="carousel-item" v-for="media in medias.data" :key="media.id">
                                        <img class="d-block w-100" :src="'/uploads/product/'+ media.image"  alt="Second slide">
                                      </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                      <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                      <span class="sr-only">Next</span>
                                    </a>
                                  </div>
                                </div>
                              
                                <div class="col-12 col-sm-6">
                                  <p>{{ product.description }}</p>
                                  <hr>
                                  <div class="bg-gray py-2 px-3 mt-4">
                                    <h2 class="mb-0">
                                      $ {{ product.price }}
                                    </h2>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer justify-content-between">
                              <button type="button" class="btn  btn-danger" data-dismiss="modal">Close</button>
                            </div>
                          </div>
                          <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                      </div>
                      <!-- /.modal -->
                  </tr>
                  </tbody>
                </table>

              </div>
              <div class="card-footer">
                <pagination :data="products" @pagination-change-page="getResults"></pagination>
              </div>
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
        <div class="modal-dialog  modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" v-show="!editmode"><i class="fas fa-plus"></i> Add New Product</h4>
              <h4 class="modal-title" v-show="editmode"><i class="fas fa-plus"></i> Update this Product</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form @submit.prevent="editmode ? updateProduct() : createProduct()">
            <div class="modal-body">
                  <div class="form-group">
                  <label>Title</label>
                  <input v-model="form.title" type="text" name="title"
                      class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                  <has-error :form="form" field="title"></has-error>
                  </div>
                  <div class="form-group">
                    <label for="inputDescription" >Product Description</label>
                <textarea v-model="form.description" name="description" id="textarea"
                      class="description form-control" :class="{ 'is-invalid': form.errors.has('description') }" placeholder="Place some text here"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                 <has-error :form="form" field="description"></has-error>
                  </div>
                  <div class="form-group">
                    <label for="inputStatus">Status</label>
                    <select  v-model="form.status" name="status"
                      class="custom-select form-control" :class="{ 'is-invalid': form.errors.has('status') }">
                      <option selected disabled>Select one</option>
                      <option value="1">Enabled</option>
                      <option value="0">Disabled</option>
                    </select>
                    <has-error :form="form" field="status"></has-error>
                  </div>
                  <div class="form-group">
                    <label for="inputClientCompany">Price</label>
                    <input type="number" id="inputClientCompany"  v-model="form.price" name="price"
                      class=" form-control" :class="{ 'is-invalid': form.errors.has('price') }">
                     <has-error :form="form" field="price"></has-error>
                  </div>
                  <div class="form-group">
                    <label for="inputProjectLeader">Tags</label>
                    <input type="text" id="inputProjectLeader" placeholder="tags" v-model="form.tags" name="tags"
                      class="form-control" :class="{ 'is-invalid': form.errors.has('tags') }">
                     <has-error :form="form" field="tags"></has-error>
                  </div>
                  <div class="form-group">
                    <label for="inputProjectLeader">Category</label>
                    <select  v-model="form.cat_id" name="cat_id"  @change="changeSub" placeholder="Select one"
                      class="custom-select form-control" :class="{ 'is-invalid': form.errors.has('cat_id') }">
                      <option selected disabled>Select one</option>
                      <option v-for="category in categories.data" :key="category.id" v-bind:value="category.id">
                        {{ category.name }}
                        </option>
                    </select>
                    <has-error :form="form" field="cat_id"></has-error>
                  </div>
                  <div class="form-group">
                    <label for="inputProjectLeader">Sub Category</label>
                    <select  v-model="form.sub_id" name="sub_id" placeholder="Select one"
                      class="custom-select form-control" :class="{ 'is-invalid': form.errors.has('sub_id') }">
                      <option selected disabled>Select one</option>
                      <option v-for="subcat in subcats.data" :key="subcat.id" v-bind:value="subcat.id" >
                        {{ subcat.name }}
                        </option>
                    </select>
                    <has-error :form="form" field="sub_id"></has-error>
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
                    <label for="inputClientCompany">Main Image Product</label>
                    <input type="file" id="inputClientCompany" name="image" @change="uploadImage"
                      class=" form-control" :class="{ 'is-invalid': form.errors.has('image') }">
                     <has-error :form="form" field="image"></has-error>
                  </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn  btn-danger" data-dismiss="modal">Close</button>
              <button type="submit" v-show = "!editmode" class="btn btn-dark"> <i class="fas fa-plus"></i> Add new</button>
              <button type="submit" v-show = "editmode" class="btn btn-dark"> <i class="fas fa-plus"></i>Update</button>
            </div>
             </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
    <!-- Modal images -->
      <div class="modal fade" id="images">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"><i class="fas fa-plus"></i> Images (Add - Edit - Delete) </h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form @submit.prevent="uploadFile()" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Upload Files</label>
                    <input id="upload-file" type="file" multiple class="form-control" @change="fieldChange">
                    <input type="hidden"  id="proid"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-dark"> <i class="fas fa-plus"></i> upload</button>
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
                        <a :href="'/uploads/product/'+media.image" target="_blank" class="btn btn-info"><i class="fas fa-eye"></i></a>
                        <a @click="deleteImage(media.id)" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn  btn-danger" data-dismiss="modal">Close</button>
            </div>
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
              products: {},
              subcats: {},
              medias: {},
              attachments:[],
              locations:{},
              form2: new FormData,
              form: new Form({
                id: '',
                title: '',
                description: '',
                tags: '',
                status: '',
                price: '',
                cat_id: '',
                location: '',
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
        getResults(page = 1) {
            axios.get('/api/product?page=' + page)
              .then(response => {
                this.products = response.data;
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
        loadPicture(id)
        {
          axios.get('/api/pro_image/'+id).then(({data}) => (this.medias = data));
        },
        showModal(id)
        {
          this.loadPicture(id);
          $('#show'+id).modal('show');
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
                this.form.image = reader.result
              }
              reader.readAsDataURL(file);
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
        createProduct()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/product')  // for send request to data
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
                title: 'Successfully create new Product'
              })
              
              this.$Progress.finish(); //for finish the progress
            })
            .catch( () => { //for not success post

            });

          },
        loadProducts()
        {
            axios.get('/api/product').then(({ data }) => (this.products = data));
        },
        loadLocation()
        {
            axios.get('/api/location').then(({ data }) => (this.locations = data));
        },   
        loadCategory()
        {
          axios.get('/api/cat_product').then(({ data }) => (this.categories = data));
        },
        loadSubCategory()
        {
          if(this.form.cat_id != '')
            axios.get('/api/sub_cat/'+this.form.cat_id).then(({ data }) => (this.subcats = data));
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
        updateProduct()
        {
          //console.log('editing mode');
          this.$Progress.start();
          this.form.put('/api/product/'+this.form.id)
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
                axios.get('/api/findProduct?q=' + query)
                .then((data) => {
                    this.products = data.data
                })
                .catch(() => {
                })
          })
          this.loadProducts();
          this.loadCategory();
          this.loadLocation();
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
