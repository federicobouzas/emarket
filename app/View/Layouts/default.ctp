<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <?php echo $this->Html->charset(); ?>
        <title><?php echo $CONFIGURATION['empresa']; ?> :: <?php echo $title_for_layout; ?></title>
        <?php
        echo $this->Html->meta('icon');

        echo $this->Html->css('cake.generic');
        echo $this->Html->css('superfish');
        echo $this->Html->css('fmw/jquery-ui');
        echo $this->Html->css('fmw/jquery.alerts');
        echo $this->Html->css('fmw/jquery.tipsy');
        echo $this->Html->css(WWW . '../includes/fmw/kendo/styles/kendo.common.min');
        echo $this->Html->css(WWW . '../includes/fmw/kendo/styles/kendo.default.min');

        echo $this->Html->script('fmw/jquery.min');
        echo $this->Html->script('fmw/jquery.ui.min');
        echo $this->Html->script('fmw/jquery.alerts');
        echo $this->Html->script('fmw/jquery.tipsy');
        echo $this->Html->script('fmw/jquery.superfish');
        echo $this->Html->script('fmw/jquery.scrollTo.min');
        echo $this->Html->script(WWW . '../includes/fmw/kendo/js/kendo.web.min');
        echo $this->Html->script(WWW . '../includes/fmw/kendo/js/cultures/kendo.culture.es-AR.min');
        echo $this->Html->script('fmw/hoverIntent');
        echo $this->Html->script('fmw/default/funciones');
        echo $this->Html->script('fmw/default/ready');        
        $this->Html->scriptBlock("var WWW = '" . WWW . "';", array('inline' => false));

        echo $this->fetch('meta');
        echo $this->fetch('css');
        echo $this->fetch('script');
        ?>
    </head>
    <body>
        <div id="container">
            <div id="header">
                <?php
                echo $this->element('menu');
                ?>
            </div>
            <div id="content">
                <?php echo $this->Session->flash(); ?>
                <?php echo $this->fetch('content'); ?>
            </div>
            <div id="footer">| <?=(isset($CONFIGURATION['footer']) ? $CONFIGURATION['footer'] : '')?> |</div>
            <?php echo $this->element('sql_dump'); ?>
        </div>
    </body>
</html>
