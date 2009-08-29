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
        <h3>Kundenlogin</h3>
        <form action="index.php?site=complete_login" method="post">
            <h5>Ihr Login (Vorname.Nachname)</h5>
            <input type="text" name="login"/>
            <h5>Ihre Kundennummer</h5>
            <input type="password" name="password"/>
            <br />
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>

