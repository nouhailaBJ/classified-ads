(window.webpackJsonp=window.webpackJsonp||[]).push([[19],{250:function(t,s,a){"use strict";a.r(s);var e={data:function(){return{settings:[],type:"",form:new Form({id:"",value:""})}},methods:{editModal:function(t){this.form.reset(),this.type=t.type?1:0,$("#addNew").modal("show"),this.form.fill(t)},updateSetting:function(){var t=this;this.$Progress.start(),this.form.put("/api/setting/"+this.form.id).then((function(){$("#addNew").modal("hide"),Swal.fire("Updated!","Your information has been updated.","success"),t.$Progress.finish(),Fire.$emit("AfterCreate")})).catch((function(){t.$Progress.fail()}))},loadSettings:function(){var t=this;axios.get("/api/setting").then((function(s){var a=s.data;return t.settings=a}))}},created:function(){var t=this;this.loadSettings(),Fire.$on("AfterCreate",(function(){t.loadSettings()}))}},i=a(2),r=Object(i.a)(e,(function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("div",{staticClass:"content-wrapper"},[t._m(0),t._v(" "),a("div",{staticClass:"content"},[a("div",{staticClass:"container-fluid"},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-12"},[a("div",{staticClass:"card"},[t._m(1),t._v(" "),a("div",{staticClass:"card-body"},[a("table",{staticClass:"table table-bordered table-striped",attrs:{id:"example1"}},[t._m(2),t._v(" "),a("tbody",t._l(t.settings.data,(function(s){return a("tr",{key:s.id},[a("td",[t._v(t._s(s.slug))]),t._v(" "),a("td",[t._v(t._s(s.value))]),t._v(" "),a("td",[a("a",{staticClass:"btn btn-info white-text bg-info btn-sm",on:{click:function(a){return t.editModal(s)}}},[a("i",{staticClass:"fas fa-edit"})])])])})),0)])])])])])])]),t._v(" "),a("div",{staticClass:"modal fade",attrs:{id:"addNew"}},[a("div",{staticClass:"modal-dialog  modal-lg"},[a("div",{staticClass:"modal-content"},[t._m(3),t._v(" "),a("form",{on:{submit:function(s){return s.preventDefault(),t.updateSetting()}}},[a("div",{staticClass:"modal-body"},[a("div",{staticClass:"form-group"},[a("label",[t._v("Title")]),t._v(" "),t.type?t._e():a("input",{directives:[{name:"model",rawName:"v-model",value:t.form.value,expression:"form.value"}],staticClass:"form-control",class:{"is-invalid":t.form.errors.has("title")},attrs:{type:"text",name:"value"},domProps:{value:t.form.value},on:{input:function(s){s.target.composing||t.$set(t.form,"value",s.target.value)}}}),t._v(" "),t.type?a("textarea",{directives:[{name:"model",rawName:"v-model",value:t.form.value,expression:"form.value"}],staticClass:"textarea",staticStyle:{width:"100%",height:"200px","font-size":"14px","line-height":"18px",border:"1px solid #dddddd",padding:"10px"},attrs:{name:"value",required:"required",placeholder:"Place some text here"},domProps:{value:t.form.value},on:{input:function(s){s.target.composing||t.$set(t.form,"value",s.target.value)}}}):t._e(),t._v(" "),a("has-error",{attrs:{form:t.form,field:"title"}})],1)]),t._v(" "),t._m(4)])])])])])}),[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"content-header"},[s("div",{staticClass:"container-fluid"},[s("div",{staticClass:"row mb-2"},[s("div",{staticClass:"col-sm-6"},[s("h1",{staticClass:"m-0 text-dark"},[s("i",{staticClass:"fa fa-cogs",attrs:{"aria-hidden":"true"}}),this._v("Setting")])])])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"card-header"},[s("h3",{staticClass:"card-title"},[this._v("Settings Table")]),this._v(" "),s("div",{staticClass:"card-tools"},[s("button",{staticClass:"btn btn-dark",attrs:{type:"button","data-card-widget":"collapse"}},[s("i",{staticClass:"fas fa-minus"})])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("thead",{staticClass:"bg-dark"},[s("tr",[s("th",[this._v("Slug")]),this._v(" "),s("th",[this._v("Value")]),this._v(" "),s("th",[this._v("Edit")])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"modal-header"},[s("h4",{staticClass:"modal-title"},[s("i",{staticClass:"fas fa-plus"}),this._v(" Update setting")]),this._v(" "),s("button",{staticClass:"close",attrs:{type:"button","data-dismiss":"modal","aria-label":"Close"}},[s("span",{attrs:{"aria-hidden":"true"}},[this._v("×")])])])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"modal-footer justify-content-between"},[s("button",{staticClass:"btn  btn-danger",attrs:{type:"button","data-dismiss":"modal"}},[this._v("Close")]),this._v(" "),s("button",{staticClass:"btn btn-success",attrs:{type:"submit"}},[this._v("Update")])])}],!1,null,null,null);s.default=r.exports}}]);
//# sourceMappingURL=19.js.map