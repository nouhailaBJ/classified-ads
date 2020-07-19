<template>
  <!-- Content Wrapper. Contains message content -->
  <div class="content-wrapper">
    <!-- Content Header (message header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-th" aria-hidden="true"></i> messages</h1>
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
                <h3 class="card-title">messages Table</h3>
                <div class="card-tools">
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
                    <th>Id</th>
                    <th>Sender Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>status</th>
                    <th>Added At </th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="message in messages.data" :key="message.id">
                    <td>#{{ message.id}}</td>
                    <td>{{ message.name}}</td>
                    <td>{{ message.email}}</td>
                    <td>{{ message.subject}}</td>
                    <td>
                        <span v-show="message.status" class="badge badge-success">Readed</span>
                        <span v-show="!message.status" class="badge badge-danger">Not Seen</span>
                    </td>
                    <td>{{ message.created_at | myDate}}</td>
                    <td>
                      <a class="btn btn-success white-text bg-success btn-sm"  @click="showModal(message.id, message.status)">
                        <i class="fas fa-eye"></i> 
                      </a>
                      <a class="btn btn-danger white-text bg-danger btn-sm" @click="deletemessage(message.id)" > 
                        <i class="fas fa-trash"></i> Delete
                      </a>
                    </td>
                    <!-- Modal show  -->
                      <div class="modal fade" v-bind:id="'show'+message.id">
                        <div class="modal-dialog modal-lg">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h4 class="modal-title"><i class="fas fa-plus"></i> Show message </h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                <h3 class="my-3">{{ message.subject }}</h3>
                                <p>From : {{ message.email }}</p>
                                <hr>
                                <p>{{ message.message }}</p>
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
                <pagination :data="messages" @pagination-change-message="getResults"></pagination>
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
  </div>
  <!-- /.content-wrapper -->

</template>
<script>
    export default {
        data()
        {
            return {
              editmode: true,
              messages: {},
              form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    subject: '',
                    message: '',
                    status: '',
                })
            }
        },
        methods: {
          showModal(id, status)
          {
            if (status == '0')
                this.UpdateStatus(id);
            $('#show'+id).modal('show');
          },
          UpdateStatus(id)
          {
                this.$Progress.start();
                axios.get('/api/message/status/'+ id)
                .then(() => {
                    this.$Progress.finish();
                    Fire.$emit('AfterCreate');
                }).catch( () => {
                    this.$Progress.fail();
                });
          },
          getResults(message = 1) {
            axios.get('/api/message?message=' + message)
              .then(response => {
                this.messages = response.data;
              });
          },
          loadmessages()
          {
            axios.get("/api/message").then(({data}) => (this.messages = data));
          },
          deletemessage(id)
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
              this.form.delete('/api/message/'+id).then(() => {
                Fire.$emit('AfterCreate');
              
                  Swal.fire(
                    'Deleted!',
                    'Your message has been deleted.',
                    'success'
                  )
              }).catch(() => {
                  Swal.fire(
                    'Failed!',
                    'Your message has been deleted.',
                    'warning'
                  )
                })
              }
            })
          },
        },
        created() 
        {
          Fire.$on('searching', () => {
            let query = this.$parent.search; // get the data from parent  its in app.js
                axios.get('/api/findMessage?q=' + query)
                .then((data) => {
                    this.messages = data.data
                })
                .catch(() => {
                })
          })
          this.loadmessages();
          Fire.$on('AfterCreate', () => {
            this.loadmessages();
          });
        }
    }
</script>
