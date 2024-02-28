<?php
/**
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
 * to license@buy-addons.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author    Buy-Addons <contact@buy-addons.com>
 *  @copyright 2007-2023 PrestaShop SA
 *  @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 *
 * @since 1.6
 */
class CountdownTimerBar extends Module
{
    private $demoMode = false;

    public function __construct()
    {
        $this->name = 'countdowntimerbar';
        $this->tab = 'front_office_features';
        $this->version = '1.0.13';
        $this->author = 'buy-addons';
        $this->need_instance = 0;
        $this->bootstrap = true;
        $this->module_key = 'd27e454385885fdffd3f43b3c2b57380';
        parent::__construct();
        $this->displayName = $this->l('Fancy Countdown Timer Bar');
        $this->description = $this->l('display a Countdown Timer on the top, Bottom position of your site');
    }

    public function install()
    {
        if (parent::install() == false) {
            return false;
        }
        Configuration::UpdateValue('Settingcd', '{"colormess":"FFFFFF","colorBackGround":"FF0000",
        "colorClick":"FFFFFF","btnColorClick":false,"days":"","hours":"0","minutes":"0",
        "txtURL":"","active":"1"}');

        if ($this->registerHook('displayNav') == false) {
            return false;
        }
        if ($this->registerHook('displayTop') == false) {
            return false;
        }
        if ($this->registerHook('displayHeader') == false) {
            return false;
        }

        return true;
    }

    public function hookdisplayHeader(&$params)
    {
        $html = '';
        $this->context->controller->addCSS($this->_path . 'views/css/designhook.css');
        $this->context->controller->addJS($this->_path . 'views/js/countdown.js');

        return $html;
    }

    public function hookdisplayNav(&$params)
    {
        return $this->hookdisplayTop($params);
    }

    public function hookdisplayTop(&$params)
    {
        $html = '';
        $id_lang = $this->context->language->id;
        $getidLang = Language::getLanguage($id_lang);
        $this->smarty->assign('getidLang', $getidLang);
        $getConfigTime = Configuration::get('Settingcd');
        $Settingcd = json_decode($getConfigTime, true);
        $this->smarty->assign('Settingcd', $Settingcd);

        $language = Language::getLanguages(false);
        $this->smarty->assign('arr_language', $language);

        $dateSrc1 = str_replace('/', '-', $Settingcd['days']) . 'T' . $Settingcd['hours'] . ':' . $Settingcd['minutes'] . ':00';

        $now = getdate();
        $str = strtotime($dateSrc1);
        $a = date('Y-m-d H:i', $str) . ':00';
        $timecountdown = $str - $now[0] < 0;
        $txtStart = [];
        $textArea = [];
        $days = [];
        $hrs = [];
        $min = [];
        $second = [];
        $txtURL = [];
        foreach ($language as $lang) {
            $txtStart[] = Configuration::get('txtcontrol_' . $lang['id_lang']);
            $textArea[] = Configuration::get('textarea_' . $lang['id_lang']);
            $days[] = Configuration::get('days' . $lang['id_lang']);
            $hrs[] = Configuration::get('hrs' . $lang['id_lang']);
            $min[] = Configuration::get('min' . $lang['id_lang']);
            $second[] = Configuration::get('second' . $lang['id_lang']);
            $txtURL[$lang['id_lang']] = Configuration::get('txtURL' . $lang['id_lang']);
        }
        $this->smarty->assign('txtStart', $txtStart);
        $this->smarty->assign('textArea', $textArea);
        $this->smarty->assign('days', $days);
        $this->smarty->assign('hrs', $hrs);
        $this->smarty->assign('min', $min);
        $this->smarty->assign('second', $second);
        $this->smarty->assign('timecountdown', $timecountdown);
        $this->smarty->assign('txtURL', $txtURL);

        $active = $Settingcd['active'];
        $html .= '
            <script type="text/javascript">
                var SaveDay=\'' . $Settingcd['days'] . '\';
            </script>
        ';
        $html .= '
            <script type="text/javascript">
                var timer=\'' . $a . '\';
            </script>
        ';
        $html .= '
            <script type="text/javascript">
                var active=\'' . $active . '\';
            </script>
        ';
        $html .= $this->display(__FILE__, 'views/templates/hook/display.tpl');

        return $html;
    }

    public function uninstall()
    {
        if (parent::uninstall() == false) {
            return false;
        }

        return true;
    }

    public function getcontent()
    {
        $html = '';
        $e = 'textarea_';
        $t = 'txtcontrol_';
        $language = Language::getLanguages(false);

        $this->smarty->assign('arr_language', $language);
        $id_default = (int) (Configuration::get('PS_LANG_DEFAULT'));
        $this->smarty->assign('id_default', $id_default);
        $iso_default_language = Language::getIsoById($id_default);
        $this->smarty->assign('iso_default_language', $iso_default_language);
        $id_lang = $this->context->language->id;
        $this->smarty->assign('id_default_language', $id_lang);
        foreach ($language as $lang) {
            if (Configuration::get($t . $lang['id_lang']) == '') {
                Configuration::updateValue($t . $lang['id_lang'], 'Click Here');
            }
            if (Configuration::get($e . $lang['id_lang']) == '') {
                Configuration::updateValue($e . $lang['id_lang'], 'Your message at here');
            }
            if (Configuration::get('days' . $lang['id_lang']) == '') {
                Configuration::updateValue('days' . $lang['id_lang'], 'Days');
            }
            if (Configuration::get('hrs' . $lang['id_lang']) == '') {
                Configuration::updateValue('hrs' . $lang['id_lang'], 'HRS');
            }
            if (Configuration::get('min' . $lang['id_lang']) == '') {
                Configuration::updateValue('min' . $lang['id_lang'], 'MIN');
            }
            if (Configuration::get('second' . $lang['id_lang']) == '') {
                Configuration::updateValue('second' . $lang['id_lang'], 'SEC');
            }
        }

        $this->smarty->assign('demoMode', Tools::getValue('demoMode'));
        $buttonSubmitSaveArr = ['Save'];
        if (Tools::isSubmit('Save')) {
            // demomode
            $token = Tools::getAdminTokenLite('AdminModules');
            $bamodule = AdminController::$currentIndex;
            if ($this->demoMode == true) {
                foreach ($buttonSubmitSaveArr as $buttonSubmitSave) {
                    if (Tools::isSubmit($buttonSubmitSave)) {
                        Tools::redirectAdmin($bamodule . '&token=' . $token . '&configure=' . $this->name . '&demoMode=1');
                    }
                }
            }

            foreach ($language as $lang) {
                if (Configuration::get($t . $lang['id_lang']) == '') {
                    Configuration::updateValue($t . $lang['id_lang'], 'Click Here');
                }
                if (Configuration::get($e . $lang['id_lang']) == '') {
                    Configuration::updateValue($e . $lang['id_lang'], 'Your message at here');
                }
                if (Configuration::get('days' . $lang['id_lang']) == '') {
                    Configuration::updateValue('days' . $lang['id_lang'], 'Days');
                }
                if (Configuration::get('hrs' . $lang['id_lang']) == '') {
                    Configuration::updateValue('hrs' . $lang['id_lang'], 'HRS');
                }
                if (Configuration::get('min' . $lang['id_lang']) == '') {
                    Configuration::updateValue('min' . $lang['id_lang'], 'MIN');
                }
                if (Configuration::get('second' . $lang['id_lang']) == '') {
                    Configuration::updateValue('second' . $lang['id_lang'], 'MIN');
                }
            }
            // save json in database
            $SaveSettingcd = [
                'colormess' => Tools::getValue('colormess'),
                'colorBackGround' => Tools::getValue('colorBackGround'),
                'colorClick' => Tools::getValue('colorClick'),
                'btnColorClick' => Tools::getValue('btnColorClick'),
                'days' => Tools::getValue('days'),
                'hours' => Tools::getValue('hours'),
                'minutes' => Tools::getValue('minutes'),
                'active' => Tools::getValue('active'),
            ];

            $ToStr = json_encode($SaveSettingcd);
            Configuration::UpdateValue('Settingcd', $ToStr);
            json_decode($ToStr, true);

            foreach ($language as $lang) {
                $id_lang_new = $lang['id_lang'];
                Configuration::updateValue($t . $lang['id_lang'], Tools::getValue($t . $lang['id_lang']));
                Configuration::updateValue($e . $lang['id_lang'], Tools::getValue($e . $lang['id_lang']), true);
                Configuration::updateValue('days' . $lang['id_lang'], Tools::getValue('days' . $lang['id_lang']));
                Configuration::updateValue('hrs' . $lang['id_lang'], Tools::getValue('hrs' . $lang['id_lang']));
                Configuration::updateValue('min' . $lang['id_lang'], Tools::getValue('min' . $lang['id_lang']));
                Configuration::updateValue('second' . $lang['id_lang'], Tools::getValue('second' . $lang['id_lang']));

                if (Configuration::get($t . $lang['id_lang']) == '' && Configuration::get($t . $id_default) != '') {
                    Configuration::updateValue($t . $lang['id_lang'], Tools::getValue($t . $id_default));
                }
                if (Configuration::get($e . $lang['id_lang']) == '' && Configuration::get($e . $id_default) != '') {
                    Configuration::updateValue($e . $lang['id_lang'], Tools::getValue($e . $id_default));
                }
                if (Configuration::get('days' . $lang['id_lang']) == '' && Configuration::get('days' . $id_default) != '') {
                    Configuration::updateValue('days' . $lang['id_lang'], Tools::getValue('days' . $id_default));
                }
                if (Configuration::get('hrs' . $lang['id_lang']) == '' && Configuration::get('hrs' . $id_default) != '') {
                    Configuration::updateValue('hrs' . $lang['id_lang'], Tools::getValue('hrs' . $id_default));
                }
                if (Configuration::get('min' . $lang['id_lang']) == '' && Configuration::get('min' . $id_default) != '') {
                    Configuration::updateValue('min' . $lang['id_lang'], Tools::getValue('min' . $id_default));
                }
                if (Configuration::get('second' . $lang['id_lang']) == '' && Configuration::get('second' . $id_default) != '') {
                    Configuration::updateValue('second' . $lang['id_lang'], Tools::getValue('second' . $id_default));
                }
                Configuration::updateValue('txtURL' . $lang['id_lang'], Tools::getValue('txtURL' . $lang['id_lang']));
            }
            $html .= $this->displayConfirmation($this->l('Update successful'));
        }
        $txtStart = [];
        $textArea = [];
        $days = [];
        $hrs = [];
        $min = [];
        $second = [];
        $txtURL = [];
        foreach ($language as $lang) {
            $id_lang_new = $lang['id_lang'];
            $txtStart[] = Configuration::get($t . $lang['id_lang']);
            $textArea[] = Configuration::get($e . $lang['id_lang']);
            $days[] = Configuration::get('days' . $lang['id_lang']);
            $hrs[] = Configuration::get('hrs' . $lang['id_lang']);
            $min[] = Configuration::get('min' . $lang['id_lang']);
            $second[] = Configuration::get('second' . $lang['id_lang']);
            $txtURL[$id_lang_new] = Configuration::get('txtURL' . $lang['id_lang']);
        }

        $iso = $this->context->language->iso_code;
        $a = '\'' . (file_exists(_PS_ROOT_DIR_ . '/js/tiny_mce/langs/' . $iso . '.js') ? $iso : 'en') . '\'';
        $b = '\'' . _THEME_CSS_DIR_ . '\'';
        $c = '\'' . dirname($_SERVER['PHP_SELF']) . '\'';
        $d = __PS_BASE_URI__;
        $e = $this->context->language->id;

        $this->smarty->assign('a', $a);
        $this->smarty->assign('b', $b);
        $this->smarty->assign('c', $c);
        $this->smarty->assign('d', $d);
        $this->smarty->assign('e', $e);

        $this->smarty->assign('txtStart', $txtStart);
        $this->smarty->assign('textArea', $textArea);
        $this->smarty->assign('days', $days);
        $this->smarty->assign('hrs', $hrs);
        $this->smarty->assign('min', $min);
        $this->smarty->assign('second', $second);
        $this->smarty->assign('txtURL', $txtURL);
        // get json from database

        $getConfigTime = Configuration::get('Settingcd');
        $ArrConfig = json_decode($getConfigTime, true);
        $this->smarty->assign('ArrConfig', $ArrConfig);

        $html .= '
            <script type="text/javascript">
                var txtheader=\'' . $id_default . '\';
            </script>
        ';

        $this->context->controller->addJS($this->_path . 'views/js/jscolor.js');
        $this->context->controller->addCSS($this->_path . 'views/css/designadmin.css');
        $this->context->controller->addJS($this->_path . 'views/js/common.js');
        $this->context->controller->addJS($this->_path . 'views/js/admin.js');
        $html .= $this->display(__FILE__, 'views/templates/admin/admin.tpl');

        return $html;
    }
}
