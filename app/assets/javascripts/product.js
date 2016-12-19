var Product = {
    quickView : function(data) {
        $('#quick-view-product').show();
        $('#product-featured-image-quickview').attr('src',data.img_src);
//        $('.loading-imgquickview').show();
    return false;
    },
    quickViewHide : function() {
        $('#quick-view-product').hide();
        $('.fancybox-overlay').hide();
    }
}

$(document).ready(function(){
    $(document).on('click', '.quickview-close, #quick-view-product .quickview-overlay', function(e){
        $("#quick-view-product").fadeOut(500);
    });
    $(document).on('click', '.product-quick-view', function(e){
        var dataset = $(this)[0].dataset;
        Product.quickView({
            img_src : dataset.imgSrc
        });
    })
})

Spree.ready(function($) {
    Spree.addImageHandlersPath = function() {
        var thumbnails;
        thumbnails = $('#product-images ul.thumbnails');
        $('#main-image2').data('selectedThumb', $('#main-image2 img').attr('src'));
        thumbnails.find('li').eq(0).addClass('selected');
        thumbnails.find('a').on('click', function(event) {
            $('#main-image2').data('selectedThumb', $(event.currentTarget).attr('href'));
            $('#main-image2').data('selectedThumbId', ($(event.currentTarget)).parent().attr('id'));
            thumbnails.find('li').removeClass('selected');
            ($(event.currentTarget)).parent('li').addClass('selected');
            return false;
        });
        thumbnails.find('li').on('mouseenter', function(event) {
            $('#main-image2 img').attr('src', $(event.currentTarget).find('a').attr('href'));
            $('#main-image2 a').attr('href', $(event.currentTarget).find('a').data('img-src'));
        });
        thumbnails.find('li').on('mouseleave', function(event) {
//            $('#main-image2 img').attr('src', $('#main-image2').data('selectedThumb'));
        });
    };

    Spree.addImageHandlersPath();
});
