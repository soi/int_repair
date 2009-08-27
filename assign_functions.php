<?php  

    //|----------------------------------------------------|
    //|Basic functions each assigning one template variable|
    //|----------------------------------------------------|
    
    function assign_customer_info($customer_id) {
    
        global $smarty;
        global $db;
        
        $db->run("get_customer_info(".$customer_id.")");
        if ($db->error_result) {
            display_errors(1);
            return true;
        }
        else {
            $smarty->assign('customer_info', $db->get_result_row());
            return true;
        }
        
        
    }
    
    
    function assign_customers() {

        global $smarty;
        global $db;

        $db->run("get_customers()");
        if ($db->error_result) {
            display_errors(1);
            return true;
        }
        else {
            $smarty->assign('customers', $db->get_result_array());
            return true;
        }


    }
    
    

    function assign_error_messages($errors) {

        global $smarty;

        $error_messages = parse_ini_file(ERROR_PATH);   // @todo what if file not exists
        $related_error_messages = array_values(array_intersect_key($error_messages, array_flip($errors)));  // @todo memcache that
        $smarty->assign('error_messages', $related_error_messages);
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
        
        global $smarty;
        global $db;
        
        $sql = "get_user_info(".$user_id.")";
        $db->run($sql);
        if ($db->error_result) {
            display_errors(1);
            return true;
        }
        else {
            $smarty->assign('user_info', $db->get_result_row());   
            return true;    
        }
    }
    
    
    function assign_users() {

        global $smarty;
        global $db;
        
        $db->run("get_users()");
        $smarty->assign('users', $db->get_result_array());
        return true;
    }
    
    
    function assign_visitor_info()  {

        global $smarty;
        global $db;

        $smarty->assign('visitor_info', $_SESSION);
        return true;
      
     }
    
    
 ?>