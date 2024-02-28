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
<div class="inform"></div>
<form class="defaultForm form-horizontal" method="post" enctype="multipart/form-data">
	{if $demoMode=="1"}
		<div class="bootstrap ba_error">
			<div class="module_error alert alert-danger">
				{l s='You are use ' mod='countdowntimerbar'}
				<strong>{l s='Demo Mode' mod='countdowntimerbar'}</strong>
				{l s=', so some buttons, functions will be disabled because of security. ' mod='countdowntimerbar'}<br />
				{l s='You can use them in Live mode after you puchase our module. ' mod='countdowntimerbar'}<br />
				{l s='Thanks !' mod='countdowntimerbar'}
			</div>
		</div>
	{/if}
    <script type="text/javascript">    
		var iso =  {$a nofilter};{*no escape necessary*}
		var pathCSS = {$b nofilter} ;{*no escape necessary*}
		var ad = {$c nofilter};{*no escape necessary*}
    </script>

    <script>
        $( function() {
        $( "#datepicker" ).datepicker();
        } );
    </script>
	
<div class="form-group" >
    <div class="panel col-lg-12" id="inform" style="z-index:1">
	<label class="control-label col-lg-3 required" for="name_1">
		<span class="label-tooltip" data-toggle="tooltip">
			{l s='Your message' mod='countdowntimerbar'}
		</span>
	</label>
        <div class="controls col-sm-7">
				{foreach from=$arr_language key=key_lang item=language}
				<div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
					<div class="col-lg-11">
						<textarea name="textarea_{$language.id_lang|escape:'htmlall':'UTF-8'}" id="BAEU_Message_{$language.id_lang|escape:'htmlall':'UTF-8'}" class="rte">{$textArea[$key_lang]|escape:'htmlall':'UTF-8'}</textarea>
					</div>
					<div class="col-lg-1">
						<button type="button" class="btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
							{$iso_default_language|escape:'htmlall':'UTF-8'}
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							{foreach $arr_language key=key_lang item=language}
								<li>
									<a  href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</div>
				{/foreach}
        </div>
        
        <div class="col-lg-12" style="margin-bottom:10px;margin-top:10px;">
		<label class="control-label col-lg-3" for="reference">
			<span class="label-tooltip" data-toggle="tooltip" >
                {l s='Color font your message' mod='countdowntimerbar'}
			</span>
		</label>
            
            <div class="col-lg-3">
                <input name="colormess" class="jscolor" type="text" value="{$ArrConfig['colormess']|escape:'htmlall':'UTF-8'}">
            </div>
        </div>
		
        <div class="col-lg-12" style="margin-bottom:10px;">
			<label class="control-label col-lg-3" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Background Color' mod='countdowntimerbar'}
				</span>
			</label>
            
            <div class="col-lg-3">
                <input name="colorBackGround" class="jscolor" type="text" value="{$ArrConfig['colorBackGround']|escape:'htmlall':'UTF-8'}">
            </div>
        </div>
		
        
        <div class="col-lg-12" style="margin-bottom:10px;">
			<label class="control-label col-lg-3" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Color Font click here' mod='countdowntimerbar'}
				</span>
			</label>

            <div class="col-lg-3">
                <input type="text" name="colorClick" class="jscolor" value="{$ArrConfig['colorClick']|escape:'htmlall':'UTF-8'}">
            </div>
        </div>
        
        <div class="col-lg-12" style="margin-bottom:10px;">
			<label class="control-label col-lg-3 required" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Text button' mod='countdowntimerbar'}
				</span>
			</label>
            
            {foreach from=$arr_language key=key_lang item=language}
                <div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
                    <div class="col-lg-3" class="inputheader">
                        <input value="{$txtStart[$key_lang]|escape:'htmlall':'UTF-8'}" id="txtcontrol{$language.id_lang|escape:'htmlall':'UTF-8'}" name="txtcontrol_{$language.id_lang|escape:'htmlall':'UTF-8'}" type="text"  type="text" id="tareaWelcome{$language.id_lang|escape:'htmlall':'UTF-8'}" class="form-control  updateCurrentText " name="tareaWelcome{$language.id_lang|escape:'htmlall':'UTF-8'}">
                    </div>
                    <div class="col-lg-2" class="divlang">
                        <button onclick="clickbtn2()" type="button" class="btnlangg btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default_language|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
                            {$iso_default_language|escape:'htmlall':'UTF-8'}
                            <span class="caret"></span>
                        </button>
                        <ul class="ullangg dropdown-menu ul3" >
                            {foreach $arr_language key =key_lang item=language}
                                <li>
                                    <a href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/foreach}
        </div>
        
        
        <div class="col-lg-12" style="margin-bottom:10px;">
            <label class="control-label col-lg-3 required" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Days' mod='countdowntimerbar'}
				</span>
			</label>
            
            {foreach from=$arr_language key=key_lang item=language}
                <div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
                    <div class="col-lg-3" class="inputheader">
                        <input value="{$days[$key_lang]|escape:'htmlall':'UTF-8'}" id="days{$language.id_lang|escape:'htmlall':'UTF-8'}" name="days{$language.id_lang|escape:'htmlall':'UTF-8'}" type="text"  class="form-control  updateCurrentText ">
                    </div>
                    <div class="col-lg-2" class="divlang">
                        <button onclick="clickbtn2()" type="button" class="btnlangg btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default_language|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
                            {$iso_default_language|escape:'htmlall':'UTF-8'}
                            <span class="caret"></span>
                        </button>
                        <ul class="ullangg dropdown-menu ul3" >
                            {foreach $arr_language key =key_lang item=language}
                                <li>
                                    <a href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/foreach}
        </div>
        
        
        <div class="col-lg-12" style="margin-bottom:10px;">
            <label class="control-label col-lg-3 required" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Hours' mod='countdowntimerbar'}
				</span>
			</label>
            
            {foreach from=$arr_language key=key_lang item=language}
                <div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
                    <div class="col-lg-3" class="inputheader">
                        <input value="{$hrs[$key_lang]|escape:'htmlall':'UTF-8'}" id="hrs{$language.id_lang|escape:'htmlall':'UTF-8'}" name="hrs{$language.id_lang|escape:'htmlall':'UTF-8'}" type="text"  class="form-control updateCurrentText ">
                    </div>
                    <div class="col-lg-2" class="divlang">
                        <button onclick="clickbtn2()" type="button" class="btnlangg btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default_language|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
                            {$iso_default_language|escape:'htmlall':'UTF-8'}
                            <span class="caret"></span>
                        </button>
                        <ul class="ullangg dropdown-menu ul3" >
                            {foreach $arr_language key =key_lang item=language}
                                <li>
                                    <a href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/foreach}
        </div>
        
        
        <div class="col-lg-12" style="margin-bottom:10px;">
            <label class="control-label col-lg-3 required" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Minutes' mod='countdowntimerbar'}
				</span>
			</label>
            
            {foreach from=$arr_language key=key_lang item=language}
                <div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
                    <div class="col-lg-3" class="inputheader">
                        <input value="{$min[$key_lang]|escape:'htmlall':'UTF-8'}" id="min{$language.id_lang|escape:'htmlall':'UTF-8'}" name="min{$language.id_lang|escape:'htmlall':'UTF-8'}" type="text"  class="form-control  updateCurrentText ">
                    </div>
                    <div class="col-lg-2" class="divlang">
                        <button onclick="clickbtn2()" type="button" class="btnlangg btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default_language|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
                            {$iso_default_language|escape:'htmlall':'UTF-8'}
                            <span class="caret"></span>
                        </button>
                        <ul class="ullangg dropdown-menu ul3" >
                            {foreach $arr_language key =key_lang item=language}
                                <li>
                                    <a href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/foreach}
        </div>
        
        
        <div class="col-lg-12" style="margin-bottom:10px;">
            <label class="control-label col-lg-3 required" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Second' mod='countdowntimerbar'}
				</span>
			</label>
            
            {foreach from=$arr_language key=key_lang item=language}
                <div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
                    <div class="col-lg-3" class="inputheader">
                        <input value="{$second[$key_lang]|escape:'htmlall':'UTF-8'}" id="second{$language.id_lang|escape:'htmlall':'UTF-8'}" name="second{$language.id_lang|escape:'htmlall':'UTF-8'}" type="text"  class="form-control  updateCurrentText">
                    </div>
                    <div class="col-lg-2" class="divlang">
                        <button onclick="clickbtn2()" type="button" class="btnlangg btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default_language|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
                            {$iso_default_language|escape:'htmlall':'UTF-8'}
                            <span class="caret"></span>
                        </button>
                        <ul class="ullangg dropdown-menu ul3" >
                            {foreach $arr_language key =key_lang item=language}
                                <li>
                                    <a href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
                                </li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            {/foreach}
        </div>
        
        
        <div class="col-lg-12" style="margin-bottom:10px;">
            <label class="control-label col-lg-3 required" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='Expire time' mod='countdowntimerbar'}
				</span>
			</label>
            
            <div class="col-lg-3">
                <input name="days" type="text" id="datepicker" value="{$ArrConfig['days']|escape:'htmlall':'UTF-8'}">
            </div>
            <div class="col-lg-2" style="width:13.6%;">
                <span class="time">{l s='Hours' mod='countdowntimerbar'}</span>
                <select name="hours" style="width:auto;" >
                {for $foo=0 to 23}
                    <option value="{$foo|escape:'htmlall':'UTF-8'}" {if $ArrConfig['hours']|escape:'htmlall':'UTF-8' == $foo|escape:'htmlall':'UTF-8'}selected{/if}>
                        <li>{$foo|escape:'htmlall':'UTF-8'}:00</li>
                    </option>
                {/for}
            </select>
            </div>
            <div class="col-lg-2">
                <span class="time">{l s='Minutes' mod='countdowntimerbar'}</span>
                <select name="minutes" style="width:auto;">
                {for $foo=0 to 59}
                    <option value="{$foo|escape:'htmlall':'UTF-8'}" {if $ArrConfig['minutes']|escape:'htmlall':'UTF-8' == $foo|escape:'htmlall':'UTF-8'}selected{/if}>
                        <li>{$foo|escape:'htmlall':'UTF-8'}</li>
                    </option>
                {/for}
            </select>
            </div>
        </div>
        
        <div class="col-lg-12" style="margin-bottom:10px;">
            <label class="control-label col-lg-3" for="reference">
				<span class="label-tooltip" data-toggle="tooltip" >
					{l s='URL Click' mod='countdowntimerbar'}
				</span>
			</label>
			{foreach from=$arr_language key=key_lang item=language}
				<div class="translatable-field row lang-{$language.id_lang|escape:'htmlall':'UTF-8'}" style="{if $id_default == $language.id_lang}display:block;{/if} {if $id_default != $language.id_lang}display:none;{/if}" >
					<div class="col-lg-3" class="inputheader">
						<input value="{$txtURL[$language.id_lang]|escape:'htmlall':'UTF-8'}" id="txtURL_{$language.id_lang|escape:'htmlall':'UTF-8'}" name="txtURL{$language.id_lang|escape:'htmlall':'UTF-8'}" type="text"  class="form-control  updateCurrentText" >
					</div>
					<div class="col-lg-2" class="divlang">
						<button onclick="clickbtn2()" type="button" class="btnlangg btn btn-default dropdown-toggle language_view" data-toggle="dropdown" tabindex="-1" data-id-choose="{$id_default_language|escape:'htmlall':'UTF-8'}" data-iso-choose="{$iso_default_language|escape:'htmlall':'UTF-8'}" class="iso_code_now">
							{$iso_default_language|escape:'htmlall':'UTF-8'}
							<span class="caret"></span>
						</button>
						<ul class="ullangg dropdown-menu ul3" >
							{foreach $arr_language key =key_lang item=language}
								<li>
									<a href="javascript:void(0);" onclick="baHideOtherLanguage('{$language.id_lang|escape:'htmlall':'UTF-8'}','{$language.iso_code|escape:'htmlall':'UTF-8'}')">{$language.iso_code|escape:'htmlall':'UTF-8'}</a>
								</li>
							{/foreach}
						</ul>
					</div>
				</div>
			{/foreach}
			{*<div class="col-lg-3">
                <input type="text" name="txtURL" id="txtURL" value="{$ArrConfig['txtURL']|escape:'htmlall':'UTF-8'}">
            </div>*}
            
        </div>
		<div class="form-group">

			<div class="col-lg-12" style="margin-bottom:10px;">
				<label class="control-label col-lg-3 " for="reference">
				<span  data-toggle="tooltip" >
					{l s='Timebar Countdown Display' mod='countdowntimerbar'}
				</span>
			</label>
				<div class="col-lg-3">
					<span class="switch prestashop-switch fixed-width-lg" style="margin-left:2px;">
						<input  type="radio" name="active" id="active_on" value="1" {if $ArrConfig['active'] == 1}checked="checked"{/if}>
						<label for="active_on" class="radioCheck">
							{l s='Top' mod='countdowntimerbar'}
						</label>
						<input  type="radio" name="active" id="active_off" value="0" {if $ArrConfig['active'] == 0}checked="checked"{/if}>
						<label for="active_off" class="radioCheck">
							{l s='Bottom' mod='countdowntimerbar'}
						</label>
						<a class="slide-button btn"></a>
					</span>
				</div>
				
			</div>
        </div>
        <div class="panel-footer">
			<button style="margin-left:20px;" type="submit" name="Save" id="Save" class="btn btn-default pull-right">
				<i class="process-icon-save"></i>
				{l s='Save' mod='countdowntimerbar'}
			</button>
		</div>
        
    </div>
</div>
</div>
</form>
<script type="text/javascript" src="{$d nofilter}js/tiny_mce/tiny_mce.js"></script>{*no escape necessary*}
<script type="text/javascript" src="{$d nofilter}js/tiny_mce/tinymce.min.js"></script>{*no escape necessary*}
<script type="text/javascript" src="{$d nofilter}js/tinymce.inc.js"></script>{*no escape necessary*}
<script type="text/javascript" src="{$d nofilter}js/admin/tinymce.inc.js"></script>{*no escape necessary*}
<script language="javascript" type="text/javascript">
	id_language = Number({$e nofilter});{*no escape necessary*}
	tinySetup({
			convert_urls:false,
			relative_urls:false,
			remove_script_host:false
		   });
</script>