$(".btn_category").on("click", function () {
	$(".btn_category").removeClass("btn_category_click");
	$(".btn_anonymous").removeClass("btn_anonymous_click");
	$(this).addClass("btn_category_click");
});

$(".btn_anonymous").on("click", function () {
	$(".btn_category").removeClass("btn_category_click");
	$(this).addClass("btn_anonymous_click");
});
