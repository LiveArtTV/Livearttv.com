$(function () {
  var priceBeforeDiscountInput = $('#product_price_before_discount');
  var priceBeforeDiscount = parseFloat(priceBeforeDiscountInput.data('value'));

  var discountInput = $('#product_discount')
  var percentInput = $('#discount')
  var discount = parseFloat(discountInput.data('value'));
  percentInput.val(Math.round(discount / priceBeforeDiscount * 10000) / 100)
  
  priceBeforeDiscountInput.on('keyup', function (e) {
    priceBeforeDiscount = parseFloat(priceBeforeDiscountInput.val());
    priceBeforeDiscountInput.data('value', priceBeforeDiscount)
    $('#product_price').val(priceBeforeDiscount - discount)
  })

  discountInput.on('keyup', function (e) {
    var priceBeforeDiscount = parseFloat(priceBeforeDiscountInput.data('value'));
    var discount = +discountInput.val()
    var percent = +discountInput.val()

    if (discount > priceBeforeDiscount) {
      discountInput.val(priceBeforeDiscount) 
      discount = priceBeforeDiscount
    }
    if (discount < 0) {
      discountInput.val(0)
      discount = 0
    }
    percentInput.val(Math.round(discount / priceBeforeDiscount * 10000) / 100)
    $('#product_price').val(priceBeforeDiscount - discount)

  })

  percentInput.on('keyup', function (e) {
    var priceBeforeDiscount = parseFloat(priceBeforeDiscountInput.data('value'));
    var percent = +percentInput.val()

    if (percent > 100) {
      percentInput.val(100) 
      percent = 100
    }
    if (percent < 0) {
      percentInput.val(0) 
      percent = 0
    }
    discountInput.val(percent / 100 * priceBeforeDiscount)
    $('#product_price').val(priceBeforeDiscount - discountInput.val())
  })
})
  