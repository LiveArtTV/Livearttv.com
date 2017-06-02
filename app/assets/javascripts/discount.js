$(function () {
	var price = parseFloat($('#product_price_before_discount').data('value'));

	var moneyInput = $('#product_discount')
	var percentInput = $('#discount')
	var money = parseFloat(moneyInput.data('value'));

	percentInput.val(Math.round(money / price * 10000) / 100)
	moneyInput.on('keyup', function (e) {
		var money = +moneyInput.val()
		var percent = +moneyInput.val()

		if (money > price) {
			moneyInput.val(price) 
			money = price
		}
		if (money < 0) {
			moneyInput.val(0)
			money = 0
		}

		percentInput.val(Math.round(money / price * 10000) / 100)
	})

	percentInput.on('keyup', function (e) {
		var percent = +percentInput.val()

		if (percent > 100) {
			percentInput.val(100) 
			percent = 100
		}
		if (percent < 0) {
			percentInput.val(0) 
			percent = 0
		}
		moneyInput.val(percent / 100 * price)
	})
})
	