<?php if (count($languages) > 1) { ?>
<div class="contrast_font">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
    <select class="form-control lang-select">
        <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $code) { ?>
        <option selected="selected" value="<?php echo $language['code']; ?>">
            <?php echo $language['name']; ?>
        </option>
        <?php }else{ ?>
        <option value="<?php echo $language['code']; ?>">
        <?php echo $language['name']; ?>
        </option>
        <?php } ?>
        <?php } ?>
    </select>
    </form>


</div>
<?php } ?>