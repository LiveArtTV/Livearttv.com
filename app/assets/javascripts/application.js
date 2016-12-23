// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require spree/frontend
//= require bootstrap3-typeahead.min
//= require countdown.min
//= require jquery.elevatezoom.min
//= require jquery.history
//= require jquery.nivo.slider.pack
//= require jquery.serial.scroll.min
//= require owl.carousel.min
//= require wow.min
//= require_tree .
//= require store/spree_videos
//= require fancybox
//= require matchHeight/jquery.matchHeight-min.js
//= require jquery.mmenu.all

$(window).bind('page:change', function() {
    $.fancybox.init();
});

$(document).ready(function(){
    $(".fancybox").fancybox({
        parent      : 'body',
        openEffect	: 'elastic',
        closeEffect	: 'elastic',
        closeBtn    : true,
        closeClick  : true,
        afterClose: function() {
            $("a.fancy-no-hide").show();
        }
//        title       : false,
//        helpers : {
//            title : {
//                type : 'over'
//            }
//        }
    });

    $('a.fancyYoutube').on('click', function(event) {
        event.preventDefault();
        $.fancybox({
            parent         : 'body',
            type           : 'iframe',
            // hide the related video suggestions and autoplay the video
            href           : this.href.replace(new RegExp('watch\\?v=', 'i'), 'embed/') + '?rel=0&autoplay=1',
            padding        : 0,
            overlayShow    : true,
            centerOnScroll : true,
            speedIn        : 100,
            speedOut       : 50,
            title          : this.title,
            //width          : 640,
            height         : 480,
            onComplete : function () {
                $("#fancybox-frame").attr("allowfullscreen", "allowfullscreen")
            }
        });
    });

    $('#apollo_menucanvas').mmenu({
        extensions: [ 'effect-slide', 'pageshadow' ],
        header: true,
        searchfield: true
    });
});
