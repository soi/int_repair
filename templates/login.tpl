<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/login.css" />
    </head>
    <body>
        <div align="center">
            <div align="left" id="main">
                {if $message}
                <br />
                    <p>
                        {$message }
                    </p>
                <br />
                {/if}
                <h3>Login</h3>
                <br />
                <form action="index.php?site=complete_login" method="post">
                    <h5>Name</h5>
                    <input type="text" name="login"/>
                    <h5>Password</h5>
                    <input type="password" name="password"/>
                    <br />
                    <br />
                    <input type="submit" value="Login"/>
                </form>
            </div>
        </div>        
    </body>
</html>

