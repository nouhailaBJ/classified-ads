(window.webpackJsonp=window.webpackJsonp||[]).push([[23],{257:function(t,s,a){"use strict";a.r(s);var i={data:function(){return{blogs:{}}},methods:{getResults:function(){var t=this,s=arguments.length>0&&void 0!==arguments[0]?arguments[0]:1;axios.get("/api/blog?page="+s).then((function(s){t.blogs=s.data}))},loadBlogs:function(){var t=this;axios.get("/api/blog").then((function(s){var a=s.data;return t.blogs=a}))}},created:function(){this.loadBlogs()}},l=a(2),o=Object(l.a)(i,(function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("div",{staticClass:"main-content-area clearfix"},[a("div",{staticClass:"page-header-area-2 gray"},[a("div",{staticClass:"container"},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-lg-12 col-md-12 col-sm-12 col-xs-12"},[a("div",{staticClass:"small-breadcrumb"},[a("div",{staticClass:" breadcrumb-link"},[a("ul",[a("li",[a("router-link",{attrs:{to:"/"}},[t._v("Home Page")])],1),t._v(" "),t._m(0)])]),t._v(" "),t._m(1)])])])])]),t._v(" "),a("section",{staticClass:"section-padding no-top gray "},[a("div",{staticClass:"container"},[a("div",{staticClass:"row"},[a("div",{staticClass:"col-md-12 col-xs-12 col-sm-12"},[a("div",{staticClass:"row"},[a("div",{staticClass:"posts-masonry"},t._l(t.blogs.data,(function(s){return a("div",{key:s.id,staticClass:"col-md-4 col-sm-6 col-xs-12"},[a("div",{staticClass:"blog-post height-blog"},[a("div",{staticClass:"post-img"},[a("router-link",{attrs:{to:"/blog/"+s.id}},[a("img",{staticClass:"img-responsive",attrs:{alt:"",src:"/uploads/blogs/"+s.image}})])],1),t._v(" "),a("div",{staticClass:"post-info"},[a("a",{attrs:{href:""}},[t._v(t._s(t._f("myDate")(s.created_at)))])]),t._v(" "),a("h3",{staticClass:"post-title"},[a("router-link",{attrs:{to:"/blog/"+s.id}},[t._v("  "+t._s(s.title)+" ")])],1),t._v(" "),a("p",{staticClass:"post-excerpt"},[t._v(t._s(t._f("striphtml")(t._f("truncate")(s.description,100)))+"   "),a("router-link",{attrs:{to:"/blog/"+s.id}},[a("strong",[t._v("Read More")])])],1)])])})),0),t._v(" "),a("div",{staticClass:"col-md-12 col-xs-12 col-sm-12"},[a("pagination",{attrs:{data:t.blogs},on:{"pagination-change-page":t.getResults}})],1)])])])])])])}),[function(){var t=this.$createElement,s=this._self._c||t;return s("li",[s("a",{staticClass:"active",attrs:{href:"#"}},[this._v("Blogs")])])},function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"header-page"},[s("h1",[this._v("Latest Blogs")])])}],!1,null,null,null);s.default=o.exports}}]);
//# sourceMappingURL=23.js.map