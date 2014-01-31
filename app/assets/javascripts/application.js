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
//= require fancybox.js
//= require mousewheel.js
//= require fancybox-media.js
//= require fancybox-pack.js
//= require moment.js
//= require angular
//= require angular-resource
//= require angularjs/rails/resource
//= require angular-ui
//- require angular-bootstrap
//- require angular-ui-bootstrap-tpls
//= require angular-slider.js
//= require angular-cookies.js
//= require angularLocalStorage.js
//= require jquery.cookie
//= require_tree .

// filepicker

function remove_fields (link) {
	$(link).prev("input[type=hidden]").value = "1";
	$(link).parent(".fields").hide();
}

function add_fields (link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).before(content.replace(regexp, new_id));
}

$("#sign_up_business").on("show", function () {
  $("body").addClass("modal-open");
}).on("hidden", function () {
  $("body").removeClass("modal-open")
});

$("#sign_up_foodie").on("show", function () {
  $("body").addClass("modal-open");
}).on("hidden", function () {
  $("body").removeClass("modal-open")
});

$("#sign_in").on("show", function () {
  $("body").addClass("modal-open");
}).on("hidden", function () {
  $("body").removeClass("modal-open")
});

$("input").attr("autocomplete", "off");
$("select").attr("autocomplete", "off");

$("a.facebook.circle.no-border.no-shadow").on("click", function(){
  window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href), 'facebook-share-dialog', 'width=626,height=436'); 
  return false;
})

$("a.facebook.facebook-share").on("click", function(){
  window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href), 'facebook-share-dialog', 'width=626,height=436'); 
  return false;
})

$(".fancybox").fancybox({
  openEffect  : 'fade',
  closeEffect : 'fade',
  nextEffect : 'fade',
  prevEffect : 'fade',
  iframe : {
        preload: false
    },
  helpers : {
    title : {
      type: 'inside'
    }
  /*},
  beforeShow: function () {
    if (this.title) {
        this.title += '<br />';
        this.title += '<a href="https://twitter.com/share" id="twitter-share-button" data-via="simmrco" data-count="none">Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?"http":"https";if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document, "script", "twitter-wjs");</script>';
        this.title += '<iframe src="//www.facebook.com/plugins/like.php?href=' + document.URL + '&amp;layout=button_count&amp;show_faces=true&amp;width=500&amp;action=like&amp;font&amp;colorscheme=light&amp;height=23" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:110px; height:23px;" allowTransparency="true"></iframe>';
    }
  },
  afterShow: function() {
    twttr.widgets.load();*/
  }
});

$(document).ready(function() {
    $('.fancybox.gallery').fancybox({
        openEffect  : 'fade',
        closeEffect : 'fade',
        nextEffect : 'fade',
        prevEffect : 'fade',
        type: "image",
        autoplay: false,
        preload : 5,
        iframe : {
              preload: false
          },
        helpers : {
          title : {
            type: 'inside'
          }
        /*},
        beforeShow: function () {
          if (this.title) {
              this.title += '<br />';
              this.title += '<a href="https://twitter.com/share" class="twitter-share-button" data-via="simmrco" data-count="none">Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?"http":"https";if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document, "script", "twitter-wjs");</script>';
              this.title += '<iframe src="//www.facebook.com/plugins/like.php?href=' + document.URL + ';width=110&amp;layout=standard&amp;action=like&amp;show_faces=true&amp;share=true&amp;height=80&amp;appId=279105668896629" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:110px; height:80px;" allowTransparency="true"></iframe>';
          }
        },
        afterShow: function() {
          twttr.widgets.load();*/
        }
    })
}); // ready

// bootstrap tooltips 

$('.city').tooltip();

$('.campaign').tooltip();

$('.why-zip').tooltip();

$('#yelp-explanation').tooltip();

$('.quoter').tooltip();

$('.recipe').tooltip();

$('.follow-expired-campaign').tooltip();

$('.follow').tooltip();
