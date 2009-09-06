<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/homepage.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/general_content.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/customer.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/user.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/edit_job.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/message.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/cash.css" />
        <script src="javascript/change_rights.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="maincenter" align="center">
            <div id="main" align="left">
                <div id="head">
                    <div id="logo">
                        <img src="pics/logo.JPG" border="0" height="70"  alt="" />
                    </div>
                    <div id="search">
                        {literal}
                            <script language="javascript" type="text/javascript">
                                function show_job() {
                                    if (document.getElementById('job_id').value != '')
                                        window.location = 'http://' + window.location.host + '/int/index.php?site=edit_job&job_id=' + document.getElementById('job_id').value;
                                }
                            </script>
                        {/literal}
                        <input type="text" id="job_id" size="8" value="" />
                        <input type="button" onclick="show_job()" value="Go"/>
                    </div>
                    <div id="stats">
                        <span class="bold">Statistik f&uuml;r heute: &nbsp;&nbsp;&nbsp;{$stats.cur_date|date_format:"%d.%m.%y"}</span><br />
                        <div>                       
                            Neue Auftr&auml;ge:  <br />
                            Auftrags&auml;nderungen: <br />
                            Erbrachte Services: <br />
                            Kassenbucheintr&auml;ge: <br />
                        </div>
                        <div id="values">
                            {$stats.new_jobs} <br />   
                            {$stats.status_added} <br /> 
                            {$stats.services_added} {if $stats.services_added != 0} ({$stats.services_sum|replace:".":"."}&euro;) {/if} <br />
                            {$stats.cash_added} {if $stats.cash_added != 0} ({$stats.cash_sum|replace:".":"."}&euro;) {/if} <br />
                        </div>
                    </div>
                </div>
                
                {literal}
                    <script language="javascript" type="text/javascript">
                        function active_add(button) {
                            document.getElementById(button).src = "pics/addblau.png";
                        }                          
                        function inactive_add(button) {
                            document.getElementById(button).src = "pics/add.png";
                        }  
                    </script>
                {/literal}
                
                
                
                <div id="navi">
                     <ul>
                        <li>
                            <a href="index.php?site=job_overview">Auftr&auml;ge</a>
                            <a class="add" href="index.php?site=add_job"><img id="add1" src="pics/add.png" border="0" height="18"  alt="hinzu" onmouseover="active_add('add1')" onmouseout="inactive_add('add1')"/></a>
                        </li>
                        <li>
                            <a href="index.php?site=customer_overview">Kunden</a>
                            <a class="add" href="index.php?site=add_customer"><img id="add2" src="pics/add.png" border="0" height="18" width="" alt="hinzu" onmouseover="active_add('add2')" onmouseout="inactive_add('add2')"/></a>
                        </li>
                        <li>
                            <a href="index.php?site=user_overview">Mitarbeiter</a>
                            <a class="add" href="index.php?site=add_user"><img id="add3" src="pics/add.png" border="0" height="18" width="" alt="hinzu" onmouseover="active_add('add3')" onmouseout="inactive_add('add3')"/></a>
                        </li>
                        <li>
                            <a href="index.php?site=cash_overview">Kasse</a>
                        </li>
                        <li>
                            <a href="index.php?site=complete_logout">Logout</a>
                        </li>
                    </ul>
                </div>
                <!-- <div id="mid_line"></div>  -->
                <div id="content_main" align="left">
                    <div align="center">
                        {$error_message}
                    </div>
                    <div align="center">
                        {$status_message}
                    </div>
                    <div id="content">
                        {$content}
                    </div>
                    <div id="footer" class="grey_back" align="center">
 
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
