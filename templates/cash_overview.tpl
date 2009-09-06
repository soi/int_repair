{literal}
    <script language="javascript" type="text/javascript">
        function update_cash() {
            window.location = 'http://' + window.location.host + '/int/index.php?site=cash_overview&date_start=' + document.getElementById('date_start').value + '&date_limit=' + document.getElementById('date_limit').value;
        }
    </script>
{/literal}

<div class="content_headline">
    <h3>Kassenbuch</h3>
</div>

<div class="content_part" id="print_cash">
    <a href="index.php?site=generate_cash_print&date_start={$date_start}&date_limit={$date_limit}" target="_blank">Druckbare Ansicht</a> <br />
</div>

<div class="content_part">
    <h4>&Uuml;bersicht</h4>
    <div>
        <div id="date_wrap">
            <input type="text" id="date_start" class="date" size="5" name="start_date" value="{$date_start}"/> &nbsp;-&nbsp;
            <input type="text" id="date_limit" class="date" size="5" name="start_date" value="{$date_limit}"/>
            &nbsp;&nbsp;
            <input type="button" value="Zeige" onclick="update_cash()"/>
        </div>
        <div id="reset_wrap" align="right">
            <form action="index.php?site=complete_reset_cash" method="post">
                <input id="reset" type="text" name="reset_status" value="100,00"/>&nbsp;&euro;&nbsp;
                <input type="submit" value="Zur&uuml;cksetzen"/>
            </form>
        </div>
    </div>
    
    <div id="cash_table_wrap">
        <table class="big_table">   
            <th id="description_coloumn">Beschreibung</th>
            <th>Preis in &euro;</th>
            <th>Gesamt in &euro;</th>
            <th>Verk&auml;ufer</th>
            <th>Beleg</th>
            <th>Datum</th>
            {foreach from=$cash item=entry}
                <tr>
                    <td id="description_coloumn">{$entry.description}</td>
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
                    <td>{$entry.date|date_format:"%d.%m.%y %H:%M"}<td>
                </tr>
            {/foreach}
        </table>
    </div>
    
    <br />
    
    <h4>Neuen Kassenbucheintrag hinzuf&uuml;gen</h4>
    <form action="index.php?site=complete_add_cash" method="post">
        <table id="add_cash_table">
            <tr>
                <td>Beschreibung:</td>
                <td><input id="description" type="text" name="description"/></td>
            </tr>
            <tr>
                <td>Preis:</td>
                <td><input id="price" type="text" name="price" size="4"/>&nbsp;&euro;</td>
            </tr>
            <tr>
                <td>Beleg:</td>
                <td><input id="record" type="text" name="record" size="7"/></td>
            </tr>
            <tr>
                <td>Typ:</td>
                <td>Einnahme <input type="radio" name="type" value="in" checked=""/>
                    Ausgabe <input type="radio" name="type" value="out"/>   
                </td>
            </tr>
        </table>
        <input type="submit" value="Eintrag hinzuf&uuml;gen"/>
    </form>
    <br />
</div>