<div id="cart" class="shortcut">
<a class="shortcut_heading" href="<?php echo $cart; ?>" id="cart-total"><?php echo $text_items; ?></a>
 <nav id="cart-panel">
  <div class="content">
    <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
      <table class="hidden-xs">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image border"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name border">
          <a class="contrast_font" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php echo $product['quantity']; ?>&nbsp;x&nbsp;<?php echo $product['price']; ?>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
              <?php echo $option['name']; ?>: <?php echo $option['value']; ?><br />
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <?php echo $text_recurring ?>: <?php echo $product['recurring']; ?><br />
              <?php } ?>

              <a title="<?php echo $button_remove; ?>" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><span class="remove"><?php echo $button_remove; ?></span></a>
            </div></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td colspan="2" class="voucher border"><span class="name" style="display:block; float:left">1&nbsp;x&nbsp;<?php echo $voucher['description']; ?></span></td>
          <td class="remove border"></td>
          </tr>
        <?php } ?>
      </table>

      <?php if ($products || $vouchers) { ?>
        <div class="cart-products visible-sm visible-xs">
          <div class="cart-products__title"><?php echo $text_cart2; ?></div>
          <?php foreach ($products as $product) { ?>
            <div class="cart-products__item">
              <div class="cart-products__item-img">
                <?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
                <a title="<?php echo $button_remove; ?>" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><span class="remove"><?php echo $button_remove; ?></span></a>
              </div>
              <div class="cart-products__item-info">
                <div class="cart-products__item-name"><a href="#"><?php echo $product['name']; ?> x <?php echo $product['quantity']; ?></a></div>
                <div class="cart-products__item-atrs">
                  <?php foreach ($product['option'] as $option) { ?>
                  <?php echo $option['name']; ?>: <?php echo $option['value']; ?><br />
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <?php echo $text_recurring ?>: <?php echo $product['recurring']; ?><br />
                  <?php } ?>
                </div>
                <div class="cart-products__item-price"><?php echo $product['price']; ?></div>
              </div>
            </div>
          <?php } ?>
        </div>
      <?php } ?>


    </div>   <div class="box-cart">
    <div class="mini-cart-total">
      <table>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="left titles"><?php echo $total['title']; ?>:</td>
          <td class="left"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>
    </div>

    <!--<div class="mini-go-cart hidden-sm hidden-xs">
      <a class="" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
    </div>-->
    <div class="mini-go-cart hidden-sm hidden-xs">
    <a class="" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>

    </div>
    <?php } else { ?>
    <div class="empty main_font"><?php echo $text_empty; ?></div>
    <?php } ?>
    </div>

  </nav>
  </div>