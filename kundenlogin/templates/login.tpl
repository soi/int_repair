<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/login.css" />
    </head>
    <body>
        <div align="center">
            <div align="left" id="main">
                <div>
                    <img src="pics/head.png" border="0" height="" width="" alt="" />
                </div>
                {if $message}
                <br />
                    <p>
                        {$message }
                    </p>
                <br />
                {/if}
                <form action="index.php?site=complete_login" method="post">
                    <div id="login_fields">
                        <div id="name">
                            <h5>Login</h5>
                            <input type="text" name="login"/>
                        </div>
                        <div id="password">
                            <h5>Kundennummer</h5>
                            <input type="password" name="password"/>
                        </div>
                        <input type="submit" value="Login"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

