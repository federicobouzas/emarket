<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <?php echo $this->Html->charset(); ?>
        <title><?php echo $CONFIGURATION['empresa']; ?> :: <?php echo $title_for_layout; ?></title>
        <?php
        echo $this->Html->meta('icon');

        echo $this->Html->css('cake.generic');
        echo $this->Html->css('superfish');
        echo $this->Html->css('email');

        echo $this->element('fmw_includes');
        echo $this->element('js_vars');

        echo $this->fetch('meta');
        echo $this->fetch('css');
        echo $this->fetch('script');
        ?>
    </head>
    <body>
        <div id="container">
            <div class="top-header">
                <?php echo $this->element('logo'); ?>
                <?php echo $this->element('user_info'); ?>
            </div>  
            <div id="header">                
                <?php echo $this->element('menu'); ?>  
            </div>
            <div id="content">
                <?php echo $this->Session->flash(); ?>
                <?php echo $this->fetch('content'); ?>
            </div>
            <div id="footer"><?php echo getSystemConfiguration("footer"); ?> | v<?php echo getSystemConfiguration("version"); ?></div>
            <?php echo $this->element('sql_dump'); ?>
        </div>
        <?php if (isset(AppConfig::$array['site']['ajax']['loading']) && AppConfig::$array['site']['ajax']['loading']): ?>
            <div class="loadingAjax"><?php echo AppConfig::$array['site']['ajax']['loading']; ?></div>
        <?php endif; ?>
        <div class="loadingFullscrean">Cargando datos...</div>
    </body>
</html>
