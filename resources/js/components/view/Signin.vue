<template>
      <div class="main-content-area clearfix" >
        <div v-if="!$gate.isAuth()">
            <!-- =-=-=-=-=-=-= Breadcrumb =-=-=-=-=-=-= -->
            <div class="page-header-area-2 gray">
                <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="small-breadcrumb">

                            <div class="header-page">
                            <h1>Create Your Account</h1>
                            <br>
                            <div v-for="(v, k) in errors" :key="k" role="alert" class="alert alert-danger alert-dismissible">
                                    <p v-for="error in v" :key="error" class="text-sm">
                                    {{ error }}
                                    </p>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            <!-- =-=-=-=-=-=-= Breadcrumb End =-=-=-=-=-=-= -->
                
            <section class="section-padding no-top gray">
                <!-- Main Container -->
                <div class="container">
                <!-- Row -->
                <div class="row">
                    <!-- Middle Content Area -->
                    <div class="col-md-6 ">
                        <!--  Form -->
                        <div class="form-grid">
                            <form @submit.prevent="SignRegister()">
                        
                            <h2 class="no-span"><b>Register With Us</b></h2>
                            <div class="form-group">
                                <label>Name</label>
                                <input v-model="register.name" type="text" name="name"
                                    class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input v-model="register.email" type="email" name="email"
                                    class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input v-model="register.password" type="password" name="password"
                                    class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Confirmation Password</label>
                                <input v-model="register.password_confirmation" type="password" name="password_confirmation"
                                    class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-theme btn-lg btn-block">Register</button>    
                            </form>
                        </div>
                        <!-- Form -->
                    </div>
                    <div class="col-md-6  ">
                        <!--  Form -->
                        <div class="form-grid">
                        <form @submit.prevent="SignLogin()">
                        
                            <h2 class="no-span"><b>Loging To Your Account</b></h2>
                            <div class="form-group">
                                <label>Email</label>
                                <input v-model="email" type="email" name="email"
                                    class="form-control" >
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input v-model="password" type="password" name="password"
                                    class="form-control" >
                            </div>
                            <button type="submit" class="btn btn-theme btn-lg btn-block">Login</button>
                            
                        </form>
                        </div>
                        <!-- Form -->
                    </div>
                    <!-- Middle Content Area  End -->
                </div>
                <!-- Row End -->
                </div>
                <!-- Main Container End -->
            </section>
        </div>
        <div v-if="$gate.isAuth()">
            <not-found></not-found>
        </div>
      </div>

</template>

<script>
    export default {
        data()
        {
            return {
                register:{
                    email: '',
                    name:'',
                    password:'',
                    password_confirmation: ''
                },
                email: '',
                password:'',
                errors: []
            }
        },
        methods:
        {
            SignLogin(){
            var token = document.head.querySelector('meta[name="csrf-token"]');
            window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
            axios.post('/login', {
                email: this.email,
                password: this.password,
                })
                .then((res) => {
                    let token = res.data.token;
                    localStorage.setItem('token', token);
                    location.replace("/"); 
                })
                .catch((err) => {
                    this.errors = err.response.data.errors
                });
            },
            SignRegister()
            {
            var token = document.head.querySelector('meta[name="csrf-token"]');
            window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
            axios.post('/register', this.register)
                .then((res) => {
                    let token = res.data.token;
                    localStorage.setItem('token', token);
                    location.replace("/"); 
                })
                .catch((err) => {
                    this.errors = err.response.data.errors
                });
            }
        },
        computed: {
        csrf_token() {
            let token = document.head.querySelector('meta[name="csrf-token"]')
            return token.content
        }
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
