# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$('select#product_name').change ->
		$.ajax
			url: "/products"
			data: {id: $(this).val(), fetch: "true"}
			type: "get"
			dataType: "json"
			success: (data) ->
				colors = []
				i = 0
				while i < data.length
					$('select#product_color').children().remove()
					$('select#product_color').append('<option value="'+data[i].color+'">'+data[i].color+'</option>
') unless data[i].color in colors
					i++
				sizes = []
				i = 0
				while i < data.length
					$('select#product_size').children().remove()
					$('select#product_size').append('<option value="'+data[i].size+'">'+data[i].size+'</option>
') unless data[i].size in sizes
					i++

