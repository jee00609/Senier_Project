    $(document).ready(function () {
		$('#apiBtn').on('click', function (e) {
			e.preventDefault();
			fetch('/printScore')
			.then((response) => console.log("response:", response))
  			.catch((error) => console.log("error:", error))
		})
	});