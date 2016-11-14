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
});