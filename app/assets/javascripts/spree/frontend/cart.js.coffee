Spree.ready ($) ->
  if ($ 'form#update-cart').is('*')
    ($ 'form#update-cart a.delete').show().one 'click', ->
      ($ this).parents('.line-item').first().find('input.line_item_quantity').val 0
      ($ this).parents('form').first().submit()
      false

  ($ 'form#update-cart').submit ->
    ($ 'form#update-cart #update-button').attr('disabled', true)

  $(document).on 'click', '#clear_cart_link', (e) ->
    $form = ($ 'form#update-cart')
    $form.attr('action', $form.find('input[data-name="clear_cart_btn"]').data('url'))
    $form.find('input[name="_method"]').val('put')
    $form.find('input[data-name="clear_cart_btn"]')

  $('.js--cart-adjust').each (e, item) ->
    $this = $(item)
    if $this.data('action') != 'initialized'
      $this.data 'action', 'initialized'
      minus = $('.apQtyAdjustMinus', $this)
      plus = $('.apQtyAdjustPlus', $this)
      field = $('.add-to-cart-detail-number', $this)
      plus.on 'click', ->
        field[0].value = parseInt(field[0].value) + 1
      minus.on 'click', ->
        if parseInt(field[0].value) > 1
          field[0].value = parseInt(field[0].value) - 1

Spree.fetch_cart = ->
  $.ajax
    url: Spree.pathFor("cart_link"),
    success: (data) ->
      $('#link-to-cart').html data
