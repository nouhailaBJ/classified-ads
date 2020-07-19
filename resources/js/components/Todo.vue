<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-check-circle" aria-hidden="true"></i>
                    To Do List</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->    
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
              <div class="card card-dark">
                <div class="card-header">
                  <h3 class="card-title">
                    <i class="fa fa-check-circle" aria-hidden="true"></i>
                    To Do List
                  </h3>
                <div class="card-tools">
                  <button type="button" class="btn btn-light btn-sm" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <ul class="todo-list" data-widget="todo-list">
                    <li v-for="list in lists.data" :key="list.id">
                    <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" @click="changeStatus(list.id, !isChecked(list))" :checked="isChecked(list)" 
                      class="custom-control-input" v-bind:id="'customSwitch'+ list.id">
                      <label class="custom-control-label" v-bind:for="'customSwitch'+ list.id">{{ list.title }}</label>
                      <small class="badge badge-secondary"><i class="far fa-clock"></i> {{ list.created_at | myDate}}</small>
                      <div class="tools">
                      <a class="btn btn-danger white-text bg-danger btn-sm" @click="deleteTodo(list.id)" > 
                        <i class="fas fa-trash"></i> Delete
                      </a>
                      </div>
                    </div>
                    </li>
                  </ul>
                </div>
                <!-- /.card-body -->
                <div class="card-footer clearfix">
                <form @submit.prevent="createList()">
                <div class="input-group input-group-md">
                  <input type="text" placeholder="New thing To Do" name="title" class="form-control" v-model="form.title">
                  <span class="input-group-append">
                 <button type="submit" class="btn btn-info bg-info float-right"><i class="fas fa-plus"></i> Add item</button>
                  </span>
                </div>
                </form>
                </div>
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
        data(){
            return{
              status: '',
              lists: {},
              form: new Form({
                    id: '',
                    title: ''
                })
            }
        },
        methods:
        {
          deleteTodo(id)
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
              this.form.delete('/api/todo/'+id).then(() => {
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
          createList()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/todo')  // for send request to data
            .then( () => { // for success post
              Fire.$emit('AfterCreate');
              this.form.reset()
              // for show the message success
              Toast.fire({
                icon: 'success',
                title: 'Successfully create new thins to do'
              })
              this.$Progress.finish(); //for finish the progress
            })
            .catch( () => { //for not success post

            });
          },
            isChecked(obj) {
                return (obj.status ? 1 : 0);
            },
            changeStatus(id, status)
            {
                this.$Progress.start();
                this.status = (status ? 1 : 0)
                axios.get('/api/todo/status/'+ id +'/'+ this.status)
                .then(() => {
                    this.$Progress.finish();
                    Fire.$emit('AfterCreate');
                }).catch( () => {
                    this.$Progress.fail();
                });
            },
            loadList()
            {
                axios.get('/api/todo').then( ({data}) => (this.lists = data));
            }
        },
        created()
        {
            this.loadList();
            Fire.$on('AfterCreate', () => {
                this.loadList();
            });
        }
    }
</script>
