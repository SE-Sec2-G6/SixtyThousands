{*
* 2007-2023 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@buy-addons.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    Buy-addons    <contact@buy-addons.com>
* @copyright 2007-2023 Buy-addons
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="All"{if $timecountdown == true}style="display:none"{/if}  {if $Settingcd['active'] == 1} style="position: fixed;top:0;left:0"{/if}{if $Settingcd['active'] == 0}style="position: fixed;bottom:0;left: 0;"{/if}>

	 <div class="divtong" style="background-color:#{$Settingcd['colorBackGround']|escape:'htmlall':'UTF-8'}">
	    
		<div class="khung" >
			<div class="txtContent" style="color:#{$Settingcd['colormess']|escape:'htmlall':'UTF-8'}">
				{foreach from=$arr_language key=k item=i}
					{if $arr_language[$k]['id_lang'] == $getidLang['id_lang']}
						{$textArea[$k] nofilter} {*no escape necessary*} 
					{/if}
				{/foreach}
			</div>
			<a href="{$txtURL[$getidLang['id_lang']]|escape:'htmlall':'UTF-8'}" target="_blank">
				<div class="btnclick" style="color:#{$Settingcd['colorClick']|escape:'htmlall':'UTF-8'}">
					{foreach from=$arr_language key=k item=i}
						{if $arr_language[$k]['id_lang'] == $getidLang['id_lang']}
							{$txtStart[$k]|escape:'htmlall':'UTF-8'}
						{/if}
					{/foreach}
				</div>
			</a>
			<div class="div_time">
				<div class="share">
					<div style="display:flex;text-align:center;width:100%;">
						<div id="days" class="number">
						
						</div>
					</div>
					
					<div style="display:flex;text-align:center;width:100%;">
						<div class="font">
						{foreach from=$arr_language key=k item=i}
							{if $arr_language[$k]['id_lang'] == $getidLang['id_lang']}
								{$days[$k]|escape:'htmlall':'UTF-8'}
							{/if}
						{/foreach}
						</div>
					</div>
				</div>
				<div class="share cotdoc" >
					<div style="display:flex;text-align:center;width:100%;">
						<div id="hours" class="number">
							
						</div>
					</div>
					<div style="text-align:center;display:flex;width:100%;">
						<div class="font">
						  {foreach from=$arr_language key=k item=i}
							{if $arr_language[$k]['id_lang'] == $getidLang['id_lang']}
								{$hrs[$k]|escape:'htmlall':'UTF-8'}
							{/if}
						{/foreach}
						</div>
					</div>
				</div>
				<div class="share cotdoc">
					<div style="display:flex;text-align:center;width:100%;">
						<div id="minute" class="number">
							
						</div>
					</div>
					<div style="text-align:center;display:flex;width:100%;">
						<div class="font">
						{foreach from=$arr_language key=k item=i}
							{if $arr_language[$k]['id_lang'] == $getidLang['id_lang']}
								{$min[$k]|escape:'htmlall':'UTF-8'}
							{/if}
						{/foreach}
						</div>
					</div>
				</div>
				<div class="share cotdoc">
					<div style="display:flex;text-align:center;width:100%;">
						<div id="second" class="number">
						</div>
					</div>
					<div style="text-align:center;display:flex;width:100%;">
						<div class="font">
						{foreach from=$arr_language key=k item=i}
							{if $arr_language[$k]['id_lang'] == $getidLang['id_lang']}
								{$second[$k]|escape:'htmlall':'UTF-8'}
							{/if}
						{/foreach}
						</div>
					</div>
				</div>
			</div>
			
			
			
	</div>	
		
</div>
	<div id="icon1"{if $Settingcd['active'] == 0} style="margin: 0px 20px 0px 0;background-color:#{$Settingcd['colorBackGround']|escape:'htmlall':'UTF-8'};position: absolute;bottom: 30%;right: 0%;"{else}style="background-color:#{$Settingcd['colorBackGround']|escape:'htmlall':'UTF-8'};position: absolute;right: 0;"{/if}>
	</div>
</div>
