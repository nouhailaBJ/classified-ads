<template>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-cogs" aria-hidden="true"></i>Setting</h1>
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
                <h3 class="card-title">Settings Table</h3>
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
                    <th>Slug</th>
                    <th>Value</th>
                    <th>Edit</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr v-for="setting in settings.data" :key="setting.id">
                    <td>{{ setting.slug }}</td>
                    <td>{{ setting.value }}</td>
                    <td>
                      <a class="btn btn-info white-text bg-info btn-sm" @click="editModal(setting)">
                        <i class="fas fa-edit"></i> 
                      </a>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
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
                <h4 class="modal-title"><i class="fas fa-plus"></i> Update setting</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form @submit.prevent="updateSetting()">
                <div class="modal-body">
                <div class="form-group">
                    <label>Title</label>
                    <input v-if="!type" v-model="form.value" type="text" name="value"
                        class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                    <textarea class="textarea" v-if="type" v-model="form.value" name="value" required="required"  placeholder="Place some text here"
                        style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                    <has-error :form="form" field="title"></has-error>
                </div>
                </div>
                <div class="modal-footer justify-content-between">
                <button type="button" class="btn  btn-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Update</button>
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
                settings: [],
                type: '',
                form: new Form({
                    id: '',
                    value:''
                }),
            }
        },
        methods:
        {
            editModal(setting)
            {
                this.form.reset();
                this.type = setting.type ? 1 : 0;
                $('#addNew').modal('show');
                this.form.fill(setting);
            },
            updateSetting()
            {
            this.$Progress.start();
            this.form.put('/api/setting/'+this.form.id)
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
            loadSettings()
            {
                axios.get("/api/setting").then(({data}) => (this.settings = data));
            },
        },
        created()
        {
          this.loadSettings();
          Fire.$on('AfterCreate', () => {
            this.loadSettings();
          });
        }
    }
</script>
