(window.webpackJsonp=window.webpackJsonp||[]).push([[8],{18:function(t,a,s){var e=s(196);"string"==typeof e&&(e=[[t.i,e,""]]);var i={hmr:!0,transform:void 0,insertInto:void 0};s(4)(e,i);e.locals&&(t.exports=e.locals)},195:function(t,a,s){"use strict";var e=s(18);s.n(e).a},196:function(t,a,s){(t.exports=s(3)(!1)).push([t.i,"\n@media(min-width:768px)\n{\n.post-img img\n    {\n        height:200px;\n}\n}\n.img-size-64\n{\n    width: 64px;\n    height: 64px;\n}\n",""])},265:function(t,a,s){"use strict";s.r(a);var e=s(8),i={components:{carousel:s.n(e).a},data:function(){return{categories:{},products:{},locations:{},subcats:{},form2:new FormData,attachments:[],medias:{},form:new Form({id:"",name:"",number:"",email:"",password:"",avatar:"",location:""}),form3:new Form({id:"",title:"",description:"",tags:"",location:"",status:"",price:"",cat_id:"",image:"",sub_id:""})}},methods:{changeSub:function(){Fire.$emit("AfterShow")},uploadImage:function(t){var a=this,s=t.target.files[0],e=new FileReader;if(s.size>2097152)return Swal.fire("Failed!","You are uploading a large file.","warning"),!1;e.onloadend=function(t){a.form3.image=e.result},e.readAsDataURL(s)},editModal:function(t){this.editmode=!0,this.form3.reset(),$("#addNew").modal("show"),this.form3.fill(t)},loadCategory:function(){var t=this;axios.get("/api/cat_product").then((function(a){var s=a.data;return t.categories=s}))},loadSubCategory:function(){var t=this;""!=this.form3.cat_id&&axios.get("/api/sub_cat/"+this.form3.cat_id).then((function(a){var s=a.data;return t.subcats=s}))},loadLocation:function(){var t=this;axios.get("/api/location").then((function(a){var s=a.data;return t.locations=s}))},updateProduct:function(){var t=this;this.$Progress.start(),this.form3.put("/api/product/"+this.form3.id).then((function(){$("#addNew").modal("hide"),Swal.fire("Updated!","Your information has been updated.","success"),t.$Progress.finish(),Fire.$emit("AfterCreate")})).catch((function(){t.$Progress.fail()}))},loadPicture:function(t){var a=this;axios.get("/api/pro_image/"+t).then((function(t){var s=t.data;return a.medias=s}))},newModal2:function(t){this.form2.append("proid",t),this.attachments.length=0,this.form2.delete("pics[]"),$("#images").modal("show"),this.loadPicture(t)},fieldChange:function(t){var a=t.target.files;if(!a.length)return!1;for(var s=0;s<a.length;s++)this.attachments.push(a[s])},uploadFile:function(){for(var t=this,a=0;a<this.attachments.length;a++)this.form2.append("pics[]",this.attachments[a]);this.$Progress.start(),document.getElementById("upload-file").value=[],axios.post("/api/pro_image",this.form2).then((function(a){$("#images").modal("hide"),$("#images").removeClass("in"),$(".modal-backdrop").remove(),$("body").removeClass("modal-open"),$("body").css("padding-right",""),$("#images").hide(),Toast.fire({icon:"success",title:"Successfully added new Picture"}),t.$Progress.finish()})).catch((function(t){}))},deleteImage:function(t){Swal.fire({title:"Are you sure?",text:"You won't be able to revert this!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Yes, delete it!"}).then((function(a){a.value&&axios.delete("/api/delete_image/"+t).then((function(){$("#images").modal("hide"),$("#images").removeClass("in"),$(".modal-backdrop").remove(),$("body").removeClass("modal-open"),$("body").css("padding-right",""),$("#images").hide(),Swal.fire("Deleted!","Your file has been deleted.","success")})).catch((function(){Swal.fire("Failed!","Your file has been deleted.","warning")}))}))},deleteProduct:function(t){var a=this;Swal.fire({title:"Are you sure?",text:"You won't be able to revert this!",icon:"warning",showCancelButton:!0,confirmButtonColor:"#3085d6",cancelButtonColor:"#d33",confirmButtonText:"Yes, delete it!"}).then((function(s){s.value&&a.form.delete("/api/product/"+t).then((function(){Fire.$emit("AfterCreate"),Swal.fire("Deleted!","Your Product has been deleted.","success")})).catch((function(){Swal.fire("Failed!","Your Product has been not deleted.","warning")}))}))},getResults:function(){var t=this,a=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;axios.get("/api/announces?page="+a).then((function(a){t.products=a.data}))},loadProducts:function(){var t=this;axios.get("/api/announces").then((function(a){var s=a.data;return t.products=s}))},getUser:function(){var t=this;axios.get("/api/profile").then((function(a){var s=a.data;return t.form.fill(s)}))}},created:function(){var t=this;this.getUser(),this.loadProducts(),this.loadLocation(),this.loadCategory(),this.loadSubCategory(),Fire.$on("AfterCreate",(function(){t.loadProducts()})),Fire.$on("AfterShow",(function(){t.loadSubCategory()}))}},o=(s(195),s(2)),r=Object(o.a)(i,(function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"main-content-area clearfix"},[t.$gate.isAuth()?s("section",{staticClass:"section-padding gray"},[s("div",{staticClass:"container"},[s("div",{staticClass:"row"},[s("div",{staticClass:"col-md-4 col-xs-12 col-sm-6"},[s("div",{staticClass:"white-bg user-contact-info"},[s("div",{staticClass:"user-info-card"},[s("div",{staticClass:"user-photo col-md-4 col-sm-3  col-xs-4"},[s("img",{staticClass:"img-circle",attrs:{src:"/uploads/avatar/"+this.form.avatar,alt:""}})]),t._v(" "),s("div",{staticClass:"user-information  col-md-8 col-sm-9 col-xs-8"},[s("span",{staticClass:"user-name"},[s("a",{staticClass:"hover-color",attrs:{href:"#"}},[t._v(t._s(this.form.name))])]),t._v(" "),s("div",{staticClass:"item-date"},[s("span",{staticClass:"ad-pub"},[t._v("Joined At : "+t._s(t._f("myDate")(this.form.created_at)))]),s("br")])]),t._v(" "),s("div",{staticClass:"clearfix"})]),t._v(" "),s("hr"),t._v(" "),s("div",{staticClass:"ad-listing-meta"},[s("ul",[s("li",[t._v("Email Address : "),s("span",{staticClass:"color"},[t._v(t._s(this.form.email))])]),t._v(" "),s("li",[t._v("Phone Number : "),s("span",{staticClass:"color"},[t._v(t._s(this.form.number))])]),t._v(" "),s("li",[t._v("City: "),s("span",{staticClass:"color"},[t._v(t._s(this.form.location))])])])])])]),t._v(" "),s("div",{staticClass:"col-md-8 col-xs-12 col-sm-6"},[s("div",{staticClass:"row"},[s("div",{staticClass:"posts-masonry"},t._l(t.products.data,(function(a){return s("div",{key:a.id,staticClass:"col-md-6 col-sm-6 col-xs-12"},[s("div",{staticClass:"blog-post"},[s("div",{staticClass:"post-img"},[s("a",{attrs:{href:"#ad-preview-"+a.id,"data-toggle":"modal"}},[s("img",{staticClass:"img-responsive",attrs:{alt:"",height:"200px",src:"/uploads/product/"+a.image}})])]),t._v(" "),s("div",{staticClass:"post-info"},[s("a",{attrs:{href:"#"}},[t._v(t._s(t._f("myDate")(a.created_at)))]),t._v(" "),s("a",{attrs:{href:"#"}},[a.status?s("span",{staticClass:"label label-success"},[t._v("Enabled")]):t._e(),t._v(" "),a.status?t._e():s("span",{staticClass:"label label-danger"},[t._v("Disabled")])])]),t._v(" "),s("h3",{staticClass:"post-title"},[s("a",{attrs:{href:"#ad-preview-"+a.id,"data-toggle":"modal"}},[t._v(" "+t._s(a.title)+" ")])]),t._v(" "),s("a",{staticClass:"btn btn-primary margin-bottom-10",staticStyle:{color:"#fff"},attrs:{href:"#ad-preview-"+a.id,"data-toggle":"modal"}},[s("i",{staticClass:"fa fa-eye"})]),t._v(" "),s("a",{staticClass:"btn btn-success margin-bottom-10",staticStyle:{color:"#fff"},on:{click:function(s){return t.editModal(a)}}},[s("i",{staticClass:"fa fa-edit"})]),t._v(" "),s("a",{staticClass:"btn btn-warning margin-bottom-10",staticStyle:{color:"#fff"},on:{click:function(s){return t.newModal2(a.id)}}},[s("i",{staticClass:"fa fa-picture-o"})]),t._v(" "),s("a",{staticClass:"btn btn-danger margin-bottom-10",staticStyle:{color:"#fff"},on:{click:function(s){return t.deleteProduct(a.id)}}},[s("i",{staticClass:"fa fa-trash"})])]),t._v(" "),s("div",{staticClass:"quick-view-modal modalopen",attrs:{id:"ad-preview-"+a.id,tabindex:"-1",role:"dialog","aria-hidden":"true"}},[s("div",{staticClass:"modal-dialog modal-lg ad-modal"},[t._m(0,!0),t._v(" "),s("div",{staticClass:"modal-content single-product"},[s("div",{staticClass:"diblock"},[s("div",{staticClass:"col-lg-7 col-sm-12 col-xs-12"},[s("carousel",{attrs:{autoplay:!0,responsive:{0:{items:1,nav:!1}}}},[s("div",[s("img",{attrs:{src:"/uploads/product/"+a.image}})]),t._v(" "),t._l(a.images,(function(t){return s("div",{key:t.id},[s("img",{attrs:{src:"/uploads/product/"+t.image}})])}))],2)],1),t._v(" "),s("div",{staticClass:" col-sm-12 col-lg-5 col-xs-12"},[s("div",{staticClass:"summary entry-summary"},[s("div",{staticClass:"ad-preview-details"},[s("a",{attrs:{href:"#"}},[s("h4",[t._v(" "+t._s(a.title))])]),t._v(" "),s("div",{staticClass:"overview-price"},[s("span",[t._v("$ "+t._s(a.price))])]),t._v(" "),s("div",{staticClass:"clearfix"}),t._v(" "),s("p",[t._v(" "+t._s(a.description))]),t._v(" "),s("ul",{staticClass:"ad-preview-info col-md-6 col-sm-6"},[s("li",[s("span",[t._v("Added At:")]),t._v(" "),s("p",[t._v(" "+t._s(t._f("myDate")(a.created_at)))])]),t._v(" "),s("li",[s("span",[t._v("Location:")]),t._v(" "),s("p",[t._v(t._s(a.location))])]),t._v(" "),s("li",[s("span",[t._v("Category:")]),t._v(" "),s("p",[t._v(" "+t._s(a.cat.name))])]),t._v(" "),s("li",[s("span",[t._v("Tags:")]),t._v(" "),s("p",[t._v(" "+t._s(a.tags))])])]),t._v(" "),s("ul",{staticClass:"ad-preview-info col-md-6 col-sm-6"},[s("li",[s("span",[s("a",{attrs:{href:"#"}},[s("img",{staticClass:"avatar_ads",attrs:{src:"/uploads/avatar/"+a.user.avatar,alt:""}})])]),t._v(" "),s("p",[t._v(" "+t._s(a.user.name))])]),t._v(" "),s("li",[s("span",[t._v("Number")]),t._v(" "),s("p",[t._v(t._s(a.user.number))])]),t._v(" "),s("li",[s("span",[t._v("Member since:")]),t._v(" "),s("p",[t._v(t._s(t._f("myDate")(a.user.created_at)))])])])])])])])])])])])})),0)])]),t._v(" "),s("div",{staticClass:"col-md-12"},[s("pagination",{attrs:{data:t.products},on:{"pagination-change-page":t.getResults}})],1)])]),t._v(" "),s("div",{staticClass:"modal price-quote",attrs:{id:"addNew","aria-hidden":"true"}},[s("div",{staticClass:"modal-dialog"},[s("div",{staticClass:"modal-content"},[t._m(1),t._v(" "),s("form",{on:{submit:function(a){return a.preventDefault(),t.updateProduct()}}},[s("div",{staticClass:"modal-body"},[s("div",{staticClass:"form-group"},[s("label",[t._v("Title")]),t._v(" "),s("input",{directives:[{name:"model",rawName:"v-model",value:t.form3.title,expression:"form3.title"}],staticClass:"form-control",class:{"is-invalid":t.form3.errors.has("title")},attrs:{type:"text",name:"title"},domProps:{value:t.form3.title},on:{input:function(a){a.target.composing||t.$set(t.form3,"title",a.target.value)}}}),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"title"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputDescription"}},[t._v("Product Description")]),t._v(" "),s("textarea",{directives:[{name:"model",rawName:"v-model",value:t.form3.description,expression:"form3.description"}],staticClass:"description form-control",class:{"is-invalid":t.form3.errors.has("description")},staticStyle:{width:"100%",height:"200px","font-size":"14px","line-height":"18px",border:"1px solid #dddddd",padding:"10px"},attrs:{name:"description",id:"textarea",placeholder:"Place some text here"},domProps:{value:t.form3.description},on:{input:function(a){a.target.composing||t.$set(t.form3,"description",a.target.value)}}}),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"description"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputClientCompany"}},[t._v("Price")]),t._v(" "),s("input",{directives:[{name:"model",rawName:"v-model",value:t.form3.price,expression:"form3.price"}],staticClass:" form-control",class:{"is-invalid":t.form3.errors.has("price")},attrs:{type:"number",id:"inputClientCompany",name:"price"},domProps:{value:t.form3.price},on:{input:function(a){a.target.composing||t.$set(t.form3,"price",a.target.value)}}}),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"price"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputProjectLeader"}},[t._v("Tags")]),t._v(" "),s("input",{directives:[{name:"model",rawName:"v-model",value:t.form3.tags,expression:"form3.tags"}],staticClass:"form-control",class:{"is-invalid":t.form3.errors.has("tags")},attrs:{type:"text",id:"inputProjectLeader",placeholder:"tags",name:"tags"},domProps:{value:t.form3.tags},on:{input:function(a){a.target.composing||t.$set(t.form3,"tags",a.target.value)}}}),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"tags"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputProjectLeader"}},[t._v("Category")]),t._v(" "),s("select",{directives:[{name:"model",rawName:"v-model",value:t.form3.cat_id,expression:"form3.cat_id"}],staticClass:"custom-select form-control",class:{"is-invalid":t.form3.errors.has("cat_id")},attrs:{name:"cat_id",placeholder:"Select one"},on:{change:[function(a){var s=Array.prototype.filter.call(a.target.options,(function(t){return t.selected})).map((function(t){return"_value"in t?t._value:t.value}));t.$set(t.form3,"cat_id",a.target.multiple?s:s[0])},t.changeSub]}},[s("option",{attrs:{selected:"",disabled:""}},[t._v("Select one")]),t._v(" "),t._l(t.categories.data,(function(a){return s("option",{key:a.id,domProps:{value:a.id}},[t._v("\n                          "+t._s(a.name)+"\n                          ")])}))],2),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"cat_id"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputProjectLeader"}},[t._v("Sub Category")]),t._v(" "),s("select",{directives:[{name:"model",rawName:"v-model",value:t.form3.sub_id,expression:"form3.sub_id"}],staticClass:"custom-select form-control",class:{"is-invalid":t.form3.errors.has("sub_id")},attrs:{name:"sub_id",placeholder:"Select one"},on:{change:function(a){var s=Array.prototype.filter.call(a.target.options,(function(t){return t.selected})).map((function(t){return"_value"in t?t._value:t.value}));t.$set(t.form3,"sub_id",a.target.multiple?s:s[0])}}},[s("option",{attrs:{selected:"",disabled:""}},[t._v("Select one")]),t._v(" "),t._l(t.subcats.data,(function(a){return s("option",{key:a.id,domProps:{value:a.id}},[t._v("\n                          "+t._s(a.name)+"\n                          ")])}))],2),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"sub_id"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputProjectLeader"}},[t._v("Location")]),t._v(" "),s("select",{directives:[{name:"model",rawName:"v-model",value:t.form3.location,expression:"form3.location"}],staticClass:"custom-select form-control",class:{"is-invalid":t.form3.errors.has("location")},attrs:{name:"location",placeholder:"Select one"},on:{change:function(a){var s=Array.prototype.filter.call(a.target.options,(function(t){return t.selected})).map((function(t){return"_value"in t?t._value:t.value}));t.$set(t.form3,"location",a.target.multiple?s:s[0])}}},[s("option",{attrs:{selected:"",disabled:""}},[t._v("Select one")]),t._v(" "),t._l(t.locations.data,(function(a){return s("option",{key:a.id,domProps:{value:a.name}},[t._v("\n                          "+t._s(a.name)+"\n                          ")])}))],2),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"location"}})],1),t._v(" "),s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"inputClientCompany"}},[t._v("Main Image Product")]),t._v(" "),s("input",{staticClass:" form-control",class:{"is-invalid":t.form3.errors.has("image")},attrs:{type:"file",id:"inputClientCompany",name:"image"},on:{change:t.uploadImage}}),t._v(" "),s("has-error",{attrs:{form:t.form3,field:"image"}})],1),t._v(" "),t._m(2)])])])])]),t._v(" "),s("div",{staticClass:"modal price-quote",attrs:{id:"images"}},[s("div",{staticClass:"modal-dialog"},[s("div",{staticClass:"modal-content"},[t._m(3),t._v(" "),s("div",{staticClass:"modal-body"},[s("form",{attrs:{enctype:"multipart/form-data"},on:{submit:function(a){return a.preventDefault(),t.uploadFile()}}},[s("div",{staticClass:"form-group"},[s("label",[t._v("Upload Files")]),t._v(" "),s("input",{staticClass:"form-control",attrs:{id:"upload-file",required:"required",type:"file",multiple:""},on:{change:t.fieldChange}}),t._v(" "),s("input",{attrs:{type:"hidden",id:"proid"}})]),t._v(" "),t._m(4)]),t._v(" "),s("table",{staticClass:"table"},[t._m(5),t._v(" "),s("tbody",t._l(t.medias.data,(function(a){return s("tr",{key:a.id},[s("td",[s("img",{staticClass:"img-size-64",attrs:{src:"/uploads/product/"+a.image,alt:"Product Image"}})]),t._v(" "),s("td",{staticClass:"text-right py-0 align-middle"},[s("div",{staticClass:"btn-group btn-group-sm"},[s("a",{staticClass:"btn btn-info",attrs:{href:"/uploads/product/"+a.image,target:"_blank"}},[s("i",{staticClass:"fa fa-eye"})]),t._v(" "),s("a",{staticClass:"btn btn-danger",on:{click:function(s){return t.deleteImage(a.id)}}},[s("i",{staticClass:"fa fa-trash"})])])])])})),0)])])])])])]):t._e(),t._v(" "),t.$gate.isAuth()?t._e():s("div",[s("not-found")],1)])}),[function(){var t=this.$createElement,a=this._self._c||t;return a("button",{staticClass:"close close-btn popup-cls",attrs:{"aria-label":"Close","data-dismiss":"modal",type:"button"}},[a("i",{staticClass:"fa-times fa"})])},function(){var t=this.$createElement,a=this._self._c||t;return a("div",{staticClass:"modal-header"},[a("button",{staticClass:"close",attrs:{type:"button","data-dismiss":"modal"}},[a("span",{attrs:{"aria-hidden":"true"}},[this._v("×")]),a("span",{staticClass:"sr-only"},[this._v("Close")])]),this._v(" "),a("h3",{staticClass:"modal-title",attrs:{id:"lineModalLabel"}},[this._v("Edit Announce")])])},function(){var t=this.$createElement,a=this._self._c||t;return a("div",{staticClass:"form-group"},[a("button",{staticClass:"btn btn-dark",attrs:{type:"submit"}},[a("i",{staticClass:"fa fa-plus"}),this._v("Update")])])},function(){var t=this.$createElement,a=this._self._c||t;return a("div",{staticClass:"modal-header"},[a("button",{staticClass:"close",attrs:{type:"button","data-dismiss":"modal"}},[a("span",{attrs:{"aria-hidden":"true"}},[this._v("×")]),a("span",{staticClass:"sr-only"},[this._v("Close")])]),this._v(" "),a("h3",{staticClass:"modal-title",attrs:{id:"lineModalLabel"}},[this._v("Images of Your Announce")])])},function(){var t=this.$createElement,a=this._self._c||t;return a("div",{staticClass:"form-group"},[a("button",{staticClass:"btn btn-dark",attrs:{type:"submit"}},[a("i",{staticClass:"fa fa-plus"}),this._v(" upload")])])},function(){var t=this.$createElement,a=this._self._c||t;return a("thead",{staticClass:"bg-dark"},[a("tr",[a("th",[this._v("Image")]),this._v(" "),a("th",[this._v("Actions")])])])}],!1,null,null,null);a.default=r.exports}}]);
//# sourceMappingURL=8.js.map