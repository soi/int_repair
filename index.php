<?php
    /*
     * Return the sites the user is permitted to see
     *
     * @access public
     * @return array of string containing the permitted site names
     */

     // @todo put this into the $_SESSION - Array for faster access
     // @todo memcache?
    function get_permitted_sites() {

        global $db;
        
        $everybody_sites = array('user_overview', 
                                 'customer_overview', 
                                 'cash_overview', 
                                 'job_overview');                                 
        
        $tech_sites      = array('add_job', 
                                 'edit_job', 
                                 'complete_add_job', 
                                 'complete_edit_job', 
                                 'job_overview', 
                                 'user_overview');
                            
        $managment_sites = array('add_cash',
                                 'add_customer',
                                 'create_bill',
                                 'cash_overview',
                                 'complete_add_cash',
                                 'complete_add_customer',
                                 'complete_edit_customer',
                                 'customer_info',
                                 'edit_customer',
                                 'reports_overview',
                                 'user_overview');
                                                           
        $admin_sites     = array('add_user', 
                                 'complete_add_user', 
                                 'complete_edit_user_rights', 
                                 'edit_user_rights');
        
        $perm_sites = $everybody_sites;
        if ($_SESSION['admin_permission']) {
            $perm_sites = array_merge($perm_sites, $admin_sites, $tech_sites, $managment_sites);
        }
        else {
            if ($_SESSION['tech_permission']) {
                $perm_sites = array_merge($perm_sites, $tech_sites);
            }
            if ($_SESSION['managment_permission']) {
                $perm_sites = array_merge($perm_sites, $managment_sites);
            }    
        }
        return $perm_sites;
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
     
    $perm_sites = get_permitted_sites();
    if (in_array($_GET['site'], $perm_sites)) {
        switch ($_GET['site']) { 
        
            //ADD
           
            case 'add_cash' :
                display_add_cash();
                break;
            
            case 'add_customer' :
                $smarty->assign('content', $smarty->fetch("add_customer.tpl"));
                break;
            
            case 'add_job' :
                display_add_job();
                break;
                
            case 'add_user' :
                $smarty->assign('content', $smarty->fetch("add_user.tpl"));
                break;
                
            case 'complete_add_cash' :
                complete_add_cash();
                break;

            case 'complete_add_customer' :
                complete_add_customer();
                break;

            case 'complete_add_job' :
                complete__add_job();
                break;

            case 'complete_add_user' :
                complete_add_user();
                break;
            
            
            //EDIT
            
            case 'edit_customer' :
                display_edit_customer();
                break;

            case 'edit_job' :
                display_edit_job();
                break;

            case 'edit_user_rights' :
                display_edit_user_rights();
                break;
                
            case 'complete_edit_customer' :
                complete_edit_customer();
                break;

            case 'complete_edit_job' :
                complete_edit_job();
                break;

            case 'complete_edit_user_rights' :
                complete_edit_user_rights();
                break;
            
            //OVERVIEWS
            
            case 'cash_overview' :
                display_cash_overview();
                break;

            case 'customer_overview' :
                display_customer_overview();
                break;

            case 'job_overview' :
                display_job_overview();
                break;
            
            case 'report_overview' :
                display_report_overview();
                break;    
                
            case 'user_overview' :
                display_user_overview();
                break;
            
           //DETAILS
           
            case 'customer_info' :
                display_customer_info();
                break;
                
            case 'job_info' :
                display_job_info();
                break;
                
        }
    }
    else {
        $smarty->display('login.tpl');
        return true;    
    }
    
    
    //assigning page parts that are always visible
    //$smarty->assign('head', $smarty->fetch("head.tpl"));
    $smarty->assign('left_navi', $smarty->fetch("left_navi.tpl"));
    $smarty->assign('right_navi', $smarty->fetch("right_navi.tpl"));
    $smarty->assign('footer', $smarty->fetch("footer.tpl"));
    
    $smarty->display('index.tpl');

?>
