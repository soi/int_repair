<?php

// load Smarty library
require('/usr/share/php/smarty/libs/Smarty.class.php');

class smarty_connect extends Smarty
{
   function smarty_connect()
   {
        // Class Constructor.
        // These automatically get set with each new instance.

		$this->Smarty();

		$this->template_dir = '/var/www/int/templates';
        $this->config_dir = '/var/www/int/smarty/configs';
        $this->cache_dir = '/var/www/int/smarty/cache';
        $this->compile_dir = '/var/www/int/smarty/templates_c';

		$this->assign('Paul', '');
   }
}
?>
