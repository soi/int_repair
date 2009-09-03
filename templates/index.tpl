<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/homepage.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/forms.css" />
    </head>
    <body>
        <div id="maincenter" align="center">
            <div id="main" align="left">
                <div id="head">
                    <div id="logo">
                        <img src="pics/logo.jpg" border="0" height="70"  alt="" />
                    </div>
                    <div id="date">
                        {$stats.cur_date|date_format:"%d.%m.%y"}   
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
                    
                    </div>
                </div>
                <div id="mid_line"></div>
                <div id="left_navi" class="content_padding_top grey_back" >
                    {$left_navi}
                </div>
                <div id="content_main" class="content_padding_top grey_back" align="left">
                    <div id="error_message_wrap" align="center">
                        {$error_message}
                    </div>
                    <div id="status_message_wrap" align="center">
                        {$status_message}
                    </div>
                    <div id="content_wrap">
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
