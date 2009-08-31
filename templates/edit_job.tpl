<h3>Autragsdetails</h3>
<h5>Generelle Informationen</h5>
Beschreibung: {$job_info.short_description} <br />
Auftragseingang: {$job_info.date} <br />
Kostenvoranschlag gew&uuml;nscht: {$job_info.bid_needed} <br />
Rechnung erstellt: {$job_additional_info.bill_created} <br />
Bezahlt: {$job_additional_info.paid} <br />
Beended: {$job_additional_info.finished} <br />




<h5>Details des Auftragsgebers zum Zeitpunkt des Auftrags</h5>
<b>Name:</b> {$job_info.c_title_addition} {$job_info.c_last_name}, {$job_info.c_first_name} <br />
<b>Firma:</b> {$job_info.c_firm_name} <br />
<b>Adresse:</b> {$job_info.c_street} {$job_info.c_plz} {$job_info.c_town} <br />
<b>Telefonnummer 1:</b> {$job_info.c_tel_1}  <br />
<b>Telefonnummer 2:</b> {$job_info.c_tel_2}  <br />
<b>Fax:</b> {$job_info.c_fax} <br />
<b>E-mail:</b> {$job_info.c_email} <br />
{if $job_additional_info.customer_listed} 
<a href="index.php?site=customer_info&customer_id={$job_info.customer_id}">Heutige Kontaktdaten ansehen</a>
{else}
Der Kunde wird nicht mehr gef&uuml;hrt.
{/if}
<br /><br />




<h5>Auftragsdetails</h5>
<p>
    Beschreibung: {$job_info.description} <br />
</p> <br />

<h5>Auftragsstatus</h5>
<table>
    <th>Status</th>
    <th>Datum</th>
    <th>Bearbeiter</th>
    <th>Bemerkung</th>
    {foreach from=$job_status item=status}    
        <tr>
            <td>{$status.status_name}</td>
            <td>{$status.date}</td>  
            <td>{$status.first_name} {$status.last_name}</td> 
            <td>{$status.description}</td> 
        </tr>
    {/foreach}
</table>
<br />

<h5>Neuen Status hinzuf&uuml;gen</h5>
<form action="index.php?site=complete_add_status&job_id={$job_info.job_id}" method="post">
    Status:
    <select name="type_id">
        <option value="0">Bitte ausw&auml;hlen..</option>
        {foreach from=$job_status_types item=type}
            <option value="{$type.type_id}">{$type.name}</option>
        {/foreach}
    </select>
    Bemerkung:
    <input type="text" name="description"/><br />
    <input type="submit" value="Status hinzuf&uuml;gen"/>
</form>
<br /><br />





<h5>Erbrachte Services</h5>
<table>
    <th>Service</th>
    <th>Preis</th>
    <th>Menge</th>
    <th>Datum</th>
    <th>Bearbeiter</th>
    <th>Bemerkung</th>
    {foreach from=$job_services item=service}
        <tr>
            <td>{$service.service_name}</td>
            <td>{$service.service_price|replace:".":","}</td>
            <td>{$service.amount}</td>
            <td>{$service.date}</td>
            <td>{$service.first_name} {$service.last_name}</td>
            <td>{$service.description}</td>
        </tr>
    {/foreach}
</table>
<br />

{literal}
<script language="javascript" type="text/javascript">
    function update_service_price() {
        var price_field = document.getElementById('real_price');
        var type_field = document.getElementById('service_type');

        price_field.value = type_field.value.slice(type_field.value.indexOf('&') + 1);
        
        return;
    }
</script>
{/literal}


<h5>Neuen Service hinzuf&uuml;gen</h5>
<form action="index.php?site=complete_add_service&job_id={$job_info.job_id}" method="post">
    Service:
    <select id="service_type" name="type_id" onchange="update_service_price()">
        <option value="0">Bitte ausw&auml;hlen..</option>
        {foreach from=$job_service_types item=type}
            <option value="{$type.type_id}&{$type.price|replace:".":","}">{$type.name}</option>
        {/foreach}
    </select>
    oder neuen Service anlegen: 
    <input type="text" name="custom_type"/>
    Preis:
    <input id="real_price" name="price" size="6"/> &euro;
    Menge:
    <input name="amount" size="2" value="1"/>
    Bemerkung:
    <input type="text" name="description"/> <br />
    <input type="submit" value="Service hinzuf&uuml;gen"/>
</form>
<br /><br />

<a href="index.php?site=generate_bill&job_id={$job_info.job_id}" target="_blank">Rechnung erzeugen</a>




    
    
    
    