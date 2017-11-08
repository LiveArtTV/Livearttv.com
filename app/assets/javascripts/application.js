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
//= require jquery.slick.min
//= require owl.carousel.min
//= require wow.min
//= require store/spree_videos
//= require fancybox
//= require matchHeight/jquery.matchHeight-min.js
//= require jquery.mmenu.all
//= require master
//= require contact_us
//= require product
//= require masonry/jquery.masonry
//= require masonry/box-maker
//= require masonry/jquery.loremimages.min
//= require masonry/jquery.imagesloaded.min


$(window).bind('page:change', function() {
    $.fancybox.init();
});

$(document).ready(function(){
  var isNotMobile = !(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
  if(isNotMobile) {
    var $container = $('#list-artist-5-col');
    $container.imagesLoaded( function() {
        $container.masonry({
            itemSelector: '.product-list-item',
            columnWidth: function( containerWidth ) {
              return (containerWidth / 5);
            }
        });
        $container.addClass('loaded');
    });
  } else {
     if (document.getElementById('list-artist-5-col')) {
      document.getElementById('list-artist-5-col').style.opacity = '1';
      var change = document.getElementsByClassName('product-list-item')
      for (var i = 0; i < change.length; i++) {
        change[i].style.width = '100%';
      }
    }
  }

  if(isNotMobile) {
    var $container1 = $('#products');
    $container1.imagesLoaded( function() {
        $container1.masonry({
            itemSelector: '.product-list-item',
            columnWidth: function( containerWidth ) {
              return (containerWidth / 3);
            }
        });
        $container1.addClass('loaded');
    });
  } else {
    if (document.getElementById('products')) {
      document.getElementById('products').style.opacity = '1';
      var change1 = document.getElementsByClassName('product-list-item')
      for (var i = 0; i < change1.length; i++) {
        change1[i].style.width = '100%';
      }
    }
  }

  if(isNotMobile) {
    var $container2 = $('#taxons');
    $container2.imagesLoaded( function() {
        $container2.masonry({
            itemSelector: '.product-container',
            columnWidth: function( containerWidth ) {
              return (containerWidth / 3);
            }
        });
        $container2.addClass('loaded');
    });
  } else {
    if (document.getElementById('taxons')) {
      document.getElementById('taxons').style.opacity = '1';
      var change2 = document.getElementsByClassName('product-container')
      for (var i = 0; i < change2.length; i++) {
        change2[i].style.width = '100%';
      }
    }
  }

    var $container3 = $('#dropdown-artist');
      $container3.masonry({
          itemSelector: '.col-masonry',
          columnWidth: function( containerWidth ) {
            return (containerWidth / 4);
          }
      });


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

    $('.responsive-slick').slick({
        lazyLoad: 'ondemand',
        dots: false,
        infinite: false,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 4,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    });
    $('.slick-prev-btn').click(function() {
        $('.slick-container').slick('slickPrev');
    });
    $('.slick-next-btn').click(function() {
        $('.slick-container').slick('slickNext');
    });
});


$(function() {
  $('.pop-up').hide();
  $('.pop-up').fadeIn(1000);

  $('.close-button').click(function (e) {
    $('.pop-up').fadeOut(700);
    $('.pop-up_overlay').css({display:'none'});
    e.stopPropagation();
  });
});


function minmax(value, min, max)
{
    if(parseInt(value) < min || isNaN(parseInt(value)))
        return 0;
    else if(parseInt(value) > max)
        return 1;
    else return value;
};
