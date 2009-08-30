<h3>Kassenbuch</h3>
<table>
    <th>Beschreibung</th>
    <th>Preis in &euro;</th>
    <th>Gesamt in &euro;</th>
    <th>Verk&auml;ufer</th>
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
    <input type="submit" value="Eintrag hinzuf&uuml;gen"/>
</form>
<br /><br />