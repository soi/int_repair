<div class="content_headline">
    <h3>Nutzer hinzufügen</h3>
</div>
<div class="content_part" id="add_user">
    <form action="index.php?site=complete_add_user" method="post">
        <h5>Name</h5>
        <input type="text" name="last_name"/>
        <h5>Vorname</h5>
        <input type="text" name="first_name"/>
        <h5>Zugriffsrechte</h5>
        Administrator <input id="admin" type="checkbox" name="admin" onchange="change_rights_state()"/>
        Techniker <input id="tech" type="checkbox" name="tech"/>
        Verwaltung <input id="managment" type="checkbox" name="managment"/>
        <h5>Password</h5>
        <input type="password" name="password"/>
        <h5>Password wiederholen</h5>
        <input type="password" name="password_retype"/>
        <br />
        <input type="submit" value="Nutzer hinzuf&uuml;gen"/>
    </form> 
</div>