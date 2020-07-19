<template>
      <div class="main-content-area clearfix" >
        <div v-if="this.page.check">
        <!-- =-=-=-=-=-=-= Breadcrumb =-=-=-=-=-=-= -->
        <div class="page-header-area-2 gray">
            <div class="container">
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="small-breadcrumb">
                        <div class=" breadcrumb-link">
                            <ul>
                            <li><router-link to="/">Home </router-link ></li>
                            <li><a class="" href="#">Page</a></li>
                            <li><a class="active" href="#">{{ page.page.title }}</a></li>
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
                    <div class="col-md-12 col-xs-12 col-sm-12">
                        <div class="blog-detial">
                            <!--  page -->
                            <div class="blog-post">
                                <h3 class="post-title"> <a href="#"> {{ page.page.title}} </a> </h3>
                                <div class="post-excerpt">
                                    <p v-html="page.page.description "></p>
                                    <div class="tags-share clearfix">
                                        <div class="tags pull-left">
                                            <h3>Tags:</h3>
                                            <ul>
                                            <li><a href="#">{{ page.page.tags }}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <!-- Blog Grid -->
                        </div>
                    </div>
                </div>
                <!-- Row End -->
                </div>
                <!-- Main Container End -->
            </section>
            <!-- =-=-=-=-=-=-= Ads Archives End =-=-=-=-=-=-= -->
        </div>
        <div v-if="!this.page.check">
            <not-found> </not-found>
        </div>
      </div>

</template>

<script>
    export default {
        data()
        {
            return {
                page: {}
            }
        },
        methods:
        {
            loadPage(id)
            {
                axios.get('/api/site/page/'+id).then(({data}) => (this.page = data));
            }
        },
        created()
        {
            this.loadPage(this.$route.params.id)
        }
    }
</script>
