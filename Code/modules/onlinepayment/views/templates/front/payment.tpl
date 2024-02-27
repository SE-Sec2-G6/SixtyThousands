{extends file='page.tpl'}

{block name="content"}
    <section id="main" style="margin-bottom: 1.563rem;">
        <div class="row product-container js-product-container" style="display: flex; flex-direction: column; align-items: center; gap: 1rem;">
            <div class="col-md-6">
                <img src="{$QR_GENERATE}" style="width: 100%;" />
            </div>
            <div class="col-md-6" style="display: flex; flex-direction: column; gap: 1rem;">
                <h1 style="display: flex; justify-content: center; font-size: xx-large; width: 100%;">{$PRICE} THB</h1>
                <div class="reftext" style="text-align: center;">
                <p style="display: inline-block; text-align: left;">Biller ID.&nbsp;099400039152892</br>Ref1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DONATECP</p>
                </div>
                <form method="post" enctype="multipart/form-data" style="display: flex; flex-direction: column;">
                    <label for="slip_upload" style="display: flex; flex-direction: column; justify-content: left;">
                        <h3 style="text-align: left;">แนบสลิปการโอน</h3>
                        <input type="file" name="slip_upload" id="slip_upload" />
                    </label>
                    
                    <button type="submit" name="placeorder" style="padding: .5rem 1rem;">
                        Upload
                    </button>
                </form>
            </div>
        </div>
    </section>
{/block}