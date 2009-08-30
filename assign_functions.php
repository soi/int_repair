<?php  

    //|----------------------------------------------------|
    //|Basic functions each assigning one template variable|
    //|----------------------------------------------------|
    

    function call_and_assign($sql, $var_name, $array = false, $alert_when_empty = false) {
    
        global $smarty;
        global $db;

        $db->run($sql);
        if ($db->error_result) {            
            display_errors(1);
            return true;
        }
        elseif ($alert_when_empty && $db->empty_result) {
            display_errors(3);
            return true;
        }
        else {
            if ($array) {
                $smarty->assign($var_name, $db->get_result_array());
            }
            else {
                $smarty->assign($var_name, $db->get_result_row());
            }
            return true;
        }
    }
    
    function assign_cash ($offset, $cash) {
        call_and_assign("get_cash(".$offset.", ".$cash.")", "cash", true);
        return true;    
    }
    
    
    function assign_customer_info($customer_id) {    
        call_and_assign("get_customer_info(".$customer_id.")", "customer_info", false, true);      
        return true;
    }
    
    
    function assign_customers() {    
        call_and_assign("get_customers()", "customers", true);
        return true;
    }
    
    

    function assign_error_messages($errors) {

        global $smarty;

        $error_messages = parse_ini_file(ERROR_PATH);   // @todo what if file not exists
        $related_error_messages = array_values(array_intersect_key($error_messages, array_flip($errors)));  // @todo memcache that
        $smarty->assign('error_messages', $related_error_messages);
        return true;
    }
    
    
    
    function assign_latest_jobs ($offset, $length) {    
        call_and_assign("get_latest_jobs(".$offset.", ".$length.")", "latest_jobs", true);
        return true;
    }
    
    
    function assign_job_additional_info ($job_id) {
        call_and_assign("get_job_additional_info(".$job_id.")", "job_additional_info", false, true);
        return true;
    }
    

    function assign_job_info ($job_id) {
        call_and_assign("get_job_info(".$job_id.")", "job_info", false, true);
        return true;
    }

    
    function assign_job_services ($job_id) {
        call_and_assign("get_job_services(".$job_id.")", "job_services", true);
        return true;
    }
    
    
    function assign_job_service_types () {
        call_and_assign("get_job_service_types()", "job_service_types", true);
        return true;
    }
    
    
     function assign_job_status ($job_id) {
        call_and_assign("get_job_status(".$job_id.")", "job_status", true);
        return true;
    }
    

    function assign_job_status_types () {
        call_and_assign("get_job_status_types()", "job_status_types", true);
        return true;
    }
    
    /**
     * Assignes the $success_info template variable some information about the success
     * can contain a relates id to the action
     * gets the messages from "languages/en/succes.ini"
     *
     * @access public
     * @param string $succes_action success action name
     * @param string $relatedivision_id optional id
     * @return true
    */

    function assign_success_info($success_action, $related_id = 0) {

        global $smarty;

        $success_messages = parse_ini_file(SUCCESS_PATH, true); // @todo what if file not exists
        $related_success_messages = $success_messages[$success_action];  // @todo memcache that
        // array that is to be assigned
        $success = array();
        $success['action'] = $related_success_messages['action'];
        $success['message'] = $related_success_messages['message'];
        if ($related_id)
            $success['id'] = $related_id;

        $smarty->assign('success_info', $success);
        return true;
    }
    
    
    
    function assign_user_info($user_id) {
        call_and_assign("get_user_info(".$user_id.")", "user_info", false, true);
        return true;
    }

    
    function assign_users() {    
        call_and_assign("get_users()", "users", true);
        return true;
    }
    
    
    function assign_visitor_info()  {

        global $smarty;

        $smarty->assign('visitor_info', $_SESSION);
        return true;
      
     }
     
     

    
    
 ?>