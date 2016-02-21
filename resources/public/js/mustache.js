$(function() {
		$.getJSON('data.json', function(data) {
		    var template = $('#projects-template').html();
		    var info = Mustache.to_html(template, data);
		    $('#forum').html(info);
		});
	});
	