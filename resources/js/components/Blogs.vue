<style>
.product-image
{
    height:400px;
    margin-bottom: 20px;
}
</style>
<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-th" aria-hidden="true"></i> Blogs</h1>
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
                <h3 class="card-title">Blogs Table</h3>
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
                    <th>Image</th>
                    <th>Title</th>
                    <th>status</th>
                    <th>Added At </th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="blog in blogs.data" :key="blog.id">
                    <td>
                      
                    <a :href="'/uploads/blogs/'+ blog.image" data-toggle="lightbox" v-bind:data-title="blog.title" data-gallery="gallery">
                      <img :src="'/uploads/blogs/'+ blog.image" v-bind:title="blog.title" class="img-size-64">
                    </a>
                    </td>
                    <td>{{ blog.title}}</td>
                      <td>
                          <span v-show="blog.status" class="badge badge-success">Enabled</span>
                          <span v-show="!blog.status" class="badge badge-danger">Disabled</span>
                      </td>
                    <td>{{ blog.created_at | myDate}}</td>
                    <td>
                      <a class="btn btn-success white-text bg-success btn-sm"  @click="showModal(blog.id)">
                        <i class="fas fa-eye"></i> 
                      </a>
                      <a class="btn btn-info white-text bg-info btn-sm" @click="editModal(blog)">
                        <i class="fas fa-edit"></i> Edit
                      </a>
                      <a class="btn btn-danger white-text bg-danger btn-sm" @click="deleteBlog(blog.id)" > 
                        <i class="fas fa-trash"></i> Delete
                      </a>
                    </td>
                    <!-- Modal show  -->
                      <div class="modal fade" v-bind:id="'show'+blog.id">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h4 class="modal-title"><i class="fas fa-plus"></i> Show Blog </h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <div class="row">
                                <div class="col-md-12">
                                  <h3 class="d-inline-block ">{{ blog.title }}</h3>
                                </div>
                                <div class="col-12">
                                    <img class="product-image" :src="'/uploads/blogs/'+ blog.image" v-bind:title="blog.title">
                                </div>
                                <div class="col-12">
                                  <p  v-html="blog.description"></p>
                                  <hr>
                                  <div class="py-2 px-3 mt-4">
                                    <h2 class="mb-0">
                                      Tags : {{ blog.tags }}
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
                <pagination :data="blogs" @pagination-change-page="getResults"></pagination>
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
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" v-show="!editmode"><i class="fas fa-plus"></i> Add New Blog</h4>
              <h4 class="modal-title" v-show="editmode"><i class="fas fa-edit"></i>Update Blog</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form @submit.prevent="editmode ? updateBlog(): createBlog()">
            <div class="modal-body">  
                <div class="form-group">
                <label>Title</label>
                <input v-model="form.title" type="text" name="title"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                <has-error :form="form" field="title"></has-error>
                </div>
                <div class="form-group">
                    <label for="inputDescription" >Blog Description</label>
                    <ckeditor v-model="form.description" name="description"></ckeditor>
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
                    <label for="inputProjectLeader">Tags</label>
                    <input type="text" id="inputProjectLeader" placeholder="tags" v-model="form.tags" name="tags"
                      class="form-control" :class="{ 'is-invalid': form.errors.has('tags') }">
                     <has-error :form="form" field="tags"></has-error>
                </div>
                <div class="form-group">
                <label>Blog Image</label>
                <input  type="file" name="image" @change="updateImage"
                    class="form-control" :class="{ 'is-invalid': form.errors.has('image') }">
                <has-error :form="form" field="image"></has-error>
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
              blogs: {},
              form: new Form({
                    id: '',
                    title: '',
                    description: '',
                    tags: '',
                    status: '',
                    image: '',
                })
            }
        },
        methods: {
            showModal(id)
            {
           $('#show'+id).modal('show');
            },
          updateImage(e)
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
          getResults(page = 1) {
            axios.get('/api/blog?page=' + page)
              .then(response => {
                this.blogs = response.data;
              });
          },
          newModal()
          {
            this.editmode = false;
            this.form.reset();
            $('#addNew').modal('show');
          },
          editModal(blog)
          {
            this.editmode = true;
            this.form.reset();
            $('#addNew').modal('show');
            this.form.fill(blog);
          },
          loadBlogs()
          {
            axios.get("/api/blog").then(({data}) => (this.blogs = data));
          },
          createBlog()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/blog')  // for send request to data
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
                title: 'Successfully create new blog'
              })
              
              this.$Progress.finish(); //for finish the progress
            })
            .catch( () => { //for not success post

            });

          },
          deleteBlog(id)
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
              this.form.delete('/api/blog/'+id).then(() => {
                Fire.$emit('AfterCreate');
              
                  Swal.fire(
                    'Deleted!',
                    'Your blog has been deleted.',
                    'success'
                  )
              }).catch(() => {
                  Swal.fire(
                    'Failed!',
                    'Your blog has been deleted.',
                    'warning'
                  )
                })
              }
            })
          },
        updateBlog()
        {
          //console.log('editing mode');
          this.$Progress.start();
          this.form.put('/api/blog/'+this.form.id)
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
                axios.get('/api/findBlog?q=' + query)
                .then((data) => {
                    this.blogs = data.data
                })
                .catch(() => {
                })
          })
          this.loadBlogs();
          Fire.$on('AfterCreate', () => {
            this.loadBlogs();
          });
        }
    }
</script>
