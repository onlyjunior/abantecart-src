<form action="<?php echo $this->html->getURL('extension/default_cod/confirm');?>" method="get">
    <div class="form-group action-buttons">
        <div class="col-md-12">
            <a id="checkout_btn" onclick="confirmCOD(event);" class="btn btn-orange pull-right lock-on-click" title="<?php echo $button_confirm->text ?>">
                <i class="fa fa-check"></i>
                <?php echo $button_confirm->text; ?>
            </a>
            <a id="<?php echo $button_back->name ?>" href="<?php echo $back; ?>" class="btn btn-default" title="<?php echo $button_back->text ?>">
                <i class="fa fa-arrow-left"></i>
                <?php echo $button_back->text ?>
            </a>
        </div>
    </div>
</form>
<script type="text/javascript">
function confirmCOD(e) {
    $('body').css('cursor', 'wait');
    $.ajax({
        type: 'GET',
        url: '<?php echo $this->html->getSecureURL('r/extension/default_cod/confirm');?>',
        global: false,
        beforeSend: function () {
            $('.alert').remove();
            $('.action-buttons')
                .hide()
                .before('<div class="wait alert alert-info text-center"><i class="fa fa-refresh fa-spin"></i> <?php echo $text_wait; ?></div>');
        },
        success: function () {
            location = '<?php echo $continue; ?>';
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(textStatus + ' ' + errorThrown);
            $('.wait').remove();
            $('.action-buttons').show();
            try {
                resetLockBtn();
            } catch (e) {
            }
        }
    });
}
</script>
