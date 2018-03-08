
<?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  
<div class="quickcheckout-cart-row">
    <div class="cart-scroll">
        <?php if (false) { ?>
         <table class="quickcheckout-cart contrast_font hidden-xs hidden-sm">
           <?php if ($products || $vouchers) { ?>
           <tbody>
               <?php foreach ($products as $product) { ?>
               <tr>
                 <td class="name">
                   
                 <?php if ($product['thumb']) { ?>
                   <a href="<?php echo $product['href']; ?>">
                        <div class="cart_image" style="background: url('<?php echo $product['thumb']; ?>');">
                            
                        </div>
                   </a>
                   <?php } ?>


                 <?php if (!$product['stock']) { ?>
                         <span class="text-danger">***</span>
                         <?php } ?>
                   <div>
                     <?php foreach ($product['option'] as $option) { ?>
                     <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                     <?php } ?>

                 <?php if ($product['recurring']) { ?>
                 <small><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></small>
                 <?php } ?>
                   </div>
                   
                   </td>
                   <td class="buttons-cart">
                       <div class="buttons-cart__inner">
                           <a href="<?php echo $product['href']; ?>" class="cart-td-head"><?php echo $product['name']; ?></a>
                           <div class="cart-products__item-atrs">
                               <?php foreach ($product['option'] as $option) { ?>
                               <?php echo $option['name']; ?>: <?php echo $option['value']; ?><br />
                               <?php } ?>
                               <?php if ($product['recurring']) { ?>
                               <?php echo $text_recurring ?>: <?php echo $product['recurring']; ?><br />
                               <?php } ?>
                           </div>
                           <a href="<?php echo $product['cart_id']; ?>" data-tooltip="<?php echo $button_remove; ?>" class="button-remove sq_icon" data-remove="<?php echo $product['cart_id']; ?>"><?php echo $text_remove_but; ?></a>
                       </div>
                   </td>
                 <td class="quantity">
                     <div class="quantity__inner">
                         <p class="cart-td-head"><?php echo $text_quantity; ?></p>
                         <?php if ($edit_cart) { ?>
                           <div class="counter">
                             <button class="minus">-</button>
                             <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" style="max-width:35px;" value="<?php echo $product['quantity']; ?>" />
                             <button class="plus">+</button>
                           </div>
                               <!-- <a data-tooltip="<?php echo $button_update; ?>" class="button-update sq_icon"><i class="fa fa-refresh"></i></a> -->
                               <?php } else { ?>
                           x&nbsp;<?php echo $product['quantity']; ?>
                           <?php } ?>
                     </div>
                 </td>
               <td class="unit-price mobile_hide">
                   <div class="unit-price__inner">
                       <p class="cart-td-head"><?php echo $text_price; ?></p>
                       <p><?php echo $product['price']; ?></p>
                   </div>
               </td>
               </tr>
               <?php } ?>
               <?php foreach ($vouchers as $voucher) { ?>
               <tr>
                 <td class="image mobile_hide"></td>
                 <td class="name"><?php echo $voucher['description']; ?></td>
                 <td class="quantity">x&nbsp;1</td>
               <td class="price mobile_hide"><?php echo $voucher['amount']; ?></td>
                 <td class="total"><?php echo $voucher['amount']; ?></td>
               </tr>
               </tbody>
               <?php } ?>
               </table>
                <table class="quickcheckout-cart contrast_font hidden" style="margin-top:-1px">
                <tbody>
                    <?php foreach ($totals as $total) { ?>
                      <tr>
                        <td style="text-align:right; font-size: 14px;" colspan="4"><?php echo $total['title']; ?>:</td>
                        <td style="text-align:right; font-size: 14px;"><?php echo $total['text']; ?></td>
                      </tr>
                <?php } ?>
                  </tbody>
                    </table>
            <?php } ?>
        </table>
        <?php } ?>
        
        
        <?php if ($products || $vouchers) { ?>
        <?php foreach ($products as $product) { ?>
        <div class="cart_product_section">
        <div class='row quickcheckout-cart cart_product_row'>           
        
        <div class="col-md-6 col-xs-6">
        <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>">
                <div class="cart_image">
                    <img src="<?php echo $product['thumb']; ?>"/>
                </div>
            </a>
        <?php } ?>
        </div>
        
        <div class="col-md-6 col-xs-6">
            <div class="buttons-cart__inner">
            <a href="<?php echo $product['href']; ?>" class="cart-td-head"><?php echo $product['name']; ?></a>
            <div class="cart-products__item-atrs">
                <?php foreach ($product['option'] as $option) { ?>
                <?php echo $option['name']; ?>: <?php echo $option['value']; ?><br />
                <?php } ?>
                <?php if ($product['recurring']) { ?>
                <?php echo $text_recurring ?>: <?php echo $product['recurring']; ?><br />
                <?php } ?>
            </div>
           
            </div>

            <div class="quantity__inner">
                <p class="cart-td-head"><?php echo $text_quantity; ?></p>
                <?php if ($edit_cart) { ?>
                  <div class="counter">
                    <button class="minus">-</button>
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" style="max-width:35px;" value="<?php echo $product['quantity']; ?>" />
                    <button class="plus">+</button>
                  </div>
                      <!-- <a data-tooltip="<?php echo $button_update; ?>" class="button-update sq_icon"><i class="fa fa-refresh"></i></a> -->
                      <?php } else { ?>
                  x&nbsp;<?php echo $product['quantity']; ?>
                  <?php } ?>
            </div>
             <a href="<?php echo $product['cart_id']; ?>" data-tooltip="<?php echo $button_remove; ?>" class="button-remove sq_icon" data-remove="<?php echo $product['cart_id']; ?>"><?php echo $text_remove_but; ?></a>
            <div class="unit-price__inner">
                <p class="cart-td-head"><?php echo $text_price; ?>: <?php echo $product['price']; ?></p>
                <?php if($product['old_price']){ ?>
                    <p style='text-decoration: line-through;'><?php echo $product['old_price']; ?></p>
                <?php } ?>
            </div>
        </div>
        </div>
        </div>
        <?php } ?>
        <?php } ?>
        
    </div>


<!--<div class="cart-total-info">

  <div class="cart-total-info__table">
    <table class="quickcheckout-cart contrast_font left-tab" style="margin-top:-1px">
        <thead>
            <div class="cart-total-info__title">
                <?php echo $text_total_inf; ?>
            </div>
        </thead>
        <tbody>
            <?php foreach ($totals as $total) { ?>
              <tr class="sp-line">
                <td style="text-align:left; font-size: 17px;" colspan="4"><?php echo $total['title']; ?>:</td>
                <td style="text-align:left; font-size: 17px;"><?php echo $total['text']; ?></td>
              </tr>
            <?php } ?>
        </tbody>
    </table>
  </div>
  <div class="cart-total-info__button">
    <button class='get-order button'><?php echo $text_continue; ?></button>
  </div>


</div>--></div>
  
  <div class="cart-tot visible-xs visible-sm">
    <?php foreach ($totals as $total) { ?>
          <div class="row_total">
            <div class="item_total"><?php echo $total['title']; ?>:</div>
            <div class="item_total right"><?php echo $total['text']; ?></div>
          </div>
    <?php } ?>
  </div>