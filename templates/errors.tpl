<h4>Ein Fehler ist aufgetreten</h4>
{foreach from=$error_messages item=one_error}
    {$one_error}&nbsp;<br />
{/foreach}
<a href="javascript:history.back();">zurück</a>