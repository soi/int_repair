<div class="content_headline">
    <h3>Kundendaten Detailansicht</h3>
</div>
<div class="content_part" id="customer_info">
    <b>Name:</b> {$customer_info.form_of_address} {$customer_info.title_addition} {$customer_info.first_name} {$customer_info.last_name} <br />
    <b>Firma:</b> {$customer_info.firm_name} <br />
    <b>Adresse:</b> {$customer_info.street} {$customer_info.plz} {$customer_info.town} <br />
    <b>Tel. 1:</b> {$customer_info.tel_1}  <br />
    <b>Tel. 2:</b> {$customer_info.tel_2}  <br />
    <b>Fax:</b> {$customer_info.fax} <br />
    <b>E-mail:</b> {$customer_info.email} <br /> <br />
    <a href="index.php?site=edit_customer&customer_id={$customer_info.customer_id}">Kontaktdaten bearbeiten</a>  
</div>