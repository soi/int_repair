<h3>Kundendaten bearbeiten</h3>
<form action="index.php?site=complete_edit_customer&customer_id={$customer_info.customer_id}" method="post">
    <h5>Anrede</h5>
    <select name="form_of_address">
        <option value="Herr" {if $customer_info.form_of_address == 'Herr'} selected {/if}>Herr</option>
        <option value="Frau" {if $customer_info.form_of_address == 'Frau'} selected {/if}>Frau</option>
    </select>
    <h5>Name</h5>
    <input type="text" name="last_name" value="{$customer_info.last_name}"/>
    <h5>Vorname</h5>
    <input type="text" name="first_name" value="{$customer_info.first_name}"/>
    <br />
    <h5>Zusatztitel</h5>
    <input type="text" name="title_addition" size="10" value="{$customer_info.title_addition}"/>
    <br />
    <h5>Firma</h5>
    <input type="text" name="firm_name" value="{$customer_info.firm_name}"/>
    <br />
    <h5>Strasse mit Hausnummer</h5>
    <input type="text" name="street" value="{$customer_info.street}"/>
    <br />
    <h5>Postleitzahl</h5>
    <input type="text" name="plz" value="{$customer_info.plz}"/>
    <br />
    <h5>Ortsname</h5>
    <input type="text" name="town" value="{$customer_info.town}"/>
    <br />
    <h5>Telefonummer 1</h5>
    <input type="text" name="tel_1" value="{$customer_info.tel_1}"/>
    <br />
    <h5>Telefonummer 2</h5>
    <input type="text" name="tel_2" value="{$customer_info.tel_2}"/>
    <br />
    <h5>Fax</h5>
    <input type="text" name="fax" value="{$customer_info.fax}"/>
    <br />
    <h5>E-Mail </h5>
    <input type="text" name="email" value="{$customer_info.email}"/>
    <br />
    <input type="submit" value="Kundendaten bearbeiten"/>
</form>
