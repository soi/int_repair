<h3>Generelle &Uuml;bersicht</h3>
<h5>Letzte eingegangene Auftr&auml;ge</h5>
{foreach from=$latest_jobs item=job}
    <a href="index.php?site=edit_job&job_id={$job.job_id}">{$job.description}</a>
    <br />
    Letzte &Auml;nderung von {$job.user_first_name} {$job.user_last_name}: {$job.status_name} ({$job.last_status_date})
    <br /><br />
{/foreach}