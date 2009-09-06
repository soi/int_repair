<?php  

    //|----------------------------------------------------|
    //|Basic functions each assigning one template variable|
    //|----------------------------------------------------|
    

    function call_and_assign($sql, $var_name, $array = false, $alert_when_empty = false) {
    
        global $smarty;
        global $db;

        //echo $sql."<br />";
        $db->run($sql);
        if ($db->error_result) {            
            display_errors(1);
            return true;
        }
        if ($alert_when_empty && $db->empty_result) {
            display_errors(3);
            return true;
        }
        if ($array) {
            $smarty->assign($var_name, $db->get_result_array());
        }
        else {
            $smarty->assign($var_name, $db->get_result_row());
        }
        return true;
    }
    
    
    function assign_bill_info ($job_id) {
        call_and_assign("get_bill_bid_info(".$job_id.")", "bill_bid_info");
        return true;
    }   
     
    
    function assign_cash ($date_start, $date_limit) {
        call_and_assign("get_cash('".$date_start."', '".$date_limit."')", "cash", true);
        return true;    
    }
    
    
    function assign_cash_print ($date_start, $date_limit) {
        call_and_assign("get_cash_print('".$date_start."', '".$date_limit."')", "cash_print", true);
        return true;
    }
    
    
    function assign_cash_print_info ($date_start, $date_limit) {
        call_and_assign("get_cash_print_info('".$date_start."', '".$date_limit."')", "cash_print_info");
        return true;
    }
    
    
    function assign_cash_time_limit($date_start, $date_limit) {
        
        global $smarty;
        
        $smarty->assign('date_start', $date_start);
        $smarty->assign('date_limit', $date_limit);
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
    
    function assign_latest_jobs_info($offset, $length) {

        global $smarty;
        global $db;

        $db->run("get_latest_jobs_count()");
        if ($db->error_result) {
            redirect('job_overview', '', '', array(1));
            return true;
        }
        $count = $db->get_result_row();
        $smarty->assign('latest_jobs_info', array('start' => $offset, 'limit' =>  $length, 'count' => $count['count']));
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
    
    function assign_jobs_latest_changes($offset, $length) {
        call_and_assign("get_jobs_latest_changes(".$offset.", ".$length.")", "jobs_latest_changes", true);
        return true;    
    }
    
    function assign_jobs_latest_changes_info($offset, $length) {
    
        global $smarty;
        global $db;
        
        $db->run("get_job_latest_changes_count()");
        if ($db->error_result) {
            redirect('job_overview', '', '', array(1));
            return true;
        }
        $count = $db->get_result_row();
        $smarty->assign('jobs_latest_changes_info', array('start' => $offset, 'limit' =>  $length, 'count' => $count['count']));
        return true;
    }

    
    function assign_job_services ($job_id) {
        call_and_assign("get_job_services(".$job_id.")", "job_services", true);
        return true;
    }
    
    
    function assign_job_services_bill ($job_id) {
        call_and_assign("get_job_services_bill(".$job_id.")", "job_services", true);
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
    
    function assign_stats() {
        call_and_assign("get_stats()", "stats", false);
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

    function assign_success_info($success_action) {

        global $smarty;

        $success_messages = parse_ini_file(SUCCESS_PATH, true); // @todo what if file not exists
        $related_success_messages = $success_messages[$success_action];  // @todo memcache that
        $smarty->assign('success_message', $related_success_messages['message']);
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