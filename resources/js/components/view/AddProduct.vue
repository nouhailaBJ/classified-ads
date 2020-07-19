<style>
 .form-grid {
    background: #fff;
    padding: 6px 30px;
}
h2.no-span {
    font-size: 23px;
}
</style>
<template>
     <div class="main-content-area clearfix" >
            <div  v-if="$gate.isAuth()">
            <!-- =-=-=-=-=-=-= Announce  =-=-=-=-=-=-= -->
            <section class="section-padding gray">
                <!-- Main Container -->
                <div class="container">
                <!-- Row -->
                <div class="row">
                    <!-- Middle Content Area -->
                    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                            <h2 class="no-span"><b>Add Your Announce </b></h2>
                            <div v-for="(v, k) in errors" :key="k" role="alert" class="alert alert-danger alert-dismissible">
                                    <p v-for="error in v" :key="error" class="text-sm">
                                    {{ error }}
                                    </p>
                            </div>
                        </div>
                    </div>
                     <div class="form-grid">    

                    <form  @submit.prevent="createProduct()" class="submit-form white"  id="form_id" enctype="multipart/form-data">
                    <!-- Title  -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                            <label class="control-label">What would you Buy:</label>
                            <input v-model="form.title" placeholder="What would you Buy ?" type="text" name="title"
                                class="form-control" >
                        </div>
                    </div>
                    <div class="row">
                        <!-- Category  -->
                        <div class="col-md-6 col-lg-6 col-xs-12 col-sm-12">
                            <label class="control-label">Select Category </label>
                            <select  v-model="form.cat_id" name="cat_id"  @change="changeSub" placeholder="Select one"
                            class="custom-select form-control">
                            <option selected disabled>Select one</option>
                            <option v-for="category in categories.data" :key="category.id" v-bind:value="category.id">
                                {{ category.name }}
                                </option>
                            </select>
                        </div>
                        <!-- Category  -->
                        <div class="col-md-6 col-lg-6 col-xs-12 col-sm-12">
                            <label class="control-label">Select Sub-Category </label>
                            <select  v-model="form.sub_id" name="sub_id" placeholder="Select one"
                            class="custom-select form-control">
                            <option selected disabled>Select one</option>
                            <option v-for="subcat in subcats.data" :key="subcat.id" v-bind:value="subcat.id" >
                                {{ subcat.name }}
                                </option>
                            </select>
                        </div>

                    </div>
                    <!-- Image Upload  -->
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <label class="control-label">Select Location </label>
                            <select  v-model="form.location" name="location" placeholder="Select one"
                            class="custom-select form-control">
                            <option selected disabled>Select one</option>
                            <option v-for="location in locations.data" :key="location.id" v-bind:value="location.id" >
                                {{ location.name }}
                                </option>
                            </select>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                            <label class="control-label">Main Photo for Your Product</label>
                            <input type="file" id="inputClientCompany" name="image" @change="uploadImage"
                            class=" form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                            <label class="control-label">Upload Other Photos</label>
                            <input id="upload-file" name="images[]" type="file" multiple class="form-control" @change="fieldChange">
                        </div>
                    </div>
                    <!-- end row -->
                    <!-- Ad Description  -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12  col-sm-12">
                            <label class="control-label">Product Description <small>Enter long description for your Product</small></label>
                            <textarea v-model="form.description" name="description" id="textarea"
                                class="description form-control"  placeholder="Place some text here"
                                    style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                            <label class="control-label">What is your price ?</label>
                            <input type="number" id="inputClientCompany"  v-model="form.price" name="price"
                            class=" form-control">
                        </div>
                    </div>
                    <!-- end row -->
                    <!-- Ad Tags  -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12  col-sm-12">
                            <label class="control-label">Ad Tags </label>
                            <input type="text" id="inputProjectLeader" placeholder="tags" v-model="form.tags" name="tags"
                            class="form-control" >
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xs-12  col-sm-12">
                             <button type="submit" class="btn btn-theme pull-right">Publish My Announce</button>
                        </div>     
                    </div>     
                    </form>
                    </div>
                    </div>
                </div>
             </div>
            
            </section>
            </div>
            <div  v-if="!$gate.isAuth()">
                <not-found></not-found>
            </div>
             <hr>
    </div>
    
</template>

<script>
    export default {
        data()
        {
            return{
                categories: {},
                subcats: {},
                attachments:[],
                locations:{},
                form2: new FormData(),
                form: new Form({
                    title:'',
                    description:'',
                    tags:'',
                    price:'',
                    cat_id:'',
                    sub_id:'',
                    location: '',
                    image:'',
                }),
                errors: []
            }
        },
        methods:
        {
            changeSub()
            {
             Fire.$emit('AfterShow');
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
            loadLocation()
            {
                axios.get('/api/location').then(({ data }) => (this.locations = data));
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
            createProduct()
            {
             
                for(let i=0; i<this.attachments.length;i++){
                this.form2.append('images[]',this.attachments[i]);
                }
                this.form2.append('title', this.form.title);
                this.form2.append('description', this.form.description);
                this.form2.append('tags', this.form.tags);
                this.form2.append('cat_id', this.form.cat_id);
                this.form2.append('image', this.form.image);
                this.form2.append('sub_id', this.form.sub_id);
                this.form2.append('price', this.form.price);
                this.form2.append('location', this.form.location);
                this.$Progress.start(); // for progress begin
                document.getElementById('upload-file').value=[];
                axios.post('/api/profile', this.form2)  // for send request to data
                .then( () => { // for success post
                this.attachments.length = 0; 
                this.form2.delete("pics[]");
                this.form.reset()
                this.$router.push('/thanks')    
                Toast.fire({
                    icon: 'success',
                    title: 'Successfully create new Product'
                })
                
                this.$Progress.finish(); //for finish the progress
                })
                .catch((err) => {
                    this.errors = err.response.data.errors
                });

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
        },
        created()
        {
            this.loadCategory();
            this.loadSubCategory();
            this.loadLocation();
            Fire.$on('AfterShow', () => {
                this.loadSubCategory();
            });
        }
    }
</script>
