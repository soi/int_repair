<?php     
    //|-----------------------------------------------------------------|
    //|Functions to be called from index.php to display a whole content |
    //|The functions are calling assign functions to assign all template|
    //|variables needed for the content and are performing request error|
    //|checks                                                           |
    //|-----------------------------------------------------------------|
    
    require('assign_functions.php');
     
     // ADD

     
     function display_add_cash() {
        
        global $smarty; 
            
        assign_last_cash();
        $smarty->assign('content', $smarty->fetch("add_cash.tpl"));
        return true;
     }
     
     
     function display_add_job() {

        global $smarty;

        assign_customers();
        $smarty->assign('content', $smarty->fetch("add_customers.tpl"));
        return true;
     }
     
     // EDIT

     
     function display_edit_customer() {

        global $smarty;

        if (valid_request(array(isset($_GET['customer_id'])))) {
             assign_customer_info($_GET['customer_id']);
            $smarty->assign('content', $smarty->fetch("edit_customer.tpl"));    
        }       
        return true;
     }
     
     
     function display_edit_job() {

        global $smarty;

        if (valid_request(array(isset($_GET['job_id'])))) {
            assign_job_info($_GET['job_id']);
            $smarty->assign('content', $smarty->fetch("edit_job.tpl"));
        }
        return true;
     }
     
     
     function display_edit_user_rights() {

        global $smarty;
        
        if (valid_request(array(isset($_GET['user_id'])))) {
            assign_user_info($_GET['user_id']);
            $smarty->assign('content', $smarty->fetch("edit_user_rights.tpl"));
        }
        return true;
     }
     
     // OVERVIEW
     
     
     function display_cash_overview() {

        global $smarty;

        assign_cash();
        $smarty->assign('content', $smarty->fetch("cash_overview.tpl"));
        return true;
     }
     
     
     function display_customer_overview() {

        global $smarty;

        assign_customers();
        $smarty->assign('content', $smarty->fetch("customer_overview.tpl"));
        return true;
     }
     
     
     function display_job_overview() {

        global $smarty;

        assign_jobs();
        $smarty->assign('content', $smarty->fetch("job_overview.tpl"));
        return true;
     }
     
     
     function display_report_overview() {

        global $smarty;

        assign_reports();
        $smarty->assign('content', $smarty->fetch("report_overview.tpl"));
        return true;
     }
     
     
     function display_user_overview() {

        global $smarty;

        assign_users();
        $smarty->assign('content', $smarty->fetch("user_overview.tpl"));
        return true;
     }    
     
     //DETAILS
     
     
     function display_customer_info() {

        if (valid_request(array(isset($_GET['customer_id'])))) {
        
            global $smarty;
    
            assign_customer_info($_GET['customer_id']);
            $smarty->assign('content', $smarty->fetch("customer_info.tpl"));
            return true;
        }
     } 
     
    
    // MISC
    
    
    function display_success($success_action, $related_id = 0) {
        assign_success_info($success_action, $related_id = 0);
        return true;
    }
    
     
    function display_errors($errors) {

        global $smarty;

        if (!is_array($errors))
            $errors = array($errors);
        if (assign_error_messages($errors)) {
            $smarty->assign('content', $smarty->fetch("errors.tpl"));
            return true;
        }
        else
            return false;
    }
     
     
    function display_visitor_info() {
        return assign_visitor_info();
    }
     
     
    function valid_request($required_vars) {

        global $smarty;

        foreach($required_vars as $val)
            if (!$val) {
                display_errors(2);
                return false;
            }
        return true;
    }
     

    
?>