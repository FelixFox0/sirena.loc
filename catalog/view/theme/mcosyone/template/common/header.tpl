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
<link href="/catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="/catalog/view/theme/mcosyone/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="/catalog/view/theme/mcosyone/stylesheet/perfect-scrollbar.css" />
<!--<link href="/catalog/view/theme/default/css/account.css" rel="stylesheet">-->
<link href="/catalog/view/theme/mdefault/css/main.css" rel="stylesheet">


<script type="text/javascript" src="/catalog/view/theme/mcosyone/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="/catalog/view/theme/mcosyone/js/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="/catalog/view/theme/mcosyone/js/cosyone_common.js"></script>

<link rel="stylesheet" type="text/css" href="/catalog/view/theme/mcosyone/stylesheet/style.css" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<link rel="stylesheet" href="https://d1azc1qln24ryf.cloudfront.net/114779/Socicon/style-cf.css?u8vidh">

<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<script>
  jQuery(document).ready(function($) {
    setTimeout(function(){
      $(".loader").fadeOut();
    }, 1500);

  });
</script>

</head>
<body class="<?php echo $class; ?>">

<div class="loader"> 
  <img src="/image/cropped-sirena_icon.gif" alt="cropped-fidelitti_icon">
</div>

<nav id="my-menu"> 
<ul class="">
<!--   <li><a href="/index.php?route=product/search" class="mmobile-search"><?php echo $text_search2; ?> <i class=""><img src="/image/icon_search.png" alt=""></i></a></li> -->
       <?php if ($categories) { ?>
       <?php foreach ($categories as $category_1) { ?>
        <?php if ($category_1['category_1_id'] == $category_1_id) { ?>
    <li class="col<?php echo $category_1['column']; ?>"><span href="<?php echo $category_1['href']; ?>" class="mmobile-wicon mm-fullsubopen"><?php echo $category_1['name']; ?><i class="fa fa-angle-right"></i></span>
         <?php } else { ?>
         <li class="col<?php echo $category_1['column']; ?>"><span href="<?php echo $category_1['href']; ?>" class="mmobile-wicon mm-fullsubopen"><?php echo $category_1['name']; ?><i class="fa fa-angle-right"></i></span>
         <?php } ?>
          <?php if ($category_1['children']) { ?>

                        
          <ul>
          <?php if ($category_1['thumb']) { ?>

          <!--<li class="mmobile-image"><p><?php echo $category_1['name']; ?></p><img src="<?php echo $category_1['thumb']; ?>" alt=""></li>-->
          <?php } ?>
<li><span class="back_btn"><i class="fa fa-angle-left"> </i><?php echo $text_back; ?></span></li>
          <?php foreach ($category_1['children'] as $category_2) { ?>
          <li class="column level2">
          <?php if (!$category_2['children']) { ?>
            <a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
          <?php } else { ?>
            <span class="mmobile-wicon" href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?><i class="fa fa-angle-right"></i></span>
          <?php } ?>

            <?php if($cosyone_menu_mega_second_thumb == 'enabled' && $category_2['thumb']) { ?>

          <?php } ?>
              <?php if ($category_2['children']) { ?>
              <ul>
              <?php if ($category_2['thumb']) { ?>
              
                <!--<li class="mmobile-image"><p><?php echo $category_2['name']; ?></p><img src="<?php echo $category_2['thumb']; ?>" alt=""></li>-->
                <?php } ?>
                <li><span class="back_btn"><i class="fa fa-angle-left"> </i><?php echo $text_back; ?></span></li>
                <li><a href="<?php echo $category_2['href']; ?>"><?php echo $text_see_all; ?></a></li>
               <?php foreach ($category_2['children'] as $category_3) { ?>
               <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
               <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
        <?php } ?>
        <?php if($cosyone_custom_menu_block == 'enabled'){ ?>
    <li class=""><span><?php echo $cosyone_custom_menu_block_title; ?></span>
        <div class="">
        <?php echo $cosyone_menu_custom_block_content; ?>
        </div></li>
    <?php } ?>
        <?php if($cosyone_custom_menu_title1){ ?>
          <li class="">
            <span href="<?php echo $cosyone_custom_menu_url1 ?>" class="mmobile-wicon"><?php echo $cosyone_custom_menu_title1; ?><i class="fa fa-angle-right"></i></span>
                <ul>
                  <li><span class="back_btn"><i class="fa fa-angle-left"> </i><?php echo $text_back; ?></span></li>
                  <li class=""><a href="<?php echo $blog ?>"><?php echo $text_blog ?></a></li>
                  <li class=""><a href="https://www.instagram.com/fidelitti/" target="_blank">#Fidelittigirls</a></li>
                </ul>
          </li>
             
        <?php } ?>
        <?php if($cosyone_custom_menu_title2){ ?>      
                <li class="">
                    <span class="mmobile-wicon" href="<?php echo $cosyone_custom_menu_url2 ?>"  class=""><?php echo $cosyone_custom_menu_title2; ?><i class="fa fa-angle-right"></i></span></i>       
                
                <ul>
                  <li><span class="back_btn"><i class="fa fa-angle-left"> </i><?php echo $text_back; ?></span></li>
                  <li class=""><a href="<?php echo $my_company; ?>"><?php echo $text_about; ?></a></li>
                  <li class=""><a href="<?php echo $contact; ?>"><?php echo $text_sotr; ?></a></li>
                  <li class=""><a href="<?php echo $our_production; ?>"><?php echo $text_our_prod; ?></a></li>
                  <li class=""><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                </ul>

                 
                </li>
                
        <?php } ?>
               <li><a class="mmobile-wicon" href="<?php echo $our_stores; ?>" class=""><?php echo $informations[9]['title']; ?><i class="fa fa-map-marker" aria-hidden="true"></i></a></li>
                <li><a class="mmobile-wicon" href="<?php echo $customer_service; ?>"><?php echo $text_customer; ?> <i class=""><img src="/image/menu_icon_phone2.png" alt=""></i></a></li>
                <li><a class="mmobile-wicon" href="<?php echo $login; ?>"><?php echo $text_login; ?> <i class="icon-maaan"></i></a></li>

                
                <li><a href="tel:<?php echo $text_phone; ?>" class="mmobile-phone"><?php echo $text_phone; ?></a></li>
                </ul>
      </nav>

<div class="clearfix total-wrap">
<section>


<div class="outer_container <?php echo $cosyone_default_product_style; ?> <?php if($cosyone_use_custom){ echo $cosyone_container_layout; } ?> <?php echo $cosyone_use_breadcrumb; ?>">
<div class="header_wrapper">
<?php //echo $cosyone_menu_sticky; ?> 
<?php //echo $cosyone_menu_border; ?> 
<?php //echo $cosyone_header_style; ?>


<div class="popup-countries mfp-hide">
  <div class="popup-countries__header">
    <?php echo $text_select_country; ?>
  </div>
  <ul class="popup-countries__items">
    <?php foreach ($countries_array as $country) { ?>
    <li class="popup-countries__item">
      <img src="/image/flags/<?php echo strtolower($country['iso_code_2']); ?>.png" alt="">
      <a href="/<?php echo strtolower($country['iso_code_2']) . $href; ?>" class="first-frame__list-item"><?php echo $country['name']; ?></a>
    </li>
    <?php } ?>
  </ul>
</div>

<header class="header">
  

<div class="logomob">
  <a href="<?php echo $home; ?>">
  <img src="/image/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
</div>
<div class="container header_main_container">
<div class="header_main">
  <div class="header_right " id="my-header"> 
  <a href="#" id="mob-menu-btn" class="trigger-menu"><i class="fa fa-bars" aria-hidden="true"></i></a>
  <div class="top-icons-right">
      <div class="cart-mobile">
        <a href="/index.php?route=product/search" class="mmobile-search"><?php //echo $text_search2; ?> <i class=""><img src="/image/icon_search.png" alt=""></i></a>
      </div>
      <div class="cart-mobile">
        <?php if ($cosyone_header_cart) { echo $cart; } ?>
      </div>
  </div>
  <?php if ($logo) { ?>
  <div class="logo">
  <a href="<?php echo $home; ?>">
  <img src="/image/logo2.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
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


<div class="menu-line">
  <div class="col-md-2">
<!--     <div class="header__group">
    <div class="header__lang">
      <i class="icon-glob"></i>
      <?php echo $language; ?>
    </div>
  </div> -->
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
                <li class="column level2"><a href="<?php echo $our_stores; ?>"><?php echo $informations[9]['title']; ?></a></li>
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
                      <?php if ($cosyone_header_cart) { echo $cart; } ?>
                    </div>
                    <div class="service-block__item">
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
      <a href="#text-popup" class="open-popup"><i class="icon-mail"></i></a>
    </div>
    <div class="service-block__item">
     <?php if($logged){ ?>
        <a href="<?php echo $account; ?>"><i class="icon-man"></i></a>
    <?php }else{ ?>
        <a href="<?php echo $login; ?>"><i class="icon-man"></i></a>
    <?php } ?>
    </div>
    <div class="service-block__item">
      <?php if ($cosyone_header_cart) { echo $cart; } ?>
    </div>
    <div class="service-block__item">
      <a href="#" class="js-search"><i class="icon-search"></i></a>
    </div>
  </div></div>
</div>


<?php if($cosyone_header_style == 'header3'){ ?>
      </div> <!-- header_right ends -->
  </div> <!-- header ends -->
    <?php } else { ?><?php } ?>
<div class="clearfix"></div>



</div> <!-- inner conainer ends -->


   <div class="container">
    <div class="header__top">
      <div class="header__promo">
        Бесплатно звонок по Украине:  0 800 210 385
      </div>
    </div>
  </div>
</header>
<?php 
if($countries){
    echo $countries; 
}
?>


<div id="text-popup" class="white-popup mfp-hide">
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
<button title="Close (Esc)" type="button" class="mfp-close">×</button></div>

<div class="breadcrumb_wrapper"></div>
<div id="notification" class="container"></div>

<script>

    $(document).delegate('#mob-menu-btn', 'click', function(e) {
        e.preventDefault();
        //$('#my-menu').show();
        if($(window).scrollTop()>$('.logomob').height()){
            $('#my-menu').css('top', $('.header_main').height()+2);
        }else{
            //$('#my-menu').css('top', $('.header_main').offset().top - $(window).scrollTop() + $('.header_main').height()+2);
            $('#my-menu').css('top', 106-$(window).scrollTop());
        }
        $('#my-menu').toggle("slide");
        //$('#my-menu').show();
        if($('body').css('overflow')=='hidden'){
            $('body').css('overflow', 'auto');    
        }else{
            $('body').css('overflow', 'hidden');    
        }
    });
    
    $(document).delegate(window, 'scroll', function() {
        //console.log($(document).scrollTop());
        //console.log($(window).scrollTop());
        //console.log($('.header_main').position().top);
        //console.log($('.header_main').offset().top-$(window).scrollTop());
        $('#my-menu').css('top', $('.header_main').height()+2);
        if($(window).scrollTop()>$('.logomob').height()){
           $('.header_main').css('position', 'fixed');
           $('.header_main').css('top', '0px');
           //$('.logomob').css('margin-bottom', $('.header_main').height());
           $('#my-menu').css('top', $('.header_main').height()+2);
           $('.header_main').css('width', '100%');
           $('.header_main .logo').fadeIn("slow");
           $('#my-menu').css('height', 'calc(100% - 46px)');
           
        }else{
            $('.header_main').css('position', 'relative');
            //$('.logomob').css('margin-bottom', 0);
            $('#my-menu').css('top', 106-$(window).scrollTop());
            $('.header_main').css('width', 'calc(100% + 30px)');
            $('.header_main .logo').fadeOut();
            $('#my-menu').css('height', 'calc(100% - 106px)');
        }
    });
    $(document).ready(function() {
        $('#my-menu li').click(function() {
            /*$('#my-menu li .back_btn').click(function() {
               console.log(this);
            })*/
           if($('>span', this).is('.back_btn')){
               //console.log(this);
                $(this).parent().parent().children('ul').toggle("slide", function() {
                    //console.log(this);
                    //alert();
                    $(this).parent().children('span').attr('style','display:flex !important');
                    $(this).parent().parent().children('li').show();
                });
                /*console.log($(this).parent().parent().children('span'));
                console.log($(this).parent().parent().parent().children('span'));*/
            }else{
                //console.log(this);
                $('#my-menu ul li').hide();
                //$('#my-menu ul li').hide("slide", { direction: "left" }, 500);
                //$(this).find('ul').toggle("slide");
                //$('>span', this).css('display', 'none !important');///////////////////////////////////
                $('>span', this).attr('style','display:none !important');

                $(this).show();

                $(this).find('ul>li').show();
                $(this).parent().parent().show();
                //$('>ul', this).show();
                $('>ul', this).toggle("slide");


                if($('>a', this).attr('href')){
                    //console.log($('>a', this).attr('href'));
                    location = $('>a', this).attr('href');
                }  
            }
            return false;
        })
        $('#cart-panel').width($(window).width());
        //console.log($('#cart-panel'));
    })
    
    $(window).resize(function() {
        $('#cart-panel').width($(window).width());
    });
    
    $(document).delegate('#cart-total', 'click', function(e) {
        //console.log(e);
        e.preventDefault();
        //$('#mob-menu-btn').trigger('click');
        //console.log($('#cart .content'));
        //console.log($('#cart .content').attr('style'));
       
        if($('#cart .content').attr('style')=="display: block;"){
            //console.log($('#cart .content').attr('style'));
            $('#cart .content').fadeOut('slide');
        }else{
            //console.log($('#cart .content').attr('style'));
            $('#cart .content').fadeIn();
        }
        //return false;
    });
</script>