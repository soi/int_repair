<?php 

    function complete_edit_customer() {
        if (valid_request(array(isset($_GET['customer_id']),
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
            display_errors($errors);
            return true;
        }

        $sql = "edit_customer(".$_GET['customer_id'].",
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
        echo $sql;
        $db->run($sql);
        if ($db->error_result)
             display_errors(1);
        else {
            display_success("edit_customer");
            $smarty->assign('content', $smarty->fetch("succes.tpl"));
        }
        return true;    
    }
    
    
    

    function complete_add_customer() {
        if (valid_request(array(isset($_POST['first_name']),
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
            display_errors($errors);
            return true;
        }
        
        $sql = "add_customer('".$_POST['first_name']."',
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
             display_errors(1);
        else {
            display_success("add_customer");
            $smarty->assign('content', $smarty->fetch("succes.tpl"));
        }
        return true;            
    }
    
    
    
    function complete_add_user() {
        if (valid_request(array(isset($_POST['first_name']), 
                                isset($_POST['last_name']),  
                                isset($_POST['password']), 
                                isset($_POST['password_retype'])))) {

            global $db;
            global $smarty;
            
            if ($_POST['password'] != $_POST['password_retype']) {
                display_errors(50);
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
                display_errors(1);
            else {
                display_success("add_user");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
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
                display_errors(1);
            else {
                display_success("edit_user_rights");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }    
        }
        return true;
    }
    
    
    function complete_login() {
        if (valid_request(array(isset($_POST['login']), isset($_POST['password'])))) {

            global $db;
            global $smarty;
            
            //getting the name parts
            if (!preg_match('/^[a-zA-Z]+\.{1}[a-zA-Z]+$/', $_POST['login'])) {
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
                    header('Location: index.php?site=add_user');
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
 ?>