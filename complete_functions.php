<?php 

    function complete_add_cash() {
        if (valid_request(array(isset($_POST['price']),
                                isset($_POST['description']), 
                                isset($_POST['record']),))) {
                                
            global $db;
            global $smarty;
    
            if (strlen($_POST['description']) > 150) {
                redirect('cash_overview', '', '', 250);
                return true;    
            }
            
            if (strlen($_POST['record']) >20) {
                redirect('cash_overview', '', '', 251);
                return true;
            }
            
            str_replace('-', '', $_POST['price']);
            $_POST['price'] = str_replace(',', '.', $_POST['price']);
            
            if ($_POST['type'] == 'out') {                
                $_POST['price'] = $_POST['price'] - (2 * $_POST['price']); 
            }
            
            $sql = "add_cash(".$_SESSION['user_id'].",
                             '".$_POST['record']."',
                             ".$_POST['price'].",
                             '".$_POST['description']."')";
            $db->run($sql);
            if ($db->error_result) {
                redirect('cash_overview', '', '', array(1));
                return true;
            }
            else {
                redirect('cash_overview', '', 'add_cash');
                return true;
            }
        }  
        return true;  
    }
    
    
    
    function complete_add_customer() {
        if (valid_request(array(isset($_POST['form_of_address']),
                                isset($_POST['first_name']),
                                isset($_POST['last_name']),
                                isset($_POST['title_addition']),
                                isset($_POST['firm_name']),
                                isset($_POST['street']),
                                isset($_POST['plz']),
                                isset($_POST['town']),
                                isset($_POST['tel_1']),
                                isset($_POST['tel_2']),
                                isset($_POST['fax']),
                                isset($_POST['email'])))) {
        }

        global $db;
        global $smarty;

        if (strlen($_POST['form_of_address']) > 4)
            $errors[] = 62;
        if (strlen($_POST['first_name']) > 45)
            $errors[] = 52;
        if (strlen($_POST['last_name']) > 45)
            $errors[] = 51;
        if (strlen($_POST['title_addition']) > 20)
            $errors[] = 53;
        if (strlen($_POST['firm_name']) > 45)
            $errors[] = 54;
        if (strlen($_POST['street']) > 45)
            $errors[] = 55;
        if (strlen($_POST['plz']) > 10)
            $errors[] = 56;
        if (strlen($_POST['tel_1']) > 20)
            $errors[] = 57;
        if (strlen($_POST['tel_2']) > 20)
            $errors[] = 58;
        if (strlen($_POST['fax']) > 20)
            $errors[] = 59;
        if (strlen($_POST['email']) > 45)
            $errors[] = 60;
        if (strlen($_POST['town']) > 45)
            $errors[] = 61;

        if (isset($errors)) {
            redirect('add_customer', '', '', $errors);
            return true;
        }

        $sql = "add_customer('".$_POST['form_of_address']."',
                             '".$_POST['first_name']."',
                             '".$_POST['last_name']."',
                             '".$_POST['title_addition']."',
                             '".$_POST['firm_name']."',
                             '".$_POST['street']."',
                             '".$_POST['plz']."',
                             '".$_POST['tel_1']."',
                             '".$_POST['tel_2']."',
                             '".$_POST['fax']."',
                             '".$_POST['email']."',
                             '".$_POST['town']."')";
        $db->run($sql);
        if ($db->error_result)
            redirect('add_customer', '', '', array(1));
        else {
            redirect('customer_overview', '', 'add_customer');
        }
        return true;
    }
    

    function complete_add_job() {
        if (valid_request(array(isset($_POST['description']),
                                isset($_POST['short_description']),
                                isset($_POST['customer_id'])))) {
            global $db;
            global $smarty;
            
            if (strlen($_POST['short_description']) > 150) {
                redirect('add_job', '', '', array(101));
                return true;
            }     
            
            if (!isset($_POST['bid_needed'])) {
                $bid = 0;
            }
            else {
                $bid = 1;
            }
            
            $sql = "get_customer_info(".$_POST['customer_id'].")";
            $db->run($sql);
            if ($db->empty_result) {
                redirect('add_job', '', '', array(100));
                return true;    
            }
            else {
                $customer_info = $db->get_result_row();
                
                $sql = "add_job(".$_SESSION['user_id'].",
                                ".$_POST['customer_id'].",
                                ".$bid.", 
                                '".$_POST['description']."',
                                '".$_POST['short_description']."',
                                '".$customer_info['form_of_address']."',
                                '".$customer_info['first_name']."',
                                '".$customer_info['last_name']."',
                                '".$customer_info['street']."',
                                '".$customer_info['plz']."',
                                '".$customer_info['town']."',
                                '".$customer_info['tel_1']."',
                                '".$customer_info['tel_2']."',
                                '".$customer_info['fax']."',
                                '".$customer_info['email']."')";
                $db->run($sql);
                if ($db->error_result) {
                    redirect('add_job', '', '', array(1));
                    return true;    
                }
                else {
                    redirect('job_overview', '', 'add_job');
                    return true;
                }   
            }
        }  
        return true;  
    }
    
    
    function complete_add_service() {
        if (valid_request(array(isset($_GET['job_id']),
                                isset($_POST['type_id']),
                                isset($_POST['description']),
                                isset($_POST['custom_type']),
                                isset($_POST['price']), 
                                isset($_POST['amount'])))) {

            global $db;
            global $smarty;
            
            if (!preg_match('/^[0-9]+((\.{1}|\,{1})[0-9]+)?$/', $_POST['price'])) {
                redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(203));
                return true;    
            }

            $_POST['price'] = str_replace(',', '.', $_POST['price']);            
            
            if (strlen($_POST['custom_type']) > 0) {
                if (strlen($_POST['custom_type']) > 100) {
                    redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(200));
                    return true;
                }
                
                $sql = "add_custom_job_service(".$_GET['job_id'].", 
                                               ".$_SESSION['user_id'].", 
                                               '".$_POST['description']."', 
                                               '".$_POST['custom_type']."', 
                                               ".$_POST['price'].", 
                                               ".$_POST['amount'].")";
                $db->run($sql);
                if ($db->error_result) {
                    redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(1));
                    return true;    
                }
                else {
                    redirect('edit_job', 'job_id='.$_GET['job_id'], 'add_service');
                    return true;                   
                }                
            }
            else {
                if ($_POST['type_id'] == 0) {
                    redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(201));
                    return true;    
                }
                
                $type = substr($_POST['type_id'],0 , strpos($_POST['type_id'], '&'));
                $sql = "add_job_service(".$_GET['job_id'].",
                                        ".$_SESSION['user_id'].",
                                        '".$_POST['description']."',
                                        ".$type.",
                                        ".$_POST['price'].",
                                        ".$_POST['amount'].")";
                $db->run($sql);
                if ($db->error_result) {
                    redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(1));
                    return true;    
                }
                else {
                    redirect('edit_job', 'job_id='.$_GET['job_id'], 'add_service');
                    return true;
                }    
            }
        }    
    }
    
    
    
    function complete_add_status() {
        if (valid_request(array(isset($_GET['job_id']),
                                isset($_POST['type_id']),
                                isset($_POST['description'])))) {

            global $db;
            global $smarty;
            
            if ($_POST['type_id'] == 0) {
                redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(202));
                return true;
            }

            $sql = "add_job_status(".$_GET['job_id'].",
                                   ".$_SESSION['user_id'].",
                                   ".$_POST['type_id'].",
                                   '".$_POST['description']."')";
            $db->run($sql);
            if ($db->error_result) {
                redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(1));
                return true;
            }
            else {
                
                redirect('edit_job', 'job_id='.$_GET['job_id'], 'add_status');
                return true;
            }
        }
    }
    


    function complete_add_user() {
        if (valid_request(array(isset($_POST['first_name']),
                                isset($_POST['last_name']),
                                isset($_POST['password']),
                                isset($_POST['password_retype'])))) {

            global $db;
            global $smarty;

            if ($_POST['password'] != $_POST['password_retype']) {
                redirect('add_user', '', '', array(50));
                return true;
            }

            if (!isset($_POST['admin'])) {
                $admin_perm = 0;
            }
            else {
                $admin_perm = 1;
            }

            if (!isset($_POST['managment'])) {
                $managment_perm = 0;
            }
            else {
                $managment_perm = 1;
            }

            if (!isset($_POST['tech'])) {
                $tech_perm = 0;
            }
            else {
                $tech_perm = 1;
            }

            $sql = "add_user('".$_POST['first_name']."',
                             '".$_POST['last_name']."',
                             ".$admin_perm.",
                             ".$tech_perm.",
                             ".$managment_perm.",
                             '".md5($_POST['password'])."')";
            $db->run($sql);
            if ($db->error_result)
                redirect('user_overview', '', '', array(1));
            else {
                redirect('user_overview', '', 'add_user');
            }
        }
        return true;
    }
    
    
    function complete_delete_job_service () {
        if (valid_request(array(isset($_GET['job_service_id']),
                                isset($_GET['job_id'])))) {
                                     
            global $db;
            global $smarty;
            
            $sql = "delete_job_service(".$_GET['job_service_id'].")";
            $db->run($sql);
            if ($db->error_result)
                 redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(1));
            else {
                 redirect('edit_job', 'job_id='.$_GET['job_id'], 'delete_job_service');
            }
        }
        return true;    
    }
    
    
    
    function complete_delete_job_status () {
        if (valid_request(array(isset($_GET['job_status_id']),
                                isset($_GET['job_id'])))) {

            global $db;
            global $smarty;

            $sql = "delete_job_status(".$_GET['job_status_id'].")";
            $db->run($sql);
            if ($db->error_result)
                 redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(1));
            else {
                 redirect('edit_job', 'job_id='.$_GET['job_id'], 'delete_job_status');
            }
        }
        return true;
    }


    function complete_edit_customer() {
        if (valid_request(array(isset($_GET['customer_id']),
                                isset($_POST['form_of_address']),
                                isset($_POST['first_name']),
                                isset($_POST['last_name']),
                                isset($_POST['title_addition']),
                                isset($_POST['firm_name']),
                                isset($_POST['street']),
                                isset($_POST['plz']),
                                isset($_POST['town']),
                                isset($_POST['tel_1']),
                                isset($_POST['tel_2']),
                                isset($_POST['fax']),
                                isset($_POST['email'])))) {

            global $db;
            global $smarty;
    
            if (strlen($_POST['form_of_address']) > 4)
                $errors[] = 62;
            if (strlen($_POST['first_name']) > 45)
                $errors[] = 52;
            if (strlen($_POST['last_name']) > 45)
                $errors[] = 51;
            if (strlen($_POST['title_addition']) > 20)
                $errors[] = 53;
            if (strlen($_POST['firm_name']) > 45)
                $errors[] = 54;
            if (strlen($_POST['street']) > 45)
                $errors[] = 55;
            if (strlen($_POST['plz']) > 10)
                $errors[] = 56;
            if (strlen($_POST['tel_1']) > 20)
                $errors[] = 57;
            if (strlen($_POST['tel_2']) > 20)
                $errors[] = 58;
            if (strlen($_POST['fax']) > 20)
                $errors[] = 59;
            if (strlen($_POST['email']) > 45)
                $errors[] = 60;
            if (strlen($_POST['town']) > 45)
                $errors[] = 61;
    
            if (isset($errors)) {
                redirect('edit_customer', 'customer_id='.$_GET['customer_id'], '', $errors);
                return true;
            }
    
            $sql = "edit_customer(".$_GET['customer_id'].",
                                  '".$_POST['form_of_address']."',
                                  '".$_POST['first_name']."',
                                  '".$_POST['last_name']."',
                                  '".$_POST['title_addition']."',
                                  '".$_POST['firm_name']."',
                                  '".$_POST['street']."',
                                  '".$_POST['plz']."',
                                  '".$_POST['tel_1']."',
                                  '".$_POST['tel_2']."',
                                  '".$_POST['fax']."',
                                  '".$_POST['email']."',
                                  '".$_POST['town']."')";
            $db->run($sql);
            if ($db->error_result)
                 redirect('customer_overview', '', '', array(1));
            else {
                 redirect('customer_info', 'customer_id='.$_GET['customer_id'], 'edit_customer');
            }
        }
        return true;    
    }
    
    
    function complete_edit_job_description() {
        if (valid_request(array(isset($_GET['job_id']), isset($_POST['description'])))) {
            
            global $db;
            global $smarty;  
            
            $db->run('edit_job_description('.$_GET['job_id'].', \''.$_POST['description'].'\')');
            if ($db->error_result) {
                redirect('edit_job', 'job_id='.$_GET['job_id'], '', array(1));
                return true;    
            }
            else {
                redirect('edit_job', 'job_id='.$_GET['job_id'], 'edit_job_description');
                return true;
            } 
        }
        return true;
    }
    
    
    function complete_edit_user_rights() {
        
        if (valid_request(array(isset($_GET['user_id'])))) {
            global $db;
            global $smarty;
    
            if (!isset($_POST['admin'])) {
                $admin_perm = 0;
            }
            else {
                $admin_perm = 1;
            }
    
            if (!isset($_POST['managment'])) {
                $managment_perm = 0;
            }
            else {
                $managment_perm = 1;
            }
    
            if (!isset($_POST['tech'])) {
                $tech_perm = 0;
            }
            else {
                $tech_perm = 1;
            }
    
            $sql = "edit_user_rights(".$_GET['user_id'].",
                                     ".$admin_perm.",
                                     ".$tech_perm.",
                                     ".$managment_perm.")";
            $db->run($sql);
            if ($db->error_result)
                redirect('user_overview', '', '', array(1));
            else {
                redirect('user_overview', '', 'edit_user_rights');
            }    
        }
        return true;
    }
    
    
    function complete_login() {
        if (valid_request(array(isset($_POST['login']), isset($_POST['password'])))) {

            global $db;
            global $smarty;
            
            //getting the name parts
            if (!preg_match('/^[a-zA-Z\x80-\xFF]+\.{1}[a-zA-Z\x80-\xFF]+$/', $_POST['login'])) {
                $smarty->assign('message', 'Ihr Login musst das Format \'Vorname.Nachname\' haben (z.B. Hans.Meier).');
                $smarty->display('login.tpl');
                return true;
            }
            $point_pos = strpos($_POST['login'], ".");
            $first_name = substr($_POST['login'], 0, $point_pos);
            $last_name = substr($_POST['login'], $point_pos + 1);

            //see if we hit the right firstname.lastname - password pair
            $sql = "get_login_data('".$first_name."', '".$last_name."', '".md5($_POST['password'])."')";
            $db->run($sql);
            if (!$db->empty_result) {
                //store the user informations for further actions
                $row = $db->get_result_row();
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['admin_permission'] = $row['admin_permission'];
                $_SESSION['tech_permission'] = $row['tech_permission'];
                $_SESSION['managment_permission'] = $row['managment_permission'];
                $_SESSION['first_name'] = $first_name;
                $_SESSION['last_name'] = $last_name;

                if ($_SERVER['SERVER_PROTOCOL'] == 'HTTP/1.1') {
                    if (php_sapi_name() == 'cgi') {
                        header('Status: 303 See Other ');
                    }
                    else {
                        header('HTTP/1.1 303 See Other ');
                    }
                    header('Location: index.php?site=job_overview');
                }
            }
            else  {
                $smarty->assign('message', 'Ihr Login und ihr Passwort passen nicht zusammen.');
                $smarty->display('login.tpl');
                return true;
            }
        }
        return true;
    }
    
    
    function complete_logout() {

        global $smarty;

        session_unset();
        $_SESSION = array();
        
        $smarty->assign('message', 'Sie haben sich erfolgreich ausgeloggt.');
        $smarty->display('login.tpl');
        
        return true;
    }
    
    
    function complete_reset_cash () {
        if (valid_request(array(isset($_POST['reset_status'])))) {

            global $db;
            global $smarty;

            $db->run('get_cash_total()');
            if ($db->error_result) {
                redirect('cash_overview', '', '', array(1));
                return true;
            }
            $total = $db->get_result_row();

            $sql = "add_cash(".$_SESSION['user_id'].",
                             '',
                             ".(str_replace(',', '.', $_POST['reset_status']) - $total['total']).",
                             'Leeren Kasse')";
            $db->run($sql);
            if ($db->error_result) {
                redirect('cash_overview', '', '', array(1));
                return true;
            }
            else {
                redirect('cash_overview', '', 'add_cash');
                return true;
            }
        }
        return true;
    }
    
    
    function redirect($site, $addition = '', $success = '', $errors = array()) {
    
        $url = "http://".$_SERVER['HTTP_HOST']."/int/index.php?site=".$site;
        
        if ($addition) {
            $url .= "&".$addition;
        }
        if ($errors) {
            $_SESSION['errors'] = $errors;
        }
        if ($success) {
            $_SESSION['success'] = $success;
        } 
        header('Location: '.$url);
    }
 ?>