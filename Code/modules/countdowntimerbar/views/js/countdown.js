/*
* 2007-2023 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2023 PrestaShop SA
*  @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
* @since 1.6
*/
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

$(document).ready(function () {
	setInterval(countdown , 1000);
	if(getCookie("cookie_js")==""){
		var cvalue = 0;
		var exdays = 24*60*60;
		setCookie("cookie_js", cvalue, exdays);	
	}
	$('#icon1').click(function(){
		var cvalue = parseInt(getCookie("cookie_js"))+1;
		setCookie("cookie_js", cvalue, 24*60*60);
	});
	
	if(active == 1){
		if(getCookie("cookie_js")%2 == 1){
			$('.divtong').css({"display":"none"});
			$('#icon1').addClass('down');
		}else{
			$('.divtong').css({"display":"block"});
			$('#icon1').addClass('up');
		}
	}else{
		if(getCookie("cookie_js")%2 == 1){
			$('.divtong').css({"display":"none"});
			$('#icon1').addClass('up');
		}else{
			$('.divtong').css({"display":"block"});
			$('#icon1').addClass('down');
		}
	}
	
		
	 $("#icon1").click(function(){
        $(".divtong").toggle();
    });
	$('#icon1').click(function(){
		$('#icon1').toggleClass(function(){
			if($('#icon1').hasClass("down") == true){
				$('#icon1').removeClass("down");
				return "up";
			}else{
				$('#icon1').removeClass("up");
				return "down";
			}
		});
	});
});
function parseISOLocal(s) {
  var b = s.split(/\D/);
  return new Date(b[0], b[1]-1, b[2], b[3], b[4], b[5]);
}

 function countdown(){
	 
	var now = new Date();
	var endDate = new Date(parseISOLocal(timer));
	// console.log(endDate);
	
	var current = now.getTime();
	var endtime = endDate.getTime();
	
	var displaytime = endtime - current;
	
	var s = Math.floor(displaytime / 1000);
	var m = Math.floor(s/60);
	var h = Math.floor(m/60);
	var d = Math.floor(h/24);
	h %= 24;
	m %= 60;
	s %= 60;
	
	h = (h<10&&h>0) ? "0" + h : h;
	d = (d<10&&h>0) ? "0" + d : d;
	m = (m<10&&h>0) ? "0" + m : m;
	s = (s<10&&h>0) ? "0" + s : s;

	if(SaveDay == ""){
		document.getElementById("days").innerHTML = 00;
		document.getElementById("hours").innerHTML = 00;
		document.getElementById("minute").innerHTML = 00;
		document.getElementById("second").innerHTML = 00;
	}else{
		document.getElementById("days").innerHTML = d;
		document.getElementById("hours").innerHTML = h;
		document.getElementById("minute").innerHTML = m;
		document.getElementById("second").innerHTML = s;
	}
	
 }