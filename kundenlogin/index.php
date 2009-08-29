<?php
        
    function parse_messages() {        
        if (isset($_GET['success']) && ($_GET['success'])) {
            display_success($_GET['success'], true);
        } 
        if (isset($_GET['errors']) && ($_GET['errors'])) {
            display_errors(explode($_GET['errors']));
        }
    }

    /******************
     Main part
     ******************/

    // @todo delete when release
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    require('constants.php');
    require(CLASS_PATH.SMARTY_CON_PATH);
    require('display_functions.php');
    require('complete_functions.php');
    require(CLASS_PATH.'class.mysql.connection.php');
    
    //main db connection
    $db = new mysql_connection('localhost', 'julia_usr', 'YsvQz8SfV9', 'julia');
    //$db_connection = connect_to_db('localhost', 'paul_dbo', 'BN6uMqvPyv', 'paul');
    
    //main smarty instance        
    $smarty = new smarty_connect;         
    $smarty->debugging_ctrl = ($_SERVER['SERVER_NAME'] == 'localhost') ? 'URL' : 'NONE';
    
    
    if (isset($_GET['site']) && $_GET['site'] == 'complete_login'){
        complete_login();
        return true;
    } elseif (isset($_GET['site']) && $_GET['site'] == 'complete_logout') {
        complete_logout();
        return true;    
    }
    
    if (!isset($_SESSION['user_id']) || !isset($_GET['site']) ) {
        $smarty->display('login.tpl');
        return true;    
    }
    
    display_visitor_info();            
    parse_messages();
    
    switch ($_GET['site']) { 
        case 'jobs' :
            display_jobs();
            break;
        
        case 'add_email' :
            $smarty->assign('content', $smarty->fetch("add_email.tpl"));
            break;
        
        case 'complete_add_email' :
            complete_add_email();
            break; 
    }
    
    
    //assigning page parts that are always visible
    //$smarty->assign('head', $smarty->fetch("head.tpl"));
    $smarty->assign('left_navi', $smarty->fetch("left_navi.tpl"));
    //$smarty->assign('right_navi', $smarty->fetch("right_navi.tpl"));
    $smarty->assign('footer', $smarty->fetch("footer.tpl"));    
    $smarty->display('index.tpl');
    unset ($smarty);

?>
