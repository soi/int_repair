<div class="content_headline">
    <h3>Letzte Autrags&auml;nderungen</h3>
</div>
<div class="content_part">
    {foreach from=$jobs_latest_changes item=change}
        <h5><a href="index.php?site=edit_job&job_id={$change.job_id}">{$change.short_description}</a> </h5>
        Letzte &Auml;nderung von {$change.user_first_name} {$change.user_last_name}: <span class="ital">{$change.status_name}</span>
        <span style="font-size: 0.9em">
            ({$change.last_status_date|date_format:"%d.%m %H:%M"})
        </span>
        <br />
        <a href="index.php?site=edit_job&job_id={$change.job_id}">> Details</a>
        <br /><br />
    {/foreach}
    <div class="previous">
        {if $jobs_latest_changes_info.start > 0}
            <a href="index.php?site=jobs_latest_changes&start={$jobs_latest_changes_info.start-10}&limit=10">zur&uuml;ck</a>
        {/if}
    </div>
    <div class="next">
        {if $jobs_latest_changes_info.count > $jobs_latest_changes_info.start+10}
            <a href="index.php?site=jobs_latest_changes&start={$jobs_latest_changes_info.start+10}&limit=10">mehr</a>
        {/if}
    </div>
</div>