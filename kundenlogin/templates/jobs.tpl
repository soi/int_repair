<h3>Auftr&auml;ge</h3>
{foreach from=$jobs item=job}
    <b>{$job.short_description}</b> <br />
    {foreach from=$job.status item=status}
        {$status.name}&nbsp;{$status.date}{$status.bill_send}{$status.paid}{$status.finished}{$status.bid_needed}<br />   
    {/foreach}    
{/foreach}