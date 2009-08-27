<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
    </head>
    <body>
        {if $message}
            <br />
            <p>
                {$message }       
            </p>
            <br />
        {/if}
        <h3>Login</h3>
        <form action="index.php?site=complete_login" method="post">
            <h5>Login</h5>
            <input type="text" name="login"/>
            <h5>Password</h5>
            <input type="password" name="password"/>
            <br />
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>

