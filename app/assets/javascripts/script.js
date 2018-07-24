$(document).on('click', 'input[name=option]', function () {
	value = $('[name="option"]:checked').val();
	user_answer = $("#user_answer").val(value);
});
