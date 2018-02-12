
<!-- <div class="clearfix footer_margin"></div> -->
<?php echo $footer_modules ?>
<div id="footer" class="footer">
  <div class="container footer__container">
    <!--
  -->

  <div class="panel-group footer-mobile visible-xs" id="accordion-footer">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion-footer" href="#coll1">
          <?php echo $text_customers; ?></a>
        </h4>
      </div>
      <div id="coll1" class="panel-collapse collapse in">
        <div class="panel-body">
          <ul class="contrast_font">
            <?php if (/*$informations*/false) { ?>
              <?php foreach ($informations as $information) { ?>
              <li></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php } ?>
              <?php } ?>
              <li></i><a href="<?php echo $contact; ?>"><?php echo $text_call_me; ?></a></li>
              <li></i><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
              <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion-footer" href="#coll2">
          <?php echo $text_policy; ?></a>
        </h4>
      </div>
      <div id="coll2" class="panel-collapse collapse">
        <div class="panel-body">
          <ul class="contrast_font">
              <li><a href="<?php echo $paymant; ?>"><?php echo $text_payment; ?></a></li>
              <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
              <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion-footer" href="#coll3">
          <?php echo $text_company; ?></a>
        </h4>
      </div>
      <div id="coll3" class="panel-collapse collapse">
        <div class="panel-body">
          <ul class="contrast_font">
            <li></i><a href="<?php echo $all_news; ?>"><?php echo $text_news; ?></a></li>
            <li></i><a href="<?php echo $our_production; ?>"><?php echo $text_production; ?></a></li>
            <?php if($country_code == 'ua'){ ?>
            <li></i><a href="<?php echo $works; ?>"><?php echo $text_works; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="column col-md-4">
    <div class="box-heading heading"><?php //echo $text_information; ?><?php echo $text_customers; ?></div>
    <ul class="contrast_font">
    <?php if (/*$informations*/false) { ?>
      <?php foreach ($informations as $information) { ?>
      <li></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
      <?php } ?>
      <li></i><a href="<?php echo $contact; ?>"><?php echo $text_call_me; ?></a></li>
      <li></i><a href="<?php echo $faq; ?>"><?php echo $text_faq; ?></a></li>
      <!-- <li><a href="<?php echo $our_stores; ?>"><?php echo $informations[9]['title']; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li> -->
    </ul>
  </div><!--
  --><div class="column col-md-4">
    <div class="box-heading heading"><?php //echo $text_extra; ?><?php echo $text_policy; ?></div>
    <ul class="contrast_font">
        <li><a href="<?php echo $paymant; ?>"><?php echo $text_payment; ?></a></li>
        <li><a href="<?php echo $delivery; ?>"><?php echo $text_delivery; ?></a></li>
        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
        
      <?php if (false) { ?>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
      <?php } ?>
    </ul>
  </div><!--
  --><div class="column col-md-4">
    <div class="box-heading heading"><?php echo $text_account; ?></div>
    <ul class="contrast_font">
      <li></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li></i><a href="<?php echo $text_extra; ?>"><?php echo $text_extra; ?></a></li>
      <li></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
    </ul>
  </div>
  </div>
</div> <!-- #footer ends --> 
  <div class="bottom_line"> <div class="scroll_to_top"><a class="scroll_top icon tablet_hide"><i class="fa fa-angle-up"></i></a></div>
  <div class="container bottom_line__container">
  <div id="powered text-center"><?php echo $powered; ?></div>
  <?php if ($cosyone_footer_payment_icon) { ?>
   <div id="footer_payment_icon"><img src="/image/<?php echo $cosyone_footer_payment_icon; ?>" alt="" /></div>
   <?php } ?>
   <div class="clearfix"></div>
   </div>
  </div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>  <!-- .outer_container ends -->
<script type="text/javascript" src="/catalog/view/theme/cosyone/js/jquery.cookie.js"></script>

<script type="text/javascript" src="/catalog/view/theme/cosyone/js/colorbox/jquery.colorbox-min.js"></script>
<link href="/catalog/view/theme/cosyone/js/colorbox/custom_colorbox.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/catalog/view/theme/cosyone/js/quickview.js"></script>
<?php if($cosyone_use_retina) { ?>
<script type="text/javascript" src="/catalog/view/theme/cosyone/js/retina.min.js"></script>
<?php } ?>
<?php echo $live_search; ?>
<?php echo $cosyone_cookie; ?>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="/catalog/view/javascript/main.js"></script>
</section>
    </div>
</body></html>