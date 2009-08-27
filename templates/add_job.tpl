<h3>Auftrag hinzufügen</h3>
<form action="index.php?site=complete_add_job" method="post">
    <h5>Kurze Beschreibung</h5>
    <input type="text" name="short_desc"/>
    <h5>Ausführliche Beschreibung</h5>
    <textarea name="long_desc"></textarea>
    <h5>Kunde</h5>
    <select name="customer_id">
        {foreach from=$customers item=customer}
            <option value="{$customer.customer_id}">{$customer.first_name} {$customer.last_name}</option>
        {/foreach}
    </select>
    <br />
    <input type="submit" value="auftrag hinzuf&uuml;gen"/>
</form>