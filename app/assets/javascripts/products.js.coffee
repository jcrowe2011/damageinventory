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
				$('select#product_color').empty()
				$('select#product_size').empty()
				console.log data[0]
				colors = []
				i = 0
				while i < data.length
					unless data[i].color in colors
						$('select#product_color').append('<option value="'+data[i].color+'">'+data[i].color+'</option>
') 
						colors.push data[i].color
					i++
				sizes = []
				i = 0
				while i < data.length
					unless data[i].size in sizes
						$('select#product_size').append('<option value="'+data[i].size+'">'+data[i].size+'</option>
')
						sizes.push data[i].size
					i++

