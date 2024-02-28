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
$(document).ready(function () {
	$('#Save').click(function(){
		if($('#txtcontrol'+txtheader).val() == ""){
			$('#txtcontrol'+txtheader).css("border","1px solid red");
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			return false;
		}
		if(tinymce.get('BAEU_Message_'+txtheader).getContent() == ""){
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			$('.mce-edit-area').css("border","1px solid red");
			return false;
		}
		if($('#days'+txtheader).val() == ""){
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			$('#days'+txtheader).css("border","1px solid red");
			return false;
		}
		if($('#hrs'+txtheader).val() == ""){
			$('#hrs'+txtheader).css("border","1px solid red");
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			return false;
		}
		if($('#min'+txtheader).val() == ""){
			$('#min'+txtheader).css("border","1px solid red");
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			return false;
		}
		if($('#second'+txtheader).val() == ""){
			$('#second'+txtheader).css("border","1px solid red");
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			return false;
		}
		if($('#datepicker').val() == ""){
			$('#datepicker').css("border","1px solid red");
			$('.inform').append('<div class="module_error alert alert-danger"><button type="button" class="close" data-dismiss="alert">×</button>You enter the missing fields Time</div>');
			return false;
		}
		
		
		
	});
});
