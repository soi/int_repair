<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Rechnung {$bill_info.job_id}</title>
        <link rel="stylesheet" type="text/css" href="stylesheets/bill.css" />
    </head>    
    <body>
        <div id="main" align="left">
            <div id="image" align="right">
                <img src="pics/bill_pic.JPG" border="0" alt="no pic"/>
            </div>  
            <div id="address">
               <span class="small3">Matthias Theobald - Sonnemannstra&szlig;e 10 - 97204 H&ouml;chberg</span><br />
               {$bill_info.form_of_address} <br />
               {$bill_info.title_addition} {$bill_info.first_name} {$bill_info.last_name} <br />
               {$bill_info.street} <br /> <br />
               {$bill_info.plz} {$bill_info.town}                
            </div>
            <div id="sub_image" align="right">
                EDV-Service und Dienstleistung <br />
                <span class="small2">Steuer Nr.: 257/280/41067</span>
            </div>  
            <div id="date_numbers" class="space_right">
                H&ouml;chberg, {$bill_info.date|date_format:"%d.%m.%Y"}<br /><br />
                <div id="numbers_desc">
                    Rechungsnr.: <br />
                    Kundennr.: <br />
                </div>
                <div id="numbers">
                    {$bill_info.job_id} <br />
                    {$bill_info.customer_id}<br />
                </div>
            </div>
            <div id="main_headline" class="big2">
                Rechnung
            </div>
            <div id="services_wrap" class="space_right">
                <table id="service_table" border="1">
                    <tr id="th_tr" >
                        <td id="first_coloumn" class="service_th big1">Bezeichnung</td>
                        <td class="service_th big1">Menge/Stunden</td>
                        <td class="service_th big1">Einzelpreis</th>
                        <td class="service_th big1">Gesamtpreis</th>    
                    </tr>
                    {foreach from=$job_services item=service}
                        <tr>
                            <td class="service_td">{$service.service_name}</td>
                            <td class="service_td amount_cell">{$service.amount}</td>
                            <td class="service_td price_cell">{$service.service_price|replace:".":","}&nbsp;&euro;</td>
                            <td class="service_td price_cell">{$service.total|replace:".":","}&nbsp;&euro;</td>
                        </tr>
                    {/foreach}                    
                </table>        
            </div>
            <div id="total" class="space_right big1">
                Summe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$bill_info.all_total|replace:".":","}&nbsp;&euro;
            </div>
            <div id="thanks">
                Wir danken f&uuml;r ihren Auftrag.
            </div>
            <div id="footer_wrap" class="small1">
                <div class="footer">
                    Matthias Theobald <br />
                    Sonnemannstraße 10<br />
                    97204 Höchberg     <br />
                    matthi@stheobald.de
                </div>
                <div class="footer">
                    Tel. 0160 / 90 110 848 <br />
                    Privattel. 0931 / 4653234<br /> <br />
                    http://shop.ntars.de     <br />
                </div>
                <div class="footer">
                    Raiffeisenbank Höchberg <br />
                    Kto. 3832<br />
                    BLZ 790 631 22 <br /> <br />
                </div>
            </div>
        </div>
    </body>
</html>
