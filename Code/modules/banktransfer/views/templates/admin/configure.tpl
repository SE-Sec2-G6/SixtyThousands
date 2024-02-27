<form method="post">
    <div class="panel">
        <div class="panel-heading">
            {l s='Bank Transfer Configuration' mod='banktransfer'}
        </div>
        <div class="panel-body">
            <label for="amount">{l s='Amount'}</label>
            <input type="text" id="amount" name="amount" value="{$PRICE}" />

            <label for="bank-owner">{l s='Bank Owner'}</label>
            <input type="text" id="bank-owner" name="bank-owner" value="สมาคมศิษย์เก่าวิทยาลัยการคอมพิวเตอร์" readonly />

            <label for="account-number">{l s='Account Number'}</label>
            <input type="text" maxlength="13" id="account-number" name="account-number" value="549-1-00001-7(10)" readonly />
        </div>
        <div class="panel-footer">
            <button type="submit" name="savebanktransfer" class="btn btn-default pull-right">
                {l s='Save' mod='banktransfer'}
            </button>
        </div>
    </div>
</form>
