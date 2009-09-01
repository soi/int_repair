<h3>Auftrags&uuml;bersicht</h3>
<h5>Letzte eingegangene Auftr&auml;ge</h5>
{foreach from=$latest_jobs item=job}
    <a href="index.php?site=edit_job&job_id={$job.job_id}">{$job.short_description}</a>
    <br />
    Letzte &Auml;nderung von {$job.user_first_name} {$job.user_last_name}: {$job.status_name} ({$job.last_status_date})
    <br /><br />
{/foreach}

<h5>Letzte &Auml;nderungen an Auftr&auml;gen</h5>
{foreach from=$jobs_latest_changes item=change}
    <a href="index.php?site=edit_job&job_id={$change.job_id}">{$change.short_description}</a>
    <br />
    Letzte &Auml;nderung von {$change.user_first_name} {$change.user_last_name}: {$change.status_name} ({$change.last_status_date})
    <br /><br />
{/foreach}