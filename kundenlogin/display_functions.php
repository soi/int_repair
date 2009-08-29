<?php     
    //|-----------------------------------------------------------------|
    //|Functions to be called from index.php to display a whole content |
    //|The functions are calling assign functions to assign all template|
    //|variables needed for the content and are performing request error|
    //|checks                                                           |
    //|-----------------------------------------------------------------|
    
    require('assign_functions.php');
     
     function display_jobs() {
        
        global $smarty; 
            
        assign_jobs();
        $smarty->assign('content', $smarty->fetch("jobs.tpl"));
        return true;
     }
     
     
    // MISC


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