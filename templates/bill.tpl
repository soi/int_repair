<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Rechnung {$bill_info.job_id}</title>
        <link rel="stylesheet" type="text/css" href="stylesheets/bill.css" />
        <link rel="stylesheet" type="text/css" href="stylesheets/general.css" />
    </head>    
    <body>
        <div id="main" align="left">
            <div id="image" align="right">
                <img src="pics/bill_pic.jpg" border="0" alt="no pic"/>
            </div>  
            <div id="address">
               <span class="small3">Matthias Theobald - Sonnemannstra&szlig;e 10 - 97204 H&ouml;chberg</span><br />
               {$customer_info.form_of_address} <br />
               {$customer_info.title_addition} {$customer_info.first_name} {$customer_info.last_name} <br />
               {$customer_info.street} <br /> <br />
               {$customer_info.plz} {$customer_info.town}                
            </div>
            <div id="sub_image" align="right">
                EDV-Service und Dienstleistung <br />
                <span class="small2">Steuer Nr.: 257/280/41067</span>
            </div>  
            <div id="date_numbers" class="space_right">
                H&ouml;chberg, {$bill_info.date}<br /><br />
                <span class="small1">Rechungsnr.: {$bill_info.job_id}</span> <br />
                <span class="small1">Kundennr.: {$customer_info.customer_id}</span> <br />
                 <br />                    
            </div>
            <div id="main_headline">
                <span class="big2">Rechnung</span>
            </div>
            <div id="services_wrap" class="space_right">
                <table id="service_table" border="1">
                    <tr id="th_tr">
                        <td id="first_coloumn" class="service_th big1">Bezeichnung</td>
                        <td class="service_th"><span class="big1">Menge/Stunden</span></td>
                        <td class="service_th"><span class="big1">Einzelpreis</span></th>
                        <td class="service_th"><span class="big1">Gesamtpreis</span></th>    
                    </tr>
                    {foreach from=$job_services item=service}
                        <tr>
                            <td class="service_td">{$service.service_name}</td>
                            <td class="service_td amount_cell">{$service.amount}</td>
                            <td class="service_td price_cell">{$service.service_price}&euro;</td>
                            <td class="service_td price_cell">{$service.total}&euro;</td>
                        </tr>
                    {/foreach}                    
                </table>        
            </div>
        </div>
    </body>
</html>
