{extends file='page.tpl'}

{block name="content"}
    <section id="main" style="margin-bottom: 1.563rem;">
        <div class="row product-container js-product-container" style="display: flex; flex-direction: column; align-items: center; gap: 1rem; text-align: center;">
            <!-- Commented out the QR code image -->
            <!-- <div class="col-md-6">
                <img src="{$QR_GENERATE}" style="width: 100%;" />
            </div> -->
            <div class="col-md-6" style="margin: auto; ">
                <p style="text-align:left;">Details</p>
                <table class="table table-bordered" style"border-collapse: collapse; width: 100%;">
                    <tbody>
                        <tr>
                            <td style="border: 2px solid #969696; text-align:left; padding:0.8em 1.5em;">Amount</td>
                            <td style="border: 2px solid #969696; text-align:left; padding:0.8em 1.5em;">฿{$PRICE} (Tax Incl.)</td>
                        </tr>
                        <tr>
                            <td style="border: 2px solid #969696; text-align:left; padding:0.8em 1.5em;">Bank Owner</td>
                            <td style="border: 2px solid #969696; text-align:left; padding:0.8em 1.5em;">TCT KKU</td>
                        </tr>
                        <tr>
                            <td style="border: 2px solid #969696; text-align:left; padding:0.8em 1.5em;">PromptPay Number</td>
                            <td style="border: 2px solid #969696; text-align:left; padding:0.8em 1.5em;">0994000391528</td>
                        </tr>
                        <tr>
                            <td style="border: 2px solid #969696;  text-align:left; padding:0.8em 1.5em;">Branch</td>
                            <td style="border: 2px solid #969696;  text-align:left; padding:0.8em 1.5em;">Lotus Khon Kaen Branch</td>
                        </tr>
                        <tr>
                            <td style="border: 2px solid #969696;  text-align:left; padding:0.8em 1.5em;">Type</td>
                            <td style="border: 2px solid #969696;  text-align:left; padding:0.8em 1.5em;">Saving</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6" style="display: flex; flex-direction: column; gap: 1rem;">
                <form method="post" enctype="multipart/form-data" style="display: flex; flex-direction: column;">
                    <label for="slip_upload" style="display: flex; flex-direction: column; justify-content: center;">
                        <h3 style="text-align: left; margin-top:10%;">แนบใบเสร็จการชำระเงิน</h3>
                        <input type="file" name="slip_upload" id="slip_upload" />
                    </label>
                    
                    <button type="submit" name="placeorder" style="margin-top:13px; font-weight:700; font-size:larger; padding: .6rem 1rem;background-color: #F5F7F8; border-radius: 7px; border-style: none; box-shadow: rgba(0, 0, 0, .2) 0 1px 1.5px -1px,rgba(0, 0, 0, .14) 0 3px 8px 0,rgba(0, 0, 0, .12) 0 1px 10px 0; box-sizing: border-box; color: #3c4043; cursor: pointer;">
                        Upload
                    </button>
                </form>
            </div>
        </div>
    </section>
{/block}
