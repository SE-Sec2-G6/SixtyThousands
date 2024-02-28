<form method="post">
    <div class="panel">
        <div class="panel-heading">
            {l s='Counter Service Configuration' mod='counterservice'}
        </div>
        <div class="panel-body">
            <label for="promptpay-size">{l s='promptpay QR Code size'}</label>
            <input type="number" min="4" max="16" id="promptpay-size" name="promptpay-size" value="{$PROMPTPAY_SIZE}" />
            <label for="promptpay-id">{l s='promptpay ID'}</label>
            <input type="text" maxlength="13" id="promptpay-id" name="promptpay-id" value="{$PROMPTPAY_ID}" />
        </div>
        <div class="panel-footer">
            <button type="submit" name="savecounterservice" class="btn btn-default pull-right">
                {l s='Save' mod='counterservice'}
            </button>
        </div>
    </div>
</form>