function change_rights_state () {
    if (!document.getElementById('admin').checked) {
        document.getElementById('tech').disabled = false;
        document.getElementById('managment').disabled = false;
        document.getElementById('tech').checked = false;
        document.getElementById('managment').checked = false;
    }
    else {
        document.getElementById('tech').disabled = true;
        document.getElementById('managment').disabled = true;
        document.getElementById('tech').checked = true;
        document.getElementById('managment').checked = true;
    }
}

        