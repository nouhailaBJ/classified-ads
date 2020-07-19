<template>
  <!-- Content Wrapper. Contains page content {{ $parent.getSetting('number') }} -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-home" aria-hidden="true"></i> Dashboard </h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->    
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <!-- Small Statics -->
        <div class="row">
            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-info"><i class="far fa-envelope"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Messages</span>
                  <span class="info-box-number">{{ counts.message }}</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-users"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Users</span>
                  <span class="info-box-number">{{ counts.user }}</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix hidden-md-up"></div>

            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-th"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Blogs</span>
                  <span class="info-box-number">{{ counts.blog }}</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-tasks"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Products</span>
                  <span class="info-box-number">{{ counts.product }}</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.Statics -->
        <div class="row">
              <div class="col-md-4">
                <!-- USERS LIST -->
                <div class="card card-dark">
                  <div class="card-header">
                    <h3 class="card-title"><i class="fa fa-users" aria-hidden="true"></i> Latest Users</h3>

                    <div class="card-tools">
                      <span class="badge badge-success">{{counts.user }} Members</span>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body p-0">
                    <ul class="users-list clearfix">
                      <li v-for="user in counts.users" :key="user.id">
                        <img :src="'/uploads/avatar/'+ user.avatar"  class="img-size-64" style="height:60px;">
                        <a class="users-list-name" href="#">{{ user.name }}</a>
                        <span class="users-list-date">{{ user.created_at | myDay}}</span>
                      </li>
                    </ul>
                    <!-- /.users-list -->
                  </div>
                  <!-- /.card-body -->
                  <div class="card-footer text-center">
                    <router-link to="/admin/users">View All Users</router-link>
                  </div>
                  <!-- /.card-footer -->
                </div>
                <!--/.card -->
              </div>
              <div class="col-md-8">
                  <!-- PRODUCT LIST -->
                  <div class="card card-dark">
                    <div class="card-header">
                      <h3 class="card-title"><i class="fa fa-comments" aria-hidden="true"></i> Recently Messages </h3>

                      <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-minus"></i>
                        </button>
                      </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                      <ul class="products-list product-list-in-card pl-2 pr-2">
                        <li class="item" v-for="message in counts.messages" :key="message.id">
                              <a href="javascript:void(0)" class="product-title">From : {{ message.email }}
                              </a>
                            <span class="product-description">
                              {{ message.message }}
                            </span>
                        </li>
                      </ul>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer text-center">
                      <router-link to="/admin/messages" class="uppercase">View All Messages</router-link>
                    </div>
                    <!-- /.card-footer -->
                  </div>
              </div>
        
              <div class="col-md-6">
                  <!-- PRODUCT LIST -->
                  <div class="card card-dark">
                    <div class="card-header">
                      <h3 class="card-title"><i class="fa fa-th-large" aria-hidden="true"></i> Recently Added Products</h3>

                      <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-minus"></i>
                        </button>
                      </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                      <ul class="products-list product-list-in-card pl-2 pr-2">
                        <li class="item" v-for="product in counts.products" :key="product.id">
                          <div class="product-img">
                            <img :src="'/uploads/product/'+ product.image" alt="Product Image" class="img-size-50">
                          </div>
                          <div class="product-info">
                            <a href="javascript:void(0)" class="product-title">{{ product.title }}
                              <span class="badge badge-warning float-right">$ {{ product.price}}</span></a>
                          </div>
                        </li>
                        <!-- /.item -->
                      </ul>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer text-center">
                      <router-link to="/admin/products" class="uppercase">View All Products</router-link>
                    </div>
                    <!-- /.card-footer -->
                  </div>
              </div>
              <div class="col-md-6">
                  <!-- PRODUCT LIST -->
                  <div class="card card-dark">
                    <div class="card-header">
                      <h3 class="card-title"><i class="fa fa-th-large" aria-hidden="true"></i> Recently Added Blogs</h3>

                      <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-minus"></i>
                        </button>
                      </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                      <ul class="products-list product-list-in-card pl-2 pr-2">
                        <li class="item" v-for="blog in counts.blogs" :key="blog.id">
                          <div class="product-img">
                            <img :src="'/uploads/blogs/'+ blog.image" alt="Product Image" class="img-size-50">
                          </div>
                          <div class="product-info">
                            <a href="javascript:void(0)" class="product-title">{{ blog.title }}
                              </a>
                            <span class="product-description">
                              {{ blog.description | striphtml}}
                            </span>
                          </div>
                        </li>
                        <!-- /.item -->
                      </ul>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer text-center">
                      <router-link to="/admin/blogs" class="uppercase">View All Blogs</router-link>
                    </div>
                    <!-- /.card-footer -->
                  </div>
              </div>
        
		</div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</template>

<script>
    export default {
        data()
        {
          return {
            counts: []
          }
        },
        methods:
        {
          getLoad()
          {
            console.log(this.$parent.url)
            axios.get('/api/dashboard').then(({data}) => (this.counts = data));
          }
        },
        created() {
            this.getLoad();
        }
    }
</script>
