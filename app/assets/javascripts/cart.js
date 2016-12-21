//(function($){
//    $(function(){
//        $('.js--cart-adjust').each(function(e, item){
//            $this = $(item);
//            if($this.data('action') != 'initialized') {
//                $this.data('action', 'initialized');
//                var minus = $('.apQtyAdjustMinus', $this);
//                var plus = $('.apQtyAdjustPlus', $this);
//                var field = $('.add-to-cart-detail-number', $this);
//                plus.on('click', function(){
//                    field[0].value = parseInt(field[0].value) + 1;
//                });
//                minus.on('click', function(){
//                    if(parseInt(field[0].value) > 1) {
//                        field[0].value = parseInt(field[0].value) - 1;
//                    }
//                });
//            }
//        });
//    });
//})(jQuery);