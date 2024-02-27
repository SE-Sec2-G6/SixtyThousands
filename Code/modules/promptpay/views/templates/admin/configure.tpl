<form method="post">
    <div class="panel">
        <div class="panel-heading">
            {l s='Prompt Pay Configuration' mod='promptpay'}
        </div>
        <div class="panel-body">
            <label for="amount">{l s='Amount'}</label>
            <input type="text" id="amount" name="amount" value="{$PRICE}" />

            <label for="bank-owner">{l s='Bank Owner'}</label>
            <input type="text" id="bank-owner" name="bank-owner" value="TCT KKU" readonly />

            <label for="promptpay-number">{l s='PromptPay Number'}</label>
            <input type="text" maxlength="13" id="promptpay-number" name="promptpay-number" value="0994000391528" readonly />
        </div>
        <div class="panel-footer">
            <button type="submit" name="savepromptpay" class="btn btn-default pull-right">
                {l s='Save' mod='promptpay'}
            </button>
        </div>
    </div>
</form>
