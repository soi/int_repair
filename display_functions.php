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
        $smarty->assign('content', $smarty->fetch("add_job.tpl"));
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
            assign_job_additional_info($_GET['job_id']);
            assign_job_status($_GET['job_id']);
            assign_job_services($_GET['job_id']);
            assign_job_status_types();
            assign_job_service_types();
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

        if (isset($_GET['date_start']) && isset($_GET['date_limit'])) {
            assign_cash($_GET['date_start'], $_GET['date_limit']);
            assign_cash_time_limit($_GET['date_start'], $_GET['date_limit']);
        }
        else {
            $today = date('d.m.y');
            assign_cash($today, $today);
            assign_cash_time_limit($today, $today);
        }
        
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

        assign_latest_jobs(0, 3);
        assign_jobs_latest_changes(0, 3);
        $smarty->assign('content', $smarty->fetch("job_overview.tpl"));
        return true;
     }
     
     
     function display_user_overview() {

        global $smarty;

        assign_users();
        $smarty->assign('content', $smarty->fetch("user_overview.tpl"));
        return true;
     }    
     
     
     function display_jobs_latest_changes() {
        
        global $smarty;   
        
        if (isset($_GET['start'] && $_GET['limit'])) {
            assign_jobs_latest_changes($_GET['start'], $_GET['limit']);
            assign_jobs_latest_changes_info($_GET['start'], $_GET['limit']); 
        } 
        else {
            assign_jobs_latest_changes(0, 20);
            assign_jobs_latest_changes_info(0, 20);
        }           
        $smarty->assign('content', $smarty->fetch("latest_changes.tpl"));        
        return true;
     }
     
     
     function display_latest_jobs() {

        global $smarty;

        if (isset($_GET['start'] && $_GET['limit'])) {
            assign_jobs_latest_changes($_GET['start'], $_GET['limit']);
            assign_jobs_latest_changes_info($_GET['start'], $_GET['limit']);
        }
        else {
            assign_jobs_latest_changes(0, 20);
            assign_jobs_latest_changes_info(0, 20);
        }
        $smarty->assign('content', $smarty->fetch("latest_jobs.tpl"));
        return true;
     }
     
     //DETAILS
     
     
     function display_customer_info() {

        if (valid_request(array(isset($_GET['customer_id'])))) {
        
            global $smarty;
    
            assign_customer_info($_GET['customer_id']);
            $smarty->assign('content', $smarty->fetch("customer_info.tpl"));
        }
        return true;
     } 
     
    
    // PRINT
    
    function display_bill() {
    
        if (valid_request(array(isset($_GET['job_id'])))) {
    
            global $smarty;             
            assign_job_services_bill($_GET['job_id']);
            assign_bill_info($_GET['job_id']);
        }
        return true;
           
    }
    
    function display_cash_print() {

        if (valid_request(array(isset($_GET['date_start']), isset($_GET['date_limit'])))) {

            global $smarty;
            assign_cash_print($_GET['date_start'], $_GET['date_limit']);
            assign_cash_print_info($_GET['date_start'], $_GET['date_limit']);
        }
        return true;

    }
    
    //MISC
    
    
    function display_success($success_action, $short_message = false, $related_id = 0) {
        
        global $smarty;
        
        assign_success_info($success_action, $related_id);
        if ($short_message) {
            $smarty->assign('status_message', $smarty->fetch("success_message.tpl"));    
        }
        else {
            $smarty->assign('content', $smarty->fetch("success.tpl"));    
        }
        return true;
    }
    
     
    function display_errors($errors) {

        global $smarty;

        if (!is_array($errors))
            $errors = array($errors);
        if (assign_error_messages($errors)) {
            $smarty->assign('error_message', $smarty->fetch("errors.tpl"));
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