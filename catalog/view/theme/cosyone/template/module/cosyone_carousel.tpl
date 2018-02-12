<div class="box">
<div class="box-heading">
<?php echo $title; ?>
</div> 
<div class="grid_holder">
	<div class="bannercarousel owl-carousel <?php echo $module; ?>">
	<?php foreach ($banners as $banner) { ?>
    <div class="carousel_item item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
    <?php } ?>
    </div>
    <?php } ?>
	</div>
</div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
$('.bannercarousel.<?php echo $module; ?>').owlCarousel({
loop:true,
items: 3,
margin:10,
nav:true,
responsive:{
    0:{
        items:2
    },
    600:{
        items:3
    },
    1000:{
        items:3
    }
}
}); 
});	
//--></script>