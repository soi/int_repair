<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Kassenbeleg f&uuml;r {$cash_print_info.date_limit}-{$cash_print_info.date_start}</title>
        <link rel="stylesheet" type="text/css" href="stylesheets/cash_print.css" />
    </head>
    <body>
        <div id="main">
            <div id="head">
                <span class="italic small1">{$cash_print_info.cur_date|date_format:"%d.%m.%Y %H:%M"} </span> <br /> 
                <span class="italic big2">Kassenbuch</span> <br />
            </div>
            <div id="general">
                <span class="bold">Datum von-bis: </span>&nbsp;&nbsp;{$cash_print_info.date_limit}&nbsp;-&nbsp;{$cash_print_info.date_start} <br />
                <span class="bold">&Uuml;bertrag: </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {$cash_print_info.carry|replace:".":","} &euro; <br />
            </div>
            <br />
            <div>
                <table id="table" border="1">
                    <tr id="th_tr" >
                        <td class="th bold">Datum</td>
                        <td class="th bold">Beleg</td>
                        <td class="th bold">Vorgang</th>
                        <td class="th bold">MwSt. %</th>
                        <td class="th bold">Einahmen</th>
                        <td class="th bold">Ausgaben</th>
                        <td class="th bold">Konto</th>
                    </tr>
                    <tr>
                        <td class="td"></td>
                        <td class="td"></td>
                        <td class="td"><span class="italic bold">&Uuml;bertrag</span></td>
                        <td class="td"></td>
                        <td class="td"></td>
                        <td class="td"></td>
                        <td class="td price_cell">{$cash_print_info.carry|replace:".":","} </td>    
                    </tr>
                    {foreach from=$cash_print item=cash}
                        <tr>
                            <td class="td">{$cash.date|date_format:"%d.%m.%y"}</td>
                            <td class="td record_cell">{$cash.record}</td>
                            <td class="td desc_cell">{$cash.description}</td>
                            <td class="td"></td>
                            <td class="td price_cell">{if $cash.price >= 0} {$cash.price|replace:".":","}  {/if}</td>
                            <td class="td price_cell">{if $cash.price < 0} {$cash.price|replace:".":","}  {/if}</td>
                            <td class="td price_cell">{$cash.account|replace:".":","} </td>
                        </tr>
                    {/foreach}
                    <tr>
                        <td class="fill_row"></td>
                        <td class="fill_row"></td>
                        <td class="fill_row"></td>
                        <td class="fill_row"></td>
                        <td class="fill_row"></td>
                        <td class="fill_row"></td>
                        <td class="fill_row"></td>
                    </tr>
                    <tr>
                        <td class="td"></td>
                        <td class="td"></td>
                        <td class="td"><span class="italic">Summen</span></td>
                        <td class="td"></td>
                        <td class="td price_cell"><span class="bold">{$cash_print_info.in_total|replace:".":","} </span></td>
                        <td class="td price_cell"><span class="bold">{$cash_print_info.out_total|replace:".":","} </span></td>
                        <td class="td"></td>
                    </tr>
                    <tr>
                        <td class="td"></td>
                        <td class="td"></td>
                        <td class="td"><span class="italic">Ausgaben</span></td>
                        <td class="td"></td>
                        <td class="td price_cell"><span class="bold">{$cash_print_info.out_total|replace:".":","} </span></td>
                        <td class="td"></td>
                        <td class="td"></td>
                    </tr>
                    <tr>
                        <td class="final_row"></td>
                        <td class="final_row"></td>
                        <td class="final_row"><span class="bold">Bestand</span></td>
                        <td class="final_row"></td>
                        <td class="final_row price_cell final_cell"><span class="bold">{$cash_print_info.total|replace:".":","} </span></td>
                        <td class="final_row"></td>
                        <td class="final_row"></td>
                    </tr>
                    
                </table>
            </div>
        </div>        
    </body>
</html>