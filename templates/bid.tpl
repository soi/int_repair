<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Rechnung {$bill_bid_info.job_id}</title>
        <link rel="stylesheet" type="text/css" href="stylesheets/bill_bid.css" />
    </head>
    <body>
        <div id="main" align="left">
            <div id="image" align="right">
                <img src="pics/bill_pic.JPG" border="0" alt="no pic"/>
            </div>
            <div id="address">
               <span class="small3">Matthias Theobald - Sonnemannstra&szlig;e 10 - 97204 H&ouml;chberg</span><br />
               {$bill_bid_info.form_of_address} <br />
               {$bill_bid_info.title_addition} {$bill_bid_info.first_name} {$bill_bid_info.last_name} <br />
               {$bill_bid_info.street} <br /> <br />
               {$bill_bid_info.plz} {$bill_bid_info.town}
            </div>
            <div id="sub_image" align="right">
                EDV-Service und Dienstleistung <br />
                <span class="small2">Steuer Nr.: 257/280/41067</span>
            </div>
            <div id="date_numbers" class="space_right">
                H&ouml;chberg, {$bill_bid_info.date|date_format:"%d.%m.%Y"}<br /><br />
                <div id="numbers_desc">
                    Auftragsnr.: <br />
                    Kundennr.: <br />
                </div>
                <div id="numbers">
                    {$bill_bid_info.job_id} <br />
                    {$bill_bid_info.customer_id}<br />
                </div>
            </div>
            <div id="main_headline" class="big2">
                Kostenvoranschlag
            </div>            
            <div id="bid_text" class="space_right">
                {$bid_text|nl2br}
            </div>
            <div id="thanks_bid">
                
                Mit freundlichen Gr&uuml;&szlig;en
                <br /><br /><br /><br /><br /> <br />
                Matthias Theobald
            </div>
            <div id="footer_wrap_bid" class="small1">
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