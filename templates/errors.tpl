<div id="error" class="message_wrap">
    <div class="message_hl">
        <span class="bold">Ein Fehler ist aufgetreten</span>
    </div>
    <div class="message">
        {foreach from=$error_messages item=one_error}
            {$one_error}&nbsp;<br />
        {/foreach}
    </div>
</div>

