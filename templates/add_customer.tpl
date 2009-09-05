<div class="content_headline">
    <h3>Kunden hinzufügen</h3>
</div>
<div class="content_part" id="add_customer">
    <form action="index.php?site=complete_add_customer" method="post">
        <h5>Anrede</h5>
        <select name="form_of_address">
            <option value="Herr">Herr</option>
            <option value="Frau">Frau</option>
        </select>
        <h5>Name</h5>
        <input type="text" name="last_name"/>
        <h5>Vorname</h5>
        <input type="text" name="first_name"/>
        <br />
        <h5>Zusatztitel</h5>
        <input type="text" name="title_addition" size="10"/>
        <br />
        <h5>Firma</h5>
        <input type="text" name="firm_name"/>
        <br /> 
        <h5>Strasse mit Hausnummer</h5>
        <input type="text" name="street"/>
        <br />
        <h5>Postleitzahl</h5>
        <input type="text" name="plz"/>
        <br />
        <h5>Ortsname</h5>
        <input type="text" name="town"/>
        <br />
        <h5>Telefonummer 1</h5>
        <input type="text" name="tel_1"/>
        <br />
        <h5>Telefonummer 2</h5>
        <input type="text" name="tel_2"/>
        <br />
        <h5>Fax</h5>
        <input type="text" name="fax"/>
        <br />
        <h5>E-Mail </h5>
        <input type="text" name="email"/>
        <br />
        <input type="submit" value="Kunden hinzuf&uuml;gen"/>
    </form>
</div>
