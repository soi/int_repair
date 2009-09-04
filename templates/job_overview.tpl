<div class="content_headline">
    <h3>Auftrags&uuml;bersicht</h3> 
</div>
<div class="content_part">
    <h4>Letzte eingegangene Auftr&auml;ge</h4>
    {foreach from=$latest_jobs item=job}
        <h5><a href="index.php?site=edit_job&job_id={$job.job_id}">{$job.short_description}</a> </h5>
        Letzte &Auml;nderung von {$job.user_first_name} {$job.user_last_name}: {$job.status_name} ({$job.last_status_date|date_format:"%d.%m.%y %H:%M"})
        <br /><br />
    {/foreach}
</div>

<div class="content_part">
    <h4>Letzte &Auml;nderungen an Auftr&auml;gen</h4>
    {foreach from=$jobs_latest_changes item=change}
        <h5><a href="index.php?site=edit_job&job_id={$change.job_id}">{$change.short_description}</a> </h5>
        Letzte &Auml;nderung von {$change.user_first_name} {$change.user_last_name}: {$change.status_name} ({$change.last_status_date|date_format:"%d.%m.%y %H:%M"})
        <br /><br />
    {/foreach}
</div>