<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">



<script src="/catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="/catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/catalog/view/theme/cosyone/stylesheet/stylesheet.css" />
<link href="/catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<!--<link rel="stylesheet" type="text/css" href="/catalog/view/theme/cosyone/stylesheet/perfect-scrollbar.css" />-->
<link rel="stylesheet" type="text/css" href="/catalog/view/theme/cosyone/stylesheet/lightslider.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js"></script>

<link href="/catalog/view/theme/default/css/main.css" rel="stylesheet">
<link href="/catalog/view/theme/default/css/account.css" rel="stylesheet">

<script type="text/javascript" src="/catalog/view/theme/cosyone/js/lightslider.js"></script>
<script type="text/javascript" src="/catalog/view/theme/cosyone/js/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="/catalog/view/theme/cosyone/js/cosyone_common.js"></script>
<link rel="stylesheet" type="text/css" href="/catalog/view/theme/cosyone/stylesheet/style.css" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>


<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<script>
  jQuery(document).ready(function($) {
    setTimeout(function(){
      $(".loader").fadeOut();
    }, 1200);

  });
</script>

<script id="mcjs">!function(c,h,i,m,p){m=c.createElement(h),p=c.getElementsByTagName(h)[0],m.async=1,m.src=i,p.parentNode.insertBefore(m,p)}(document,"script","https://chimpstatic.com/mcjs-connected/js/users/41e130d1a7327afff797fbea3/d9de2107ba4b474987bf74e05.js");</script>
</head>
<body class="<?php echo $class; ?>">
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NMR8MLS"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<div class="loader">
  <img src="/image/cropped-sirena_icon.gif" alt="cropped-fidelitti_icon" class="load_sirena_icon">
</div>

<div class="clearfix total-wrap">
<section>

<div class="outer_container <?php echo $cosyone_default_product_style; ?> <?php if($cosyone_use_custom){ echo $cosyone_container_layout; } ?> <?php echo $cosyone_use_breadcrumb; ?>">
<div class="header_wrapper">
<?php //echo $cosyone_menu_sticky; ?>
<?php //echo $cosyone_menu_border; ?>
<?php //echo $cosyone_header_style; ?>
<?php //var_dump($countries_array); ?>

<div class="popup-countries mfp-hide">
  <div class="popup-countries__inner">
    <div class="popup-countries__header">
      <?php echo $text_select_country; ?>
    </div>
    <div class="countries-select">
        <select id="countries-select" class="form-control">
          <?php foreach ($countries_array as $country) { ?>
          <?php if(strtoupper($country_s)==$country['iso_code_2']){ ?>
           <option selected="selected" value="/<?php echo strtolower($country['iso_code_2']); ?>">
                <?php echo $country['name']; ?>
           </option>
           <?php }else{ ?>
           <option value="/<?php echo strtolower($country['iso_code_2']); ?>">
                <?php echo $country['name']; ?>
           </option>
           <?php } ?>
          <?php } ?>
        </select>
    </div>

    <div class="language-select">
      <?php //echo $language; ?>
      <?php if (count($languages) > 1) { ?>
      <select id="languages-select" name="languages" class="form-control">
          <?php foreach ($languages as $language) { ?>
          <?php if($language['value'] === $language_name){ ?>
            <option value="/<?php echo $language['value'] . $href; ?>" selected="selected"><?php echo $language['name']; ?></option>
          <?php }else{ ?>
            <option value="/<?php echo $language['value'] . $href; ?>"><?php echo $language['name']; ?></option>
          <?php } ?>
          <?php } ?>
      </select>
      <?php } ?>
    </div>
    <div class="btn-popup"><a id="change_country_laguage" href="#"><?php echo $text_popup_btn; ?></a></div>
<!--   <ul class="popup-countries__items">
  <?php foreach ($countries_array as $country) { ?>
  <li class="popup-countries__item">
    <img src="/image/flags/<?php echo strtolower($country['iso_code_2']); ?>.png" alt="">
    <a href="/<?php echo strtolower($country['iso_code_2']) . $href; ?>" class="first-frame__list-item"><?php echo $country['name']; ?></a>
  </li>
  <?php } ?>
</ul>  -->
  </div>
</div>

<header class="header">
  <div class="container">
    <div class="header__top">
      <!-- <div class="header__group">
        <div class="header__delivery">
          <i class="fa fa-globe" aria-hidden="true"></i>
          <span><?php echo $shippig; ?></span>
          <a href=".popup-countries" class="open-popup"><?php echo strtoupper($country_s); ?></a>
        </div>
        <div class="header__lang">
          <?php echo $language; ?>
        </div>
      </div>-->
      <!-- <script>
          var next = 0;
          var textArr = ['<?php echo $text2; ?>', '<?php echo $text_free_call . $text_phone; ?>'];
          setInterval(function(){
            $('.header__promo').hide().html(textArr[next]).fadeIn(1500);
            next++;
            if(next > textArr.length) {next = 0;}
          }, 2500);
        </script> -->
      <div class="header__promo">
        <!-- <?php echo $cosyone_top_promo_message; ?> -->
        Бесплатно звонок по Украине:  0 800 210 385
      </div>
      <!-- <div class="header__register">
        <?php //echo $header_login; ?>
        <?php if($logged){ ?>
        <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
        <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
        <?php }else{ ?>
        <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
        <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
        <?php } ?>
      </div> -->
    </div>
  </div>
</header>

<div class="container header-wrap fixed">
<div class="header_main">
  <div class="header_right " id="my-header">
  <?php if ($logo) { ?>
  <div class="logo">
  <!-- <span><?php echo $text_logo_top; ?></span> -->
  <a href="<?php echo $home; ?>">
  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  </div>
  <?php } ?>

 <div class="mobile_clear"></div>
  <!-- Position for header login, lang, curr, in the header main -->
	<?php if($cosyone_header_style == 'header1'){ ?>
    <?php echo $header_login; ?>
	<?php echo $language; ?>
        <?php echo $countries; ?>
  	<?php echo $currency; ?>
    <?php } ?>
  <?php if($cosyone_header_style == 'header2') { ?>
    	<?php } else { ?>
    <?php } ?>
  <?php if($cosyone_header_style == 'header3'){ ?>
    <?php } else { ?>
      </div> <!-- header_right ends -->
	</div> <!-- header ends -->
    <?php } ?>


<div class="menu-line clearfix">

  <div class="col-md-2">
    <div class="header__group">
        <!-- <div class="header__delivery">
          <i class="fa fa-globe" aria-hidden="true"></i>
          <span><?php echo $shippig; ?></span>
          <a href=".popup-countries" class="open-popup"><?php echo strtoupper($country_s); ?></a>
        </div>  -->
        <div class="header__lang">
          <i class="icon-glob"></i>
         <!-- <?php echo $language; ?> -->
          <a href=".popup-countries" class="open-popup"><?php echo $country_name; ?>
          <i class="fa fa-angle-down"></i></a>
        </div>
      </div>
  </div>
  <div class="col-md-8 menu-top-center">


<div class="menu_wrapper">
<div class="search-block">
  <div class="container">
    <?php if($cosyone_header_search == 'enabled') { ?>
   <?php echo $search; ?>
   <?php } ?>
  </div>
</div>

<div class="menu_holder">
<?php if ($logo) { ?>
  <div class="logo2">
  <a href="<?php echo $home; ?>">
  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  </div>
  <?php } ?>
<div id="menu">
<?php if($cosyone_header_style == 'header2') { ?>
      <?php } else { ?>
        <div class="shortcuts_wrapper">
        <?php if($cosyone_header_style == 'header3') { ?>
 <div class="search-holder">
 <?php echo $search; ?>
 </div>
 <?php } ?>
        <?php echo $header_wishlist_compare; ?>
        <?php if ($cosyone_header_cart) { echo $cart; } ?>
        </div>
 <?php } ?>
<a class="mobile_menu_trigger up_to_tablet"><i class="fa fa-bars"></i> <?php echo $cosyone_text_mobile_menu; ?></a>
  <ul class="only_desktop">
  <li class="home only_desktop <?php echo $cosyone_show_home_icon; ?>"><a href="<?php echo $home; ?>" class="hvr-underline-from-center"><?php echo $text_home; ?></a></li>
       <?php if ($categories) { ?>
       <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_1_id'] == $category_1_id) { ?>
    <li class="col<?php echo $category_1['column']; ?> current"><a href="<?php echo $category_1['href']; ?>" class="hvr-underline-from-center"><?php echo $category_1['name']; ?></a>
         <?php } else { ?>
         <li class="col<?php echo $category_1['column']; ?>"><a href="<?php echo $category_1['href']; ?>" class="hvr-underline-from-center"><?php echo $category_1['name']; ?></a>
         <?php } ?>
          <?php if ($category_1['children']) { ?>



          <div class="menu_drop_down" >
          <div class="wrapper">

          <ul><?php foreach ($category_1['children'] as $category_2) { ?>
          <li class="column level2">
            <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
            <?php if($cosyone_menu_mega_second_thumb == 'enabled' && $category_2['thumb']) { ?>
          <a href="<?php echo $category_2['href']; ?>" class="sub_thumb"><img src="<?php echo $category_2['thumb']; ?>" alt="<?php echo $category_2['name']; ?>"/></a>
          <?php } ?>
              <?php if ($category_2['children']) { ?>
              <div class="third">
              <ul>
               <?php foreach ($category_2['children'] as $category_3) { ?>
               <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
               <?php } ?>
              </ul>
              </div>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <div class="wrapper-image">
            <img src="<?php echo $category_1['thumb']; ?>" />
          </div>

          </div><!-- wrapper ends -->
          </div>
          <?php } ?>
        </li>
        <?php } ?>
        <?php } ?>
        <?php if($cosyone_custom_menu_block == 'enabled'){ ?>
    <li class="withsubs custom_block"><a><?php echo $cosyone_custom_menu_block_title; ?></a>
        <div class="menu_drop_down">
        <?php echo $cosyone_menu_custom_block_content; ?>
        </div></li>
    <?php } ?>
        <?php if($cosyone_custom_menu_title1){ ?>
    <li class="col1 withsubs">
                    <a href="<?php echo $cosyone_custom_menu_url1 ?>" class="hvr-underline-from-center"><?php echo $cosyone_custom_menu_title1; ?></a>
                    <div class="menu_drop_down">
                      <div class="wrapper">
                        <ul>
                          <li class="column level2"><a href="<?php echo $blog ?>"><?php echo $text_blog ?></a></li>
                          <li class="column level2"><a href="https://www.instagram.com/fidelitti/" target="_blank">#Fidelittigirls</a></li>
                        </ul>



                        <div class="wrapper-image">
                            <img src="/image/catalog/fidelitti-blog.jpg">

                        </div>
                      </div>
                  </div>
                </li>

        <?php } ?>
        <?php if($cosyone_custom_menu_title2){ ?>
                <li class="col1 withsubs">
                    <a href="<?php echo $cosyone_custom_menu_url2 ?>"  class="hvr-underline-from-center"><?php echo $cosyone_custom_menu_title2; ?></a>



                <?php if ($informations) { ?>
                <div class="menu_drop_down">
                <div class="wrapper">


                <ul>
                <li class="column level2"><a href="<?php echo $my_company; ?>"><?php echo $text_about; ?></a></li>
                <li class="column level2"><a href="<?php echo $contact; ?>"><?php echo $text_sotr; ?></a></li>
                <li class="column level2"><a href="<?php echo $our_production; ?>"><?php echo $text_our_prod; ?></a></li>
                <!--<li class="column level2"><a href="<?php echo $our_stores; ?>"><?php echo $informations[9]['title']; ?></a></li>-->
                <li class="column level2"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>


                </ul>
                <div class="wrapper-image">
                  <img src="/image/catalog/about-company.jpg">
                </div>

                </ul>
                </div>
                <div class="service-block _no-fixed">
                    <div class="service-block__item">
                      <a href="#text-popup" class="open-popup">.icon-phone</a>
                    </div>
                    <div class="service-block__item">
                      <a href="<?php echo $login; ?>"><i class="icon-man"></i></a>
                    </div>
                    <div class="service-block__item">
                      <?php if ($cosyone_header_cart) ?>
                    </div>
                    <div class="service-block__item">q
                      <a href="#" class="js-search"><i class="icon-search"></i></a>
                    </div>
                  </div>
                </div>
                <?php } ?>
                </li>

        <?php } ?>
        <?php if($cosyone_custom_menu_title3){ ?>
    <li><a href="<?php echo $cosyone_custom_menu_url3; ?>"><?php echo $cosyone_custom_menu_title3; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title4){ ?>
    <li><a href="<?php echo $cosyone_custom_menu_url4; ?>"><?php echo $cosyone_custom_menu_title4; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title5){ ?>
    <li><a href="<?php echo $cosyone_custom_menu_url5; ?>"><?php echo $cosyone_custom_menu_title5; ?></a></li>
        <?php } ?>
        <?php if($cosyone_custom_menu_title6){ ?>
    <li><a href="<?php echo $cosyone_custom_menu_url6; ?>"><?php echo $cosyone_custom_menu_title6; ?></a></li>
        <?php } ?>
      </ul>
    </div> <!-- menu_holder ends -->
<!-- </div> --> <!-- menu ends -->
<!-- </div> --> <!-- menu_wrapper ends -->


  </div>
  <div class="col-md-2">  <div class="service-block">
    <div class="service-block__item">
     <?php if($logged){ ?>
        <a href="<?php echo $account; ?>"><i class="icon-man"></i></a>
     <?php }else{ ?>
        <a href="<?php echo $login; ?>"><i class="icon-man"></i></a>
    <?php } ?>
    </div>
    <div class="service-block__item">
      <a href="#" class="js-search"><i class="icon-search"></i></a>
    </div>
    <div class="service-block__item cart-block">
      <?php if ($cosyone_header_cart) { echo $cart; } ?>
    </div>
    <div class="service-block__item mail-block">
      <a href="#text-popup" class="open-popup"><i class="icon-mail"></i></a>
    </div>
  </div></div>
</div>


<?php if($cosyone_header_style == 'header3'){ ?>
      </div> <!-- header_right ends -->
	</div> <!-- header ends -->
    <?php } else { ?><?php } ?>
<div class="clearfix"></div>


</div> <!-- header_wrapper ends -->
</div> <!-- inner conainer ends -->

<?php
if($countries){
    echo $countries;
}
?>


<div id="text-popup" class="white-popup mfp-hide text-cl-popup">
    <div class="text-cl-popup-inner">
    <div class="large-12 columns modal_title">
        <?php echo $text_customer; ?>
    </div>
    <div class="white-popup__items">
    <div class="large-6 medium-6 small-6 columns modal__phone">
        <div><img src="/image/call-answer1.png" alt=""></div>
        <div><?php echo $text_phone; ?></div>
        <div><span class="prmn-cmngr-message"><?php echo $text_phone; ?></span></div>

        <div><?php echo $text_work_week; ?></div>
        <div><?php echo $text_work_time; ?></div>
    </div>
    <div class="large-6 medium-6 small-6 columns modal__email">
        <div>
            <img src="/image/mail-black-envelope-symbol.png" alt="">
        </div>
        <div>
            E-mail
        </div>
        <div>
            <?php echo $text_call_me; ?>
        </div>
        <div>
            <a href="/contact-us/"><?php echo $text_sand_mail; ?></a>
        </div>
    </div>
    <div class="large-6 medium-6 small-6 columns modal__chat">
        <div>
            <img src="/image/chat.png" alt="">
        </div>
        <div>
            <?php echo $text_chat; ?>
        </div>
        <div>
            <?php echo $text_our_managers; ?>
        </div>
        <div>
            <a href="javascript:jivo_api.open();"><?php echo $text_asc_question; ?></a>
        </div>
    </div>
    <div class="large-6 medium-6 small-6 columns modal__faq">
        <div>
            <img src="/image/question.png" alt="">
        </div>
        <div>
            FAQ
        </div>
        <div>
            <?php echo $text_read_faq; ?>
        </div>
        <div>
            <a href="/faq/"><?php echo $text_read_faq_but; ?></a>
        </div>
    </div>
    </div>
<button title="Close (Esc)" type="button" class="mfp-close">×</button>
</div>
</div>

<div class="breadcrumb_wrapper"></div>
<div id="notification" class="container"></div>

<script>
  jQuery(document).ready(function($) {
    $("#change_country_laguage").click(function(event) {
        event.preventDefault();
      window.location = $("#countries-select").val() + $("#languages-select").val();
    });
  });
</script>