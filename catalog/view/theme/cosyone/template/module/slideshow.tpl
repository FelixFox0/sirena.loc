<?php if(false){ ?>
<div id="slideshow<?php echo $module; ?>" class="owl-carousel custom" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: false,
	slideSpeed:750,
	pagination: false
});
--></script>
<?php } ?>
    
    
    
    
<div class="first-screen">
  <div class="main-slider container">
    <div class="main-slider__container owl-carousel owl-theme">
        
      <?php foreach ($banners as $banner) { ?>
      <div class="main-slider__item item">
        <div class="main-slider__item-img">
            <?php if ($banner['link']) { ?>
                <a href="#"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $title; ?>"></a>
            <?php }else{ ?>
                <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $title; ?>"></a>
            <?php } ?>
          <div class="main-slider__main">
            <?php if ($banner['description']) { ?>
            <h1 class="main-slider__item-name" style="letter-spacing: 0px;"><?php echo $banner['description']; ?></h1>
            <?php } ?>
            <?php if ($banner['link']) { ?>
            <div class="main-slider__item-show-more"><a href="<?php echo $banner['link']; ?>"><?php echo $text_link; ?></a></div>
            <?php } ?>
          </div>
        </div>
      </div>
      <?php } ?>
      
      </div> 
    </div>
  <div class="first-screen__scroll-down">
    <div class="scroll-btn">
    <a>
      <span class="mouse">
        <span>
        </span>
      </span>
    </a>
    </div>
  </div>
</div>

<script>
	$(".scroll-btn").on("click", function(event){
		event.preventDefault();
		$("html, body").animate({ scrollTop: $(".woman-collection").offset().top }, 1000);
	})
</script>