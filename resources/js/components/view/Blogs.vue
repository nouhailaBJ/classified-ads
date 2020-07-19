<template>

      <!-- =-=-=-=-=-=-= Main Content Area =-=-=-=-=-=-= -->
      <div class="main-content-area clearfix">
      <!-- =-=-=-=-=-=-= Breadcrumb =-=-=-=-=-=-= -->
      <div class="page-header-area-2 gray">
         <div class="container">
            <div class="row">
               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="small-breadcrumb">
                     <div class=" breadcrumb-link">
                        <ul>
                           <li><router-link to="/">Home Page</router-link></li>
                           <li><a class="active" href="#">Blogs</a></li>
                        </ul>
                     </div>
                     <div class="header-page">
                        <h1>Latest Blogs</h1>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- =-=-=-=-=-=-= Breadcrumb End =-=-=-=-=-=-= -->
         <!-- =-=-=-=-=-=-= Latest Ads =-=-=-=-=-=-= -->
         <section class="section-padding no-top gray ">
            <!-- Main Container -->
            <div class="container">
               <!-- Row -->
               <div class="row">
                  <!-- Middle Content Area -->
                  <div class="col-md-12 col-xs-12 col-sm-12">
                     <div class="row">
                        <!-- Blog Archive -->
                        <div class="posts-masonry">
                           <!-- Blog Post-->
                           <div class="col-md-4 col-sm-6 col-xs-12"  v-for="blog in blogs.data" :key="blog.id">
                              <div class="blog-post height-blog">
                                 <div class="post-img">
                                    <router-link v-bind:to="'/blog/'+ blog.id"> 
                                     <img class="img-responsive" alt="" :src="'/uploads/blogs/'+ blog.image"> 
                                    </router-link>
                                 </div>
                                 <div class="post-info"> <a href="">{{ blog.created_at | myDate}}</a>  </div>
                                 <h3 class="post-title">  <router-link v-bind:to="'/blog/'+ blog.id">  {{ blog.title}} </router-link> </h3>
                                 <p class="post-excerpt">{{ blog.description | truncate(100) | striphtml}}   <router-link v-bind:to="'/blog/'+ blog.id"><strong>Read More</strong> </router-link>
                                 </p>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-12 col-xs-12 col-sm-12">
                            <pagination :data="blogs" @pagination-change-page="getResults"></pagination>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Row End -->
            </div>
            <!-- Main Container End -->
         </section>
         <!-- =-=-=-=-=-=-= Ads Archives End =-=-=-=-=-=-= -->
      </div>
</template>

<script>
    export default {
        data()
        {
            return{
                blogs: {}
            }
        },
        methods:
        {
            getResults(page = 1) {
                axios.get('/api/blog?page=' + page)
                .then(response => {
                    this.blogs = response.data;
                });
            },
            loadBlogs()
            {
                axios.get("/api/blog").then(({data}) => (this.blogs = data));
            },
        },
        created() {
            this.loadBlogs();
        }
    }
</script>
