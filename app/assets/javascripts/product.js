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