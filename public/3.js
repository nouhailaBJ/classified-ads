(window.webpackJsonp=window.webpackJsonp||[]).push([[3],{13:function(t,s,a){var e=a(182);"string"==typeof e&&(e=[[t.i,e,""]]);var i={hmr:!0,transform:void 0,insertInto:void 0};a(4)(e,i);e.locals&&(t.exports=e.locals)},181:function(t,s,a){"use strict";var e=a(13);a.n(e).a},182:function(t,s,a){(t.exports=a(3)(!1)).push([t.i,"\n.product-image\n{\n    height:400px;\n    margin-bottom: 20px;\n}\n",""])},246:function(t,s,a){"use strict";a.r(s);var e={data:function(){return{editmode:!0,blogs:{},form:new Form({id:"",title:"",description:"",tags:"",status:"",image:""})}},methods:{showModal:function(t){$("#show"+t).modal("show")},updateImage:function(t){var s=this,a=t.target.files[0],e=new FileReader;if(a.size>2097152)return Swal.fire("Failed!","You are uploading a large file.","warning"),!1;e.onloadend=function(t){s.form.image=e.result},e.readAsDataURL(a)},getResults:function(){var t=this,s=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;axios.get("/api/blog?page="+s).then((function(s){t.blogs=s.data}))},newModal:function(){this.editmode=!1,this.form.reset(),$("#addNew").modal("show")},editModal:function(t){this.editmode=!0,this.form.reset(),$("#addNew").modal("show"),this.form.fill(t)},loadBlogs:function(){var t=this;axios.get("/api/blog").then((function(s){var a=s.data;return t.blogs=a}))},createBlog:function(){var t=this;this.$Progress.start(),this.form.post("/api/blog").then((function(){Fire.$emit("AfterCreate"),$("#addNew").modal("hide"),$("#addNew").removeClass("in"),$(".modal-backdrop").remove(),$("body").removeClass("modal-open"),$("body").css("padding-right",""),$("#addNew").hide(),Toast.fire({icon:"success",title:"Successfully create new blog"}),t.$Progress.finish()})).catch((function(){}))},deleteBlog:function(t){var s=this;Swal.fire({title:"Are you sure?",text:"You won't be able to revert this!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Yes, delete it!"}).then((function(a){a.value&&s.form.delete("/api/blog/"+t).then((function(){Fire.$emit("AfterCreate"),Swal.fire("Deleted!","Your blog has been deleted.","success")})).catch((function(){Swal.fire("Failed!","Your blog has been deleted.","warning")}))}))},updateBlog:function(){var t=this;this.$Progress.start(),this.form.put("/api/blog/"+this.form.id).then((function(){$("#addNew").modal("hide"),Swal.fire("Updated!","Your information has been updated.","success"),t.$Progress.finish(),Fire.$emit("AfterCreate")})).catch((function(){t.$Progress.fail()}))}},created:function(){var t=this;Fire.$on("searching",(function(){var s=t.$parent.search;axios.get("/api/findBlog?q="+s).then((function(s){t.blogs=s.data})).catch((function(){}))})),this.loadBlogs(),Fire.$on("AfterCreate",(function(){t.loadBlogs()}))}},i=(a(181),a(2)),o=Object(i.a)(e,(function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("div",{staticClass:"content-wrapper"},[t._m(0),t._v(" "),a("div",{staticClass:"content"},[a("div",{staticClass:"container-fluid"},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-12"},[a("div",{staticClass:"card"},[a("div",{staticClass:"card-header"},[a("h3",{staticClass:"card-title"},[t._v("Blogs Table")]),t._v(" "),a("div",{staticClass:"card-tools"},[a("button",{staticClass:"btn btn-dark",attrs:{type:"button"},on:{click:t.newModal}},[a("i",{staticClass:"fas fa-plus"}),t._v(" Add New\n                ")]),t._v(" "),t._m(1)])]),t._v(" "),a("div",{staticClass:"card-body"},[a("table",{staticClass:"table table-bordered table-striped",attrs:{id:"example1"}},[t._m(2),t._v(" "),a("tbody",t._l(t.blogs.data,(function(s){return a("tr",{key:s.id},[a("td",[a("a",{attrs:{href:"/uploads/blogs/"+s.image,"data-toggle":"lightbox","data-title":s.title,"data-gallery":"gallery"}},[a("img",{staticClass:"img-size-64",attrs:{src:"/uploads/blogs/"+s.image,title:s.title}})])]),t._v(" "),a("td",[t._v(t._s(s.title))]),t._v(" "),a("td",[a("span",{directives:[{name:"show",rawName:"v-show",value:s.status,expression:"blog.status"}],staticClass:"badge badge-success"},[t._v("Enabled")]),t._v(" "),a("span",{directives:[{name:"show",rawName:"v-show",value:!s.status,expression:"!blog.status"}],staticClass:"badge badge-danger"},[t._v("Disabled")])]),t._v(" "),a("td",[t._v(t._s(t._f("myDate")(s.created_at)))]),t._v(" "),a("td",[a("a",{staticClass:"btn btn-success white-text bg-success btn-sm",on:{click:function(a){return t.showModal(s.id)}}},[a("i",{staticClass:"fas fa-eye"})]),t._v(" "),a("a",{staticClass:"btn btn-info white-text bg-info btn-sm",on:{click:function(a){return t.editModal(s)}}},[a("i",{staticClass:"fas fa-edit"}),t._v(" Edit\n                    ")]),t._v(" "),a("a",{staticClass:"btn btn-danger white-text bg-danger btn-sm",on:{click:function(a){return t.deleteBlog(s.id)}}},[a("i",{staticClass:"fas fa-trash"}),t._v(" Delete\n                    ")])]),t._v(" "),a("div",{staticClass:"modal fade",attrs:{id:"show"+s.id}},[a("div",{staticClass:"modal-dialog modal-lg"},[a("div",{staticClass:"modal-content"},[t._m(3,!0),t._v(" "),a("div",{staticClass:"modal-body"},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-md-12"},[a("h3",{staticClass:"d-inline-block "},[t._v(t._s(s.title))])]),t._v(" "),a("div",{staticClass:"col-12"},[a("img",{staticClass:"product-image",attrs:{src:"/uploads/blogs/"+s.image,title:s.title}})]),t._v(" "),a("div",{staticClass:"col-12"},[a("p",{domProps:{innerHTML:t._s(s.description)}}),t._v(" "),a("hr"),t._v(" "),a("div",{staticClass:"py-2 px-3 mt-4"},[a("h2",{staticClass:"mb-0"},[t._v("\n                                    Tags : "+t._s(s.tags)+"\n                                  ")])])])])]),t._v(" "),t._m(4,!0)])])])])})),0)])]),t._v(" "),a("div",{staticClass:"card-footer"},[a("pagination",{attrs:{data:t.blogs},on:{"pagination-change-page":t.getResults}})],1)])])])])]),t._v(" "),a("div",{staticClass:"modal fade",attrs:{id:"addNew"}},[a("div",{staticClass:"modal-dialog modal-lg"},[a("div",{staticClass:"modal-content"},[a("div",{staticClass:"modal-header"},[a("h4",{directives:[{name:"show",rawName:"v-show",value:!t.editmode,expression:"!editmode"}],staticClass:"modal-title"},[a("i",{staticClass:"fas fa-plus"}),t._v(" Add New Blog")]),t._v(" "),a("h4",{directives:[{name:"show",rawName:"v-show",value:t.editmode,expression:"editmode"}],staticClass:"modal-title"},[a("i",{staticClass:"fas fa-edit"}),t._v("Update Blog")]),t._v(" "),t._m(5)]),t._v(" "),a("form",{on:{submit:function(s){s.preventDefault(),t.editmode?t.updateBlog():t.createBlog()}}},[a("div",{staticClass:"modal-body"},[a("div",{staticClass:"form-group"},[a("label",[t._v("Title")]),t._v(" "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.form.title,expression:"form.title"}],staticClass:"form-control",class:{"is-invalid":t.form.errors.has("title")},attrs:{type:"text",name:"title"},domProps:{value:t.form.title},on:{input:function(s){s.target.composing||t.$set(t.form,"title",s.target.value)}}}),t._v(" "),a("has-error",{attrs:{form:t.form,field:"title"}})],1),t._v(" "),a("div",{staticClass:"form-group"},[a("label",{attrs:{for:"inputDescription"}},[t._v("Blog Description")]),t._v(" "),a("ckeditor",{attrs:{name:"description"},model:{value:t.form.description,callback:function(s){t.$set(t.form,"description",s)},expression:"form.description"}}),t._v(" "),a("has-error",{attrs:{form:t.form,field:"description"}})],1),t._v(" "),a("div",{staticClass:"form-group"},[a("label",{attrs:{for:"inputStatus"}},[t._v("Status")]),t._v(" "),a("select",{directives:[{name:"model",rawName:"v-model",value:t.form.status,expression:"form.status"}],staticClass:"custom-select form-control",class:{"is-invalid":t.form.errors.has("status")},attrs:{name:"status"},on:{change:function(s){var a=Array.prototype.filter.call(s.target.options,(function(t){return t.selected})).map((function(t){return"_value"in t?t._value:t.value}));t.$set(t.form,"status",s.target.multiple?a:a[0])}}},[a("option",{attrs:{selected:"",disabled:""}},[t._v("Select one")]),t._v(" "),a("option",{attrs:{value:"1"}},[t._v("Enabled")]),t._v(" "),a("option",{attrs:{value:"0"}},[t._v("Disabled")])]),t._v(" "),a("has-error",{attrs:{form:t.form,field:"status"}})],1),t._v(" "),a("div",{staticClass:"form-group"},[a("label",{attrs:{for:"inputProjectLeader"}},[t._v("Tags")]),t._v(" "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.form.tags,expression:"form.tags"}],staticClass:"form-control",class:{"is-invalid":t.form.errors.has("tags")},attrs:{type:"text",id:"inputProjectLeader",placeholder:"tags",name:"tags"},domProps:{value:t.form.tags},on:{input:function(s){s.target.composing||t.$set(t.form,"tags",s.target.value)}}}),t._v(" "),a("has-error",{attrs:{form:t.form,field:"tags"}})],1),t._v(" "),a("div",{staticClass:"form-group"},[a("label",[t._v("Blog Image")]),t._v(" "),a("input",{staticClass:"form-control",class:{"is-invalid":t.form.errors.has("image")},attrs:{type:"file",name:"image"},on:{change:t.updateImage}}),t._v(" "),a("has-error",{attrs:{form:t.form,field:"image"}})],1)]),t._v(" "),a("div",{staticClass:"modal-footer justify-content-between"},[a("button",{staticClass:"btn  btn-danger",attrs:{type:"button","data-dismiss":"modal"}},[t._v("Close")]),t._v(" "),a("button",{directives:[{name:"show",rawName:"v-show",value:t.editmode,expression:"editmode"}],staticClass:"btn btn-success",attrs:{type:"submit"}},[t._v("Update")]),t._v(" "),a("button",{directives:[{name:"show",rawName:"v-show",value:!t.editmode,expression:"!editmode"}],staticClass:"btn btn-primary",attrs:{type:"submit"}},[t._v("Create")])])])])])])])}),[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"content-header"},[s("div",{staticClass:"container-fluid"},[s("div",{staticClass:"row mb-2"},[s("div",{staticClass:"col-sm-6"},[s("h1",{staticClass:"m-0 text-dark"},[s("i",{staticClass:"fa fa-th",attrs:{"aria-hidden":"true"}}),this._v(" Blogs")])])])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("button",{staticClass:"btn btn-dark",attrs:{type:"button","data-card-widget":"collapse"}},[s("i",{staticClass:"fas fa-minus"})])},function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("thead",{staticClass:"bg-dark"},[a("tr",[a("th",[t._v("Image")]),t._v(" "),a("th",[t._v("Title")]),t._v(" "),a("th",[t._v("status")]),t._v(" "),a("th",[t._v("Added At ")]),t._v(" "),a("th",[t._v("Actions")])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"modal-header"},[s("h4",{staticClass:"modal-title"},[s("i",{staticClass:"fas fa-plus"}),this._v(" Show Blog ")]),this._v(" "),s("button",{staticClass:"close",attrs:{type:"button","data-dismiss":"modal","aria-label":"Close"}},[s("span",{attrs:{"aria-hidden":"true"}},[this._v("×")])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"modal-footer justify-content-between"},[s("button",{staticClass:"btn  btn-danger",attrs:{type:"button","data-dismiss":"modal"}},[this._v("Close")])])},function(){var t=this.$createElement,s=this._self._c||t;return s("button",{staticClass:"close",attrs:{type:"button","data-dismiss":"modal","aria-label":"Close"}},[s("span",{attrs:{"aria-hidden":"true"}},[this._v("×")])])}],!1,null,null,null);s.default=o.exports}}]);
//# sourceMappingURL=3.js.map