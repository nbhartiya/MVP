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
//= require_tree .
//= require twitter/bootstrap
//= require parsley.js

function remove_fields (link) {
	$(link).prev("input[type=hidden]").value = "1";
	$(link).parent(".fields").hide();
}

function add_fields (link, association, content) {
	alert("happy birthday");
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).parent().append(content.replace(regexp, new_id));
	//This is ugly, make sure you fix it later!
}