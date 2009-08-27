<h3>Nutzer &Uuml;bersicht</h3>
{foreach from=$users item=user}
    <b>{$user.last_name}, {$user.first_name}</b>
    <br />
    Status: 
    {if $user.admin_permission} Administrator 
    {else} 
        {if $user.tech_permission} Techniker {/if}
        {if $user.managment_permission} Verwaltung {/if}
    {/if}
    {if $visitor_info.admin_permission} <a href="index.php?site=edit_user_rights&user_id={$user.user_id}">Rechte bearbeiten</a> {/if}
    <br />
    <br />
{/foreach}