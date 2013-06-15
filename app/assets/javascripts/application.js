// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require parsley.js
//= require angular
//= require angular-resource
//= require angularjs/rails/resource
//= require angular-ui
//= require angular-bootstrap
//= require angular-ui-bootstrap-tpls
//= require_tree .


function remove_fields (link) {
	$(link).prev("input[type=hidden]").value = "1";
	$(link).parent(".fields").hide();
}

function add_fields (link, association, content) {
	alert("you just ran the javascript function called add_fields");
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).before(content.replace(regexp, new_id));
}

$(document).ready(function(){
	$('.city').tooltip();
});

var analytics=analytics||[];(function(){var e=["identify","track","trackLink","trackForm","trackClick","trackSubmit","page","pageview","ab","alias","ready","group"],t=function(e){return function(){analytics.push([e].concat(Array.prototype.slice.call(arguments,0)))}};for(var n=0;n<e.length;n++)analytics[e[n]]=t(e[n])})(),analytics.load=function(e){var t=document.createElement("script");t.type="text/javascript",t.async=!0,t.src=("https:"===document.location.protocol?"https://":"http://")+"d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/"+e+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(t,n)};
analytics.load("z5mkxezlb4");
