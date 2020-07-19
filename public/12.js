(window.webpackJsonp=window.webpackJsonp||[]).push([[12],{244:function(t,e,a){"use strict";a.r(e);var s={data:function(){return{editmode:!0,categories:{},parents:{},form:new Form({id:"",name:"",parents:"",icon:""})}},methods:{loadParent:function(){var t=this;axios.get("/api/cat_product").then((function(e){var a=e.data;return t.parents=a}))},getResults:function(){var t=this,e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;axios.get("/api/category?page="+e).then((function(e){t.categories=e.data}))},newModal:function(){this.editmode=!1,this.form.reset(),$("#addNew").modal("show")},editModal:function(t){this.editmode=!0,this.form.reset(),$("#addNew").modal("show"),this.form.fill(t)},loadCategory:function(){var t=this;axios.get("/api/category").then((function(e){var a=e.data;return t.categories=a}))},createCategory:function(){var t=this;this.$Progress.start(),this.form.post("/api/category").then((function(){Fire.$emit("AfterCreate"),$("#addNew").modal("hide"),$("#addNew").removeClass("in"),$(".modal-backdrop").remove(),$("body").removeClass("modal-open"),$("body").css("padding-right",""),$("#addNew").hide(),Toast.fire({icon:"success",title:"Successfully create new category"}),t.$Progress.finish()})).catch((function(){}))},deleteCategory:function(t){var e=this;Swal.fire({title:"Are you sure?",text:"You won't be able to revert this!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Yes, delete it!"}).then((function(a){a.value&&e.form.delete("/api/category/"+t).then((function(){Fire.$emit("AfterCreate"),Swal.fire("Deleted!","Your category has been deleted.","success")})).catch((function(){Swal.fire("Failed!","Your category has been deleted.","warning")}))}))},updateCategory:function(){var t=this;this.$Progress.start(),this.form.put("/api/category/"+this.form.id).then((function(){$("#addNew").modal("hide"),Swal.fire("Updated!","Your information has been updated.","success"),t.$Progress.finish(),Fire.$emit("AfterCreate")})).catch((function(){t.$Progress.fail()}))}},created:function(){var t=this;Fire.$on("searching",(function(){var e=t.$parent.search;axios.get("/api/findCategory?q="+e).then((function(e){t.categories=e.data})).catch((function(){}))})),this.loadCategory(),this.loadParent(),Fire.$on("AfterCreate",(function(){t.loadCategory(),t.loadParent()}))}},i=a(2),r=Object(i.a)(s,(function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"content-wrapper"},[t._m(0),t._v(" "),a("div",{staticClass:"content"},[a("div",{staticClass:"container-fluid"},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-12"},[a("div",{staticClass:"card"},[a("div",{staticClass:"card-header"},[a("h3",{staticClass:"card-title"},[t._v("Categories Table")]),t._v(" "),a("div",{staticClass:"card-tools"},[a("button",{staticClass:"btn btn-dark",attrs:{type:"button"},on:{click:t.newModal}},[a("i",{staticClass:"fas fa-plus"}),t._v(" Add New\n                ")]),t._v(" "),t._m(1)])]),t._v(" "),a("div",{staticClass:"card-body"},[a("table",{staticClass:"table table-bordered table-striped",attrs:{id:"example1"}},[t._m(2),t._v(" "),a("tbody",t._l(t.categories.data,(function(e){return a("tr",{key:e.id},[a("td",[t._v(t._s(e.name))]),t._v(" "),a("td",[a("div",{directives:[{name:"show",rawName:"v-show",value:!e.parents,expression:"!category.parents"}]},[t._v(" Parent")]),t._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:e.parents,expression:"category.parents"}]},[t._v(" Sub Category")])]),t._v(" "),a("td",[t._v(t._s(t._f("myDate")(e.created_at)))]),t._v(" "),a("td",[a("a",{staticClass:"btn btn-info white-text bg-info btn-sm",on:{click:function(a){return t.editModal(e)}}},[a("i",{staticClass:"fas fa-edit"}),t._v(" Edit\n                    ")]),t._v(" "),a("a",{staticClass:"btn btn-danger white-text bg-danger btn-sm",on:{click:function(a){return t.deleteCategory(e.id)}}},[a("i",{staticClass:"fas fa-trash"}),t._v(" Delete\n                    ")])])])})),0)])]),t._v(" "),a("div",{staticClass:"card-footer"},[a("pagination",{attrs:{data:t.categories},on:{"pagination-change-page":t.getResults}})],1)])])])])]),t._v(" "),a("div",{staticClass:"modal fade",attrs:{id:"addNew"}},[a("div",{staticClass:"modal-dialog"},[a("div",{staticClass:"modal-content"},[a("div",{staticClass:"modal-header"},[a("h4",{directives:[{name:"show",rawName:"v-show",value:!t.editmode,expression:"!editmode"}],staticClass:"modal-title"},[a("i",{staticClass:"fas fa-plus"}),t._v(" Add New category")]),t._v(" "),a("h4",{directives:[{name:"show",rawName:"v-show",value:t.editmode,expression:"editmode"}],staticClass:"modal-title"},[a("i",{staticClass:"fas fa-edit"}),t._v("Update category")]),t._v(" "),t._m(3)]),t._v(" "),a("form",{on:{submit:function(e){e.preventDefault(),t.editmode?t.updateCategory():t.createCategory()}}},[a("div",{staticClass:"modal-body"},[a("div",{staticClass:"form-group"},[a("label",[t._v("Name")]),t._v(" "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.form.name,expression:"form.name"}],staticClass:"form-control",class:{"is-invalid":t.form.errors.has("name")},attrs:{type:"text",name:"name"},domProps:{value:t.form.name},on:{input:function(e){e.target.composing||t.$set(t.form,"name",e.target.value)}}}),t._v(" "),a("has-error",{attrs:{form:t.form,field:"name"}})],1),t._v(" "),a("div",{staticClass:"form-group"},[a("label",[t._v("Icon")]),t._v(" "),a("input",{directives:[{name:"model",rawName:"v-model",value:t.form.icon,expression:"form.icon"}],staticClass:"form-control",class:{"is-invalid":t.form.errors.has("icon")},attrs:{type:"text",name:"icon"},domProps:{value:t.form.icon},on:{input:function(e){e.target.composing||t.$set(t.form,"icon",e.target.value)}}}),t._v(" "),a("has-error",{attrs:{form:t.form,field:"icon"}})],1),t._v(" "),a("div",{staticClass:"form-group"},[a("label",[t._v("Parents")]),t._v(" "),a("select",{directives:[{name:"model",rawName:"v-model",value:t.form.parents,expression:"form.parents"}],staticClass:"form-control",class:{"is-invalid":t.form.errors.has("parents")},attrs:{name:"parents",id:"parents"},on:{change:function(e){var a=Array.prototype.filter.call(e.target.options,(function(t){return t.selected})).map((function(t){return"_value"in t?t._value:t.value}));t.$set(t.form,"parents",e.target.multiple?a:a[0])}}},[a("option",{attrs:{value:""}},[t._v("Select Parent Category")]),t._v(" "),a("option",{attrs:{value:"0"}},[t._v("Parent")]),t._v(" "),t._l(t.parents.data,(function(e){return a("option",{key:e.id,domProps:{value:e.id}},[t._v("\n                      "+t._s(e.name)+"\n                      ")])}))],2),t._v(" "),a("has-error",{attrs:{form:t.form,field:"parents"}})],1)]),t._v(" "),a("div",{staticClass:"modal-footer justify-content-between"},[a("button",{staticClass:"btn  btn-danger",attrs:{type:"button","data-dismiss":"modal"}},[t._v("Close")]),t._v(" "),a("button",{directives:[{name:"show",rawName:"v-show",value:t.editmode,expression:"editmode"}],staticClass:"btn btn-success",attrs:{type:"submit"}},[t._v("Update")]),t._v(" "),a("button",{directives:[{name:"show",rawName:"v-show",value:!t.editmode,expression:"!editmode"}],staticClass:"btn btn-primary",attrs:{type:"submit"}},[t._v("Create")])])])])])])])}),[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"content-header"},[e("div",{staticClass:"container-fluid"},[e("div",{staticClass:"row mb-2"},[e("div",{staticClass:"col-sm-6"},[e("h1",{staticClass:"m-0 text-dark"},[e("i",{staticClass:"fa fa-users",attrs:{"aria-hidden":"true"}}),this._v(" Categories")])])])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("button",{staticClass:"btn btn-dark",attrs:{type:"button","data-card-widget":"collapse"}},[e("i",{staticClass:"fas fa-minus"})])},function(){var t=this.$createElement,e=this._self._c||t;return e("thead",{staticClass:"bg-dark"},[e("tr",[e("th",[this._v("Name")]),this._v(" "),e("th",[this._v("Type")]),this._v(" "),e("th",[this._v("Added At ")]),this._v(" "),e("th",[this._v("Actions")])])])},function(){var t=this.$createElement,e=this._self._c||t;return e("button",{staticClass:"close",attrs:{type:"button","data-dismiss":"modal","aria-label":"Close"}},[e("span",{attrs:{"aria-hidden":"true"}},[this._v("×")])])}],!1,null,null,null);e.default=r.exports}}]);
//# sourceMappingURL=12.js.map