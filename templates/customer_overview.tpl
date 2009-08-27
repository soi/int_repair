<h3>Kunden &Uuml;bersicht</h3>
{foreach from=$customers item=customer}
    <b>{$customer.last_name}, {$customer.first_name}</b>
    <br />
    {if $customer.firm_name}
        Firma: {$customer.firm_name}
        <br />
    {/if}
    {if $customer.town}
        Aus: {$customer.town}
        <br />
    {/if}
    <a href="index.php?site=customer_info&customer_id={$customer.customer_id}">Kontaktdaten ansehen</a>
    <a href="index.php?site=edit_customer&customer_id={$customer.customer_id}">Kontaktdaten bearbeiten</a>  
    <br /><br />  
{/foreach}