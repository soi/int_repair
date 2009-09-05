<div class="content_headline">
    <h3>Letzte Autragseing&auml;nge</h3>
</div>
<div class="content_part">
    {foreach from=$latest_jobs item=job}
        <h5><a href="index.php?site=edit_job&job_id={$job.job_id}">{$job.short_description}</a> </h5>
        Letzte &Auml;nderung von {$job.user_first_name} {$job.user_last_name}: <span class="ital">{$job.status_name}</span>
        <span style="font-size: 0.9em">
            ({$job.last_status_date|date_format:"%d.%m %H:%M"})
        </span>
        <br />
        <a href="index.php?site=edit_job&job_id={$job.job_id}">> Details</a>
        <br />
        <br />
    {/foreach}
    <div class="previous">
        {if $latest_jobs_info.start > 0}
            <a href="index.php?site=latest_jobs&start={$latest_jobs_info.start-10}&limit=10">zur&uuml;ck</a>
        {/if}
    </div>
    <div class="next">
        {if $latest_jobs_info.count > $latest_jobs_info.start+10}
            <a href="index.php?site=latest_jobs&start={$latest_jobs_info.start+10}&limit=10">mehr</a>
        {/if}
    </div>
</div>