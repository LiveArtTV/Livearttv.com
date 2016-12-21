//= require jquery
//= require jquery_ujs
//= require fancybox

$(document).ready(function(){
    $(".fancybox").fancybox({
        openEffect	: 'elastic',
        closeEffect	: 'elastic',
        closeBtn    : true,
        closeClick  : true,
        afterClose: function() {
            $("a.fancy-no-hide").show();
        }
    });
    $('a.fancyYoutube').on('click', function(event) {
        event.preventDefault();
        $.fancybox({
            'type'           : 'firame',
            // hide the related video suggestions and autoplay the video
            'href'           : this.href.replace(new RegExp('watch\\?v=', 'i'), 'embed/') + '?rel=0&autoplay=1',
            'padding'        : 0,
            'overlayShow'    : true,
            'centerOnScroll' : true,
            'speedIn'        : 100,
            'speedOut'       : 50,
            'title'          : this.title,
//            'width'          : 640,
            'height'         : 480,
            onComplete : function () {
                $("#fancybox-frame").attr("allowfullscreen", "allowfullscreen")
            }
        });
    });
});
