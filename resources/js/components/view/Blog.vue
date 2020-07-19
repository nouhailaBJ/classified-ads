<template>
      <div class="main-content-area clearfix" >
        <div v-if="this.blog.check">
        <!-- =-=-=-=-=-=-= Breadcrumb =-=-=-=-=-=-= -->
        <div class="page-header-area-2 gray">
            <div class="container">
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="small-breadcrumb">
                        <div class=" breadcrumb-link">
                            <ul>
                            <li><router-link to="/">Home </router-link ></li>
                            <li><a class="active" href="#">Blog</a></li>
                            </ul>
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
                    <div class="col-md-8 col-xs-12 col-sm-12">
                        <div class="blog-detial">
                            <!-- Blog Archive -->
                            <div class="blog-post">
                                <div class="post-img">
                                    <a :href="'/uploads/blogs/'+ blog.blog.image" data-fancybox="group" > 
                                    <img class="img-responsive large-img" alt="" :src="'/uploads/blogs/'+ blog.blog.image"> </a>
                                </div>
                                <div class="post-info"> <a href="">{{ blog.blog.created_at | myDate}}</a> <a href="#">23 comments</a> </div>
                                <h3 class="post-title"> <a href="#"> {{ blog.blog.title}} </a> </h3>
                                
                                <div class="post-excerpt">
                                    <p v-html="blog.blog.description ">
                                         
                                    </p>
                                    <div class="tags-share clearfix">
                                        <div class="tags pull-left">
                                            <h3>Tags:</h3>
                                            <ul>
                                            <li><a href="#">{{ blog.blog.tags }}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="blog-section">
                                        <div class="blog-heading">
                                            <h2>Comments (20)</h2>
                                            <hr>
                                        </div>
                                        <ol class="comment-list">
                                            <!-- comment-list    -->
                                            <li class="comment">
                                            <div class="comment-info" v-for="comment in comments.comments" :key="comment.id">
                                                <img class="pull-left img-circle" :src="'/uploads/avatar/'+ comment.user.avatar" alt="author">
                                                <div class="author-desc">
                                                    <div class="author-title">
                                                        <strong>{{ comment.user.name }}</strong>
                                                        <ul class="list-inline pull-right">
                                                        <li><a href="#">{{ comment.created_at | myDate}}</a>
                                                        </li>
                                                        </ul>
                                                    </div>
                                                    <p>{{ comment.comment}}</p> 
                                                </div>
                                            </div>
                                            </li>
                                        </ol>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="blog-section">
                                        <div class="blog-heading">
                                            <h2>leave your comment </h2>
                                            <hr>
                                        </div>
                                        <div class="commentform" v-if="$gate.isAuth()">
                                            <form @submit.prevent="createComment()">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12">
                                                    <div class="form-group">
                                                        <label>Comment <span class="required">*</span>
                                                        </label>
                                                        <textarea v-model="form.comment" name="title" class="form-control" placeholder="" rows="8" cols="6"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 margin-top-20 clearfix">
                                                    <button type="submit" class="btn btn-primary">Post Your Comment</button>
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                        <div class="commentform" v-if="!$gate.isAuth()">
                                            <form>
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12">
                                                    <p>Register with Us to Comment in this Blog</p>
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Blog Grid -->
                        </div>
                    </div>
                    <!-- Right Sidebar -->
                    <div class="col-md-4 col-xs-12 col-sm-12">
                        <!-- Sidebar Widgets -->
                        <div class="blog-sidebar">
                            <!-- Categories --> 
                            <div class="widget">
                            <div class="widget-heading">
                                <h4 class="panel-title"><a>Categories</a></h4>
                            </div>
                            <div class="widget-content categories">
                                <ul>
                                    <li v-for="category in blog.categories" :key="category.id"> 
                                        <router-link :to="'/category/'+category.id"> <i v-bind:class="'fa '+category.icon"></i> {{ category.name }}</router-link> 
                                    </li>
                                </ul>
                            </div>
                            </div>
                            <!-- Latest News --> 
                            <div class="widget">
                            <div class="widget-heading">
                                <h4 class="panel-title"><a>Latest News</a></h4>
                            </div>
                            <div class="widget-content recent-ads">
                                <!-- Ads -->
                                <div class="recent-ads-list"  v-for="data in blog.blogs" :key="data.id">
                                    <div class="recent-ads-container">
                                        <div class="recent-ads-list-image">
                                         <router-link v-bind:to="'/blog/'+data.id" class="recent-ads-list-image-inner">
                                            <span>
                                                <img :src="'/uploads/blogs/'+ data.image" alt="">
                                            </span>    
                                        </router-link><!-- /.recent-ads-list-image-inner -->
                                        </div>
                                        <!-- /.recent-ads-list-image -->
                                        <div class="recent-ads-list-content">
                                        <h3 class="recent-ads-list-title">
                                            <router-link   v-bind:to="'/blog/'+data.id">
                                              <span @click="clickHere(data.id)">{{ data.title }} </span>
                                            </router-link>
                                        </h3>
                                        <ul class="recent-ads-list-location">
                                            <li><a href="#">{{ data.created_at | myDate }}</a></li>
                                        </ul>
                                        <!-- /.recent-ads-list-price -->
                                        </div>
                                        <!-- /.recent-ads-list-content -->
                                    </div>
                                    <!-- /.recent-ads-container -->
                                </div>
                            </div>
                            </div>

                        </div>
                        <!-- Sidebar Widgets End -->
                    </div>
                    <!-- Middle Content Area  End -->
                </div>
                <!-- Row End -->
                </div>
                <!-- Main Container End -->
            </section>
            <!-- =-=-=-=-=-=-= Ads Archives End =-=-=-=-=-=-= -->
        </div>
   
      </div>

</template>

<script>
    export default {
        data()
        {
            return {
                blog: {},
                comments: {},
                form: new Form({
                        id: '',
                        comment: '',
                        blog_id: '',
                    })
            }
        },
        methods:
        {
            createComment()
            {
                this.form.blog_id = this.blog.blog.id
                this.$Progress.start(); // for progress begin
                this.form.post('/api/comment')  // for send request to data
                .then( () => { // for success post
                Fire.$emit('AfterCreate');
                this.form.reset()
                // for show the message success
                Toast.fire({
                    icon: 'success',
                    title: 'Successfully create new Comment'
                })
                this.$Progress.finish(); //for finish the progress
                })
                .catch( () => { //for not success post

                });
            },
            loadComment(id)
            {
                axios.get('/api/comment/'+id).then(({data}) => (this.comments = data));
            },
            loadBlog(id)
            {
                axios.get('/api/site/blog/'+id).then(({data}) => (this.blog = data)).catch(() =>{
                    this.$router.push('/404'); 
                });
            }
        },
        created()
        {
            this.loadComment(this.$route.params.id)
            this.loadBlog(this.$route.params.id)
            Fire.$on('AfterCreate', () => {
                this.loadComment(this.$route.params.id)
            });
        },
        watch:
        {
            $route(to,from){
                this.loadComment(this.$route.params.id)
                this.loadBlog(this.$route.params.id)
            }
        }
    }
</script>