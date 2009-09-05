<div class="content_headline">
    <h3>Nutzerrechte bearbeiten</h3>  
</div>
<div class="content_part" id="edit_user">
    <form action="index.php?site=complete_edit_user_rights&user_id={$user_info.user_id}" method="post">
        <h5>Zugriffsrechte f&uuml;r {$user_info.last_name}, {$user_info.first_name}</h5>
        Administrator <input id="admin" type="checkbox" name="admin" onchange="change_rights_state()" {if $user_info.admin_permission} checked {/if}/>
        Techniker <input id="tech" type="checkbox" name="tech" 
            {if $user_info.tech_permission || $user_info.admin_permission} checked {/if}
            {if $user_info.admin_permission} disabled {/if}/>
        Verwaltung <input id="managment" type="checkbox" name="managment" {if $user_info.managment_permission} checked {/if}
            {if $user_info.managment_permission || $user_info.admin_permission} checked {/if}
            {if $user_info.admin_permission} disabled {/if}/>
        <br />
        <input type="submit" value="Nutzerrechte bearbeiten"/>
    </form>
</div>