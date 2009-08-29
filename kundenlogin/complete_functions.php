<?php 
    
    function complete_add_email() {
        if (valid_request(array(isset($_POST['title']),
                                isset($_POST['email']),
                                isset($_POST['text'])))) {

            global $smarty;
            
            if (!mail('fstiehler@yahoo.de',
                 "Interface Mail: ".$_POST['title'], 
                 $_SESSION['last_name'].", ".$_SESSION['first_name']." (".$_SESSION['customer_id'].") schreibt: \r\n\r\n".$_POST['text'], 
                 "From: ".$_POST['email']."\r\nReply-To: ".$_POST['email']."")) {
                 
                display_errors(50);
                return true;                         
            } 
            redirect('jobs', '', 'add_email');          
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
            $sql = "get_customer_login_data('".$first_name."', '".$last_name."', '".$_POST['password']."')";
            $db->run($sql);
            if (!$db->empty_result) {
                //store the user informations for further actions
                $row = $db->get_result_row();
                $_SESSION['customer_id'] = $row['customer_id'];
                $_SESSION['form_of_address'] = $row['form_of_address'];
                $_SESSION['first_name'] = $first_name;
                $_SESSION['last_name'] = $last_name;

                if ($_SERVER['SERVER_PROTOCOL'] == 'HTTP/1.1') {
                    if (php_sapi_name() == 'cgi') {
                        header('Status: 303 See Other ');
                    }
                    else {
                        header('HTTP/1.1 303 See Other ');
                    }
                    header('Location: index.php?site=jobs');
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
    
    
    function redirect($site, $addition = '', $success = '', $errors = array()) {
    
        $url = "http://".$_SERVER['HTTP_HOST']."/int/kundenlogin/index.php?site=".$site;
        
        if ($addition) {
            $url .= "&".$addition;
        }
        if ($errors) {
            $url .= "&errors=".implode(',', $errors);
        }
        if ($success) {
            $url .= "&success=".$success;
        } 
        header('Location: '.$url);
    }
 ?>