<style>
.btn-media
{
    margin: 10px;
}
.card-media
{
    border: 1px solid #b7b4b4;
    padding: 5px;
    margin: 9px;
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
            <h1 class="m-0 text-dark"><i class="fa fa-anchor" aria-hidden="true"></i> Media</h1>
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
                <h3 class="card-title">Media | Galery</h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-dark"  @click="newModal">
                    <i class="fas fa-plus"></i> Add New
                  </button>
                  <button type="button" class="btn btn-dark" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="row">
                  <div class="col-md-2 col-sm-4 card-media" v-for="media in medias.data" :key="media.id">
                    <a :href="'/uploads/media/'+media.image" data-toggle="lightbox" data-title="Show Image" data-gallery="gallery">
                      <img :src="'/uploads/media/'+ media.image" class="img-fluid mb-2" alt="white sample"/>
                    </a>
                      <a :href="'/uploads/media/'+media.image" target="_blank" class="btn btn-danger white-text bg-info btn-sm btn-media"  > 
                        <i class="fas fa-link"></i> Url
                      </a>
                      <a class="btn btn-danger white-text bg-danger btn-sm btn-media" @click="deleteMedia(media.id)" > 
                        <i class="fas fa-trash"></i> Delete
                      </a>
                  </div>
                  <div class="col-md-12">
                    <pagination :data="medias" @pagination-change-page="getResults"></pagination>
                  </div>
                </div>
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
      <div class="modal-dialog  modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title"><i class="fas fa-plus"></i> Add New Pictures</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div> 
          <form @submit.prevent="uploadFile()" enctype="multipart/form-data">
          <div class="modal-body">
                <div class="form-group">
                    <label>Upload Files</label>
                    <input id="upload-file" type="file" multiple class="form-control" @change="fieldChange">
                </div>
          </div>
          <div class="modal-footer justify-content-between">
            <button type="button" class="btn  btn-danger" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-dark"> <i class="fas fa-plus"></i> Add new</button>
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
        data(){
          return {
              medias: {},
              attachments:[],
              form2: new FormData
          }
        },
        methods:{
            getResults(page = 1) {
              axios.get('/api/media?page=' + page)
                .then(response => {
                  this.medias = response.data;
                });
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
            newModal()
            {
                this.attachments.length = 0; 
                this.form2.delete("pics[]");
                $('#addNew').modal('show');
            },
            loadMedia()
            {
                axios.get("/api/media").then(({data}) => (this.medias = data));
            },
            deleteMedia(id)
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
                axios.delete('/api/media/'+id).then(() => {
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
            uploadFile(){
                for(let i=0; i<this.attachments.length;i++){
                    this.form2.append('pics[]',this.attachments[i]);
                }
                this.$Progress.start(); // for progress begin
                document.getElementById('upload-file').value=[];
                axios.post('/api/media',this.form2).then(response=>{
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
                        title: 'Successfully added new Picture to Media'
                    })
                    this.$Progress.finish(); //for finish the progress
                   // window.location.reload();
                })
                    .catch(response=>{
                        //error
                    });
            }
        },
        created()
        {
            this.loadMedia();
            Fire.$on('AfterCreate', () => {
              this.loadMedia();
            });
        }
    }
</script>