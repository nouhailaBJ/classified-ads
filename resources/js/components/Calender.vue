<style>
.fc-daygrid-event
{
  cursor: pointer;
}
</style>
<template>
 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"><i class="fa fa-calendar" aria-hidden="true"></i> Calender</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->    
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="sticky-top mb-3">
              <!-- /.card -->
              <div class="card">
                <div class="card-header bg-dark">
                  <h3 class="card-title" v-show="!editmode">Create Event</h3>
                  <h3 class="card-title" v-show="editmode">Create Event</h3>
                </div>
                <div class="card-body">
               <form @submit.prevent="editmode ? updatecalendar(): createcalendar()">
                <div class="form-group">
                  <label>Start Date:</label>
                    <div class="input-group date">
                        <input type="date" v-model="form.start_date" name="start_date" class="form-control datetimepicker-input" :class="{ 'is-invalid': form.errors.has('start_date') }"/>
                        <has-error :form="form" field="start_date"></has-error>
                    </div>
                </div>
                <div class="form-group">
                  <label>End Date:</label>
                    <div class="input-group date">
                        <input type="date" v-model="form.end_date"  name="end_date" class="form-control datetimepicker-input" :class="{ 'is-invalid': form.errors.has('end_date') }"/>
                        <has-error :form="form" field="end_date"></has-error>
                    </div>
                </div>
                  <div class="input-group">
                    <input id="new-event" v-model="form.event_name"  name="event_name" 
                    type="text" class="form-control" :class="{ 'is-invalid': form.errors.has('event_name') }" placeholder="Event Title">
                    <has-error :form="form" field="event_name"></has-error>
                    <div class="input-group-append">
                      <button type="submit" v-show="!editmode" class="btn btn-primary bg-dark">Add</button>
                      <button type="submit" v-show="editmode" class="btn btn-primary bg-dark">Update</button>
                    </div>
                    <!-- /btn-group -->
                  </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
               <FullCalendar :options='calendarOptions' :events="events"/>
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
</template>
<script>
import FullCalendar from '@fullcalendar/vue';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from "@fullcalendar/interaction";

    export default {
        components: {
          FullCalendar // make the <FullCalendar> tag available
        },
        data()
        {
            return {
              calendarOptions: {
                plugins: [ dayGridPlugin, interactionPlugin],
                initialView: 'dayGridMonth',
                eventClick: this.DeleteEvent,
                events:[
                ]
              },
              editmode: false,
              events: [],
              form: new Form({
                    id: '',
                    event_name: '',
                    start_date: '',
                    end_date: '',
                })
            }
        },
        methods: {
          convert(str) {
            var date = new Date(str),
              mnth = ("0" + (date.getMonth() + 1)).slice(-2),
              day = ("0" + date.getDate()).slice(-2);
            return [date.getFullYear(), mnth, day].join("-");
          },
          DeleteEvent(clickInfo)
          {
            const swalWithBootstrapButtons = Swal.mixin({
              customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
              },
              buttonsStyling: false
            })

            swalWithBootstrapButtons.fire({
              title: 'Are you sure?',
              text: "You won't be able to revert this!",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonText: 'Update It!',
              cancelButtonText: 'Delete it!',
              reverseButtons: true
            }).then((result) => {
              if (result.value)
              {
                this.editmode = true;
                this.form.reset();
                this.form.id = clickInfo.event.id;
                this.form.event_name = clickInfo.event.title;
                this.form.start_date = this.convert(clickInfo.event.start);
                this.form.end_date = this.convert(clickInfo.event.end);
              } 
              else if (
                result.dismiss === Swal.DismissReason.cancel
              ) {
              clickInfo.event.remove();  
              this.form.delete('/api/calendar/'+clickInfo.event.id).then(() => {
                Fire.$emit('AfterCreate');
                  Swal.fire(
                    'Deleted!',
                    'Your event has been deleted.',
                    'success'
                  )
              }).catch(() => {
                  Swal.fire(
                    'Failed!',
                    'Your event has been deleted.',
                    'warning'
                  )
                })
              }
            })
          },
          loadcalendars()
          {
            axios.get("/api/calendar").then(({data}) => (this.calendarOptions.events= data.data));
          },
          createcalendar()
          {
            this.$Progress.start(); // for progress begin

            this.form.post('/api/calendar')  // for send request to data
            .then( () => { // for success post
              Fire.$emit('AfterCreate');
              this.form.reset();
              Toast.fire({
                icon: 'success',
                title: 'Successfully create new calendar'
              })
              
              this.$Progress.finish(); //for finish the progress
            })
            .catch( () => { //for not success post

            });
          },
          updatecalendar()
          {
            //console.log('editing mode');
            this.$Progress.start();
            this.form.put('/api/calendar/'+this.form.id)
            .then( () => {
              $('#addNew').modal('hide');
              this.form.reset();
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
        },
        created() 
        {
          this.loadcalendars();
          Fire.$on('AfterCreate', () => {
            this.loadcalendars();
          });
        }
    }
</script>
