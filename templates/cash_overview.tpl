{literal}
    <script language="javascript" type="text/javascript">
        function update_cash() {
            window.location = 'http://' + window.location.host + '/int/index.php?site=cash_overview&date_start=' + document.getElementById('date_start').value + '&date_limit=' + document.getElementById('date_limit').value;
        }
    </script>
{/literal}

<h3>Kassenbuch</h3>
<a href="index.php?site=generate_cash_print&date_start={$date_start}&date_limit={$date_limit}">Druckbare Ansicht</a> <br />
<input type="text" id="date_start" size="5" name="start_date" value="{$date_start}"/> -
<input type="text" id="date_limit" size="5" name="start_date" value="{$date_limit}"/> 

&nbsp;&nbsp;
<input type="button" value="Zeige" onclick="update_cash()"/>
&nbsp;&nbsp;&nbsp;

<form action="index.php?site=complete_reset_cash" method="post">
    <input type="text" name="reset_status" value="100,00"/>&euro;
    <input type="submit" value="Zur&uuml;cksetzen"/>
</form>                 
<br />

<table>   
    <th>Beschreibung</th>
    <th>Preis in &euro;</th>
    <th>Gesamt in &euro;</th>
    <th>Verk&auml;ufer</th>
    <th>Beleg</th>
    <th>Datum</th>
    {foreach from=$cash item=entry}
        <tr>
            <td>{$entry.description}</td>
            <td> {if ($entry.price < 0)} <span style="color: #FF0000;"> 
                 {elseif ($entry.price > 0)} <span style="color: #008900;"> 
                 {else} <span style="color: #333333;">
                 {/if}
                 {$entry.price|replace:".":","}
                 </span> </td>
            <td> {if ($entry.total < 0)} <span style="color: #FF0000;">
                 {elseif ($entry.total > 0)} <span style="color: #008900;">
                 {else} <span style="color: #333333;">
                 {/if}
                 {$entry.total|replace:".":","}
                 </span> </td>
            <td>{$entry.first_name} {$entry.last_name}</td>
            <td>{$entry.record}</td>
            <td>{$entry.date}</td>
        </tr>
    {/foreach}
</table>

<br />

<h5>Neuen Kassenbucheintrag hinzuf&uuml;gen</h5>
<form action="index.php?site=complete_add_cash" method="post">
    Beschreibung:
    <input type="text" name="description"/>
    Preis:
    <input type="text" name="price" size="4"/> &euro; 
    Beleg: 
    <input type="text" name="record" size="7"/><br />
    Einnahme <input type="radio" name="type" value="in" checked=""/>
    Ausgabe <input type="radio" name="type" value="out"/>           <br />
    <input type="submit" value="Eintrag hinzuf&uuml;gen"/>
</form>
<br /><br />