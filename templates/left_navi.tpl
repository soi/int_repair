<a href="index.php?site=login">login</a> <br />
<a href="index.php?site=complete_logout">logout</a> <br />  <br />
test
<a href="index.php?site=add_user">add_user</a> <br />
<a href="index.php?site=add_customer">add_cutomer</a> <br /> 
<a href="index.php?site=add_job">add_job</a> <br />   <br />

<a href="index.php?site=cash_overview">cash</a> <br />
<a href="index.php?site=customer_overview">customers</a> <br />
<a href="index.php?site=job_overview">jobs</a> <br />
<a href="index.php?site=user_overview">users</a> <br /> <br />

{literal}
    <script language="javascript" type="text/javascript">
        function show_job() {
            if (document.getElementById('job_id').value != '')
                window.location = 'http://' + window.location.host + '/int/index.php?site=edit_job&job_id=' + document.getElementById('job_id').value;
        }
    </script>
{/literal}
<input type="text" id="job_id" size="5" value="" />
<input type="button" onclick="show_job()" value="Go"/>



