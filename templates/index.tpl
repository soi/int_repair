<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/homepage.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/general_content.css" />
    </head>
    <body>
        <div id="maincenter" align="center">
            <div id="main" align="left">
                <div id="head">
                    <div id="logo">
                        <img src="pics/logo.jpg" border="0" height="70"  alt="" />
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
                <div id="navi">
                     {$left_navi}
                </div>
                <div id="mid_line"></div>
                <div id="content_main" align="left">
                    <div id="error_message_wrap" align="center">
                        {$error_message}
                    </div>
                    <div id="status_message_wrap" align="center">
                        {$status_message}
                    </div>
                    <div id="content">
                        {$content}
                    </div>
                    <div id="footer" class="grey_back" align="center">
                        {$footer}
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
