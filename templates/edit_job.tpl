<div class="content_headline">
    <h3>Autragsdetails</h3>
</div>

<div class="content_part one_line_content" >
    <a href="index.php?site=generate_bill&job_id={$job_info.job_id}" target="_blank">Rechnung erzeugen</a>
</div>

{literal}
    <script language="javascript" type="text/javascript">
        function set_bid_visibility() {
            document.getElementById('bid_link').style.display="none";
            document.getElementById('bid_headline').style.display="block";
            document.getElementById('bid_text').style.display="block";
            document.getElementById('finish_bid_button').style.display="inline";
            document.getElementById('cancel_bid_button').style.display="inline";
            document.getElementById('generate_bid').style.padding="5px 40px 15px";
        }

        function set_normal_bid_visibility() {
            document.getElementById('bid_link').style.display="block";
            document.getElementById('bid_headline').style.display="none";
            document.getElementById('bid_text').style.display="none";
            document.getElementById('finish_bid_button').style.display="none";
            document.getElementById('cancel_bid_button').style.display="none";
            document.getElementById('generate_bid').style.padding="5px 40px";
        }
    </script>
{/literal}

<div id="generate_bid" class="content_part one_line_content">
    <a id="bid_link" href="#" onclick="set_bid_visibility(); return false;">KV erzeugen</a>

        <h4 id="bid_headline" style="display: none;">KV Beschreibung</h4>
        <form action="index.php?site=generate_bid&job_id={$job_info.job_id}" method="post" target="_blank">
            <textarea id="bid_text" name="bid_text" style="display: none;"></textarea>
            <input id="finish_bid_button" type="submit" style="display: none;" value="KV anzeigen"/>
            <input id="cancel_bid_button" type="button" style="display: none;" value="abbrechen" onclick="set_normal_bid_visibility()"/>
        </form>
</div>

<div class="content_part" id="job_general_info">
    <h4>Generelle Informationen</h4>
    <table class="small_table">
        <tr>
            <td id="left"><span class="bold">Beschreibung:</span></td>
            <td id="right">{$job_info.short_description}</td>
        </tr> 
        <tr>
            <td><span class="bold">Auftragseingang:</span></td>
            <td>{$job_info.date|date_format:"%d.%m.%y %H:%M"}</td>
        </tr> 
        <tr>
            <td><span class="bold">Auftragsnummer:</span></td>
            <td>{$job_info.job_id}</td>
        </tr>
        <tr>
            <td><span class="bold">KV gew&uuml;nscht:</span></td>
            <td>{if $job_info.bid_needed} ja
                {else} nein
                {/if}
            </td>
        </tr>
        {if $job_info.bid_needed}
            <tr>
                <td><span class="bold">KV erstellt:</span></td>
                <td>{if $job_additional_info.bid_created} <img src="pics/accept.png" border="0" height="" width="" alt="" />
                     {else}  <img src="pics/cancel.png" border="0" height="" width="" alt="" />
                     {/if}
                </td>
            </tr>
        {/if}
        <tr>
            <td><span class="bold">Rechnung erstellt:</span></td>
            <td>{if $job_additional_info.bill_created} <img src="pics/accept.png" border="0" height="" width="" alt="" />
                 {else}  <img src="pics/cancel.png" border="0" height="" width="" alt="" />
                 {/if}
            </td>
        </tr>
        <tr>
            <td><span class="bold">Bezahlt:</span></td>
            <td>{if $job_additional_info.paid} <img src="pics/accept.png" border="0" height="" width="" alt="" />
                 {else}  <img src="pics/cancel.png" border="0" height="" width="" alt="" />
                 {/if}
            </td>
        </tr>
        <tr>
            <td><span class="bold">Beended:</span></td>
            <td> {if $job_additional_info.finished} <img src="pics/accept.png" border="0" height="" width="" alt="" />
                 {else}  <img src="pics/cancel.png" border="0" height="" width="" alt="" />
                 {/if}
            </td>
        </tr>         
    </table>
</div>

<div class="content_part" id="job_customer_info">
    <h4>Details des Auftragsgebers zum Zeitpunkt des Auftrags</h4>
    <div id="left">
        <span class="bold">Name:</span> <br />
        <span class="bold">Firma:</span> <br />
        <span class="bold">Strasse:</span> <br />
        <span class="bold">Ort:</span> <br />        
        <span class="bold">Tel. 1:</span>  <br />
        <span class="bold">Tel. 2:</span>  <br />
        <span class="bold">Fax:</span>  <br />
        <span class="bold">E-mail:</span> <br /> <br />
    </div>
    <div id="right">
        {$job_info.c_title_addition} {$job_info.c_last_name}, {$job_info.c_first_name} <br />
        {$job_info.c_firm_name} <br />
        {$job_info.c_street} <br />
        {$job_info.c_plz} {$job_info.c_town} <br />
        {$job_info.c_tel_1}  <br />
        {$job_info.c_tel_2}  <br />
        {$job_info.c_fax} <br />
        {$job_info.c_email} <br /> <br />
    </div>
    <div id="customer_today">
        {if $job_additional_info.customer_listed}
        <a href="index.php?site=customer_info&customer_id={$job_info.customer_id}">Heutige Kontaktdaten ansehen</a>
        {else}
        Der Kunde wird nicht mehr gef&uuml;hrt.
        {/if}
    </div>
    
</div>




{literal}
    <script language="javascript" type="text/javascript">
        function set_edit_visibility() {
            document.getElementById('job_description').style.display="none";    
            document.getElementById('edit_description_button').style.display="none";    
            document.getElementById('edit_description_field').style.display="block";    
            document.getElementById('finish_edit_description_button').style.display="inline";    
            document.getElementById('cancel_button').style.display="inline";    
        } 
        
        function set_normal_visibility() {
            document.getElementById('job_description').style.display="block";
            document.getElementById('edit_description_button').style.display="inline";
            document.getElementById('edit_description_field').style.display="none";
            document.getElementById('finish_edit_description_button').style.display="none";
            document.getElementById('cancel_button').style.display="none";
        }   
    </script>

{/literal}



<div class="content_part" id="job_description_wrap">
    <h4>Auftragsdetails</h4>
    <div id="job_description">
        {$job_info.description|nl2br}
    </div>
    <a href="#" id="edit_description_button" onclick="set_edit_visibility(); return false;">bearbeiten</a>
    
    
    
    <form action="index.php?site=complete_edit_job_description&job_id={$job_info.job_id}" method="post">
        <textarea id="edit_description_field" name="description" style="display: none;">{$job_info.description}</textarea> 
        <input id="finish_edit_description_button" type="submit" style="display: none;" value="speichern"/>
        <input id="cancel_button" type="button" style="display: none;" value="abbrechen" onclick="set_normal_visibility()"/>
    </form>    
    
</div>


<div class="content_part" id="job_status">    
    <h4>Auftragsstatus</h4>
    <table id="status_table" class="big_table">
        <th id="description">Status</th>
        <th>Datum</th>
        <th>Bearbeiter</th>
        <th>Bemerkung</th>
        {foreach from=$job_status item=status}    
            <tr>
                <td>{$status.status_name}</td>
                <td>{$status.date|date_format:"%d.%m.%y %H:%M"}</td>  
                <td>{$status.first_name} {$status.last_name}</td> 
                <td>{$status.description}</td>
                <td><a href="index.php?site=complete_delete_job_status&job_status_id={$status.job_status_id}&job_id={$job_info.job_id}"><img src="pics/delete.jpg" border="0" height="16"/></a></td> 
            </tr>
        {/foreach}
    </table>
    <br />
    
    <h4>Neuen Status hinzuf&uuml;gen</h4>
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
    <br />
</div>




<div class="content_part" id="job_services">
    <h4>Erbrachte Services</h4>
    <table id="services_table" class="big_table">
        <th id="description">Service</th>
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
                <td>{$service.date|date_format:"%d.%m.%y %H:%M"}</td>
                <td>{$service.first_name} {$service.last_name}</td>
                <td>{$service.description}</td>
                <td><a href="index.php?site=complete_delete_job_service&job_service_id={$service.job_service_id}&job_id={$job_info.job_id}"><img src="pics/delete.jpg" border="0" height="16"/></a></td>
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
    
    
    <h4>Neuen Service hinzuf&uuml;gen</h4>
    <form action="index.php?site=complete_add_service&job_id={$job_info.job_id}" method="post">
         <table id="add_service_table" class="small_table">
            <tr>
                <td id="left">Service:</td> 
                <td><select id="service_type" name="type_id" onchange="update_service_price()">
                    <option value="0">Bitte ausw&auml;hlen..</option>
                    {foreach from=$job_service_types item=type}
                        <option value="{$type.type_id}&{$type.price|replace:".":","}">{$type.name}</option>
                    {/foreach}
                    </select>
                    oder neuen Service anlegen:
                    <input type="text" name="custom_type"/>
                </td>
            <tr>
                 <td>Preis: </td>
                 <td><input id="real_price" name="price" size="6"/> &euro;</td> 
            </tr>
            <tr>
                <td>Menge: </td>
                <td><input name="amount" size="2" value="1"/></td>
            </tr>
            <tr>
                <td>Bemerkung:</td>
                <td><input type="text" name="description"/></td>
            </tr>
         </table> 
        <input type="submit" value="Service hinzuf&uuml;gen"/>
    </form>
    <br />
</div>









    
    
    
    