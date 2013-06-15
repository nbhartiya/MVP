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


(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-41755174-1', 'simmr.co');
ga('send', 'pageview');
