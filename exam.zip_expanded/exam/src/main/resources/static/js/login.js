$(document).ready(function(){
	var userID = getCookie("userID");
	$("#email").val(userID);
	
	if($("#idCheck").val() != "") {
		$("#idCheck").attr("checked", true);
	}
	
	$("#idCheck").change(function() {
		if($("#idCheck").is(":checked")) {
			var userID = $("#email").val();
            setCookie("userID", userID, 7);
        }else{ 
            deleteCookie("userID");
        }
	});
	
	$('#login_section i').on('click',function(){
        $('#passwd').toggleClass('active');
        if($('#passwd').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg");
            $('#passwd').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg");
            $('#passwd').attr('type','password');
        }
    });
	
	var height = $(window).height();
	if (height >= $(".container").height()+160) {
		$(".footer").css("top", $(window).height()-80);
	} else {
		$(".footer").css("bottom",'-240px');
	}
});
	
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}