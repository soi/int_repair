<h3>Nutzer bearbeiten</h3>
<form action="index.php?site=complete_edit_user_rights&user_id={$user_info.user_id}" method="post">
    <h5>Zugriffsrechte f&uuml;r {$user_info.last_name}, {$user_info.first_name}</h5>
    Administrator <input type="checkbox" name="admin" {if $user_info.admin_permission} checked {/if}/>
    Techniker <input type="checkbox" name="tech" {if $user_info.tech_permission} checked {/if}/>
    Verwaltung <input type="checkbox" name="managment" {if $user_info.managment_permission} checked {/if}/>    
    <br />
    <input type="submit" value="Nutzer bearbeiten"/>
</form>