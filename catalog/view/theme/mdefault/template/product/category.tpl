<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if (false) { ?>
      <?php //if ($thumb || $description) { ?>
      <h2><?php echo $heading_title; ?></h2>
      <div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <hr>
      <?php } ?>
      <?php if (false) { ?>
      <?php //if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if ($products) { ?>
      <!--<p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>-->
      <div class="row">
        <!--<div class="col-md-4">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>-->

        <div class="category_top">
            <div class="col-xs-6">
                <a href=".filter" class="js-filter filter_top" data-target="filter"><?php echo $fiter_title; ?> <i class="fa fa-angle-down"></i></a>
            </div>
            <div class="filter">
                <?php foreach ($filter_groups as $filter_group) { ?>
                <div>
                <p><a href="<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></a></p>
                <?php foreach ($filter_group['filter'] as $filter) { ?>

                <label>
                  <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                  <?php if($filter['color']){ ?>
                    <p class="color" style="background-color: #<?php echo $filter['color']; ?>"></p> 
                  <?php } ?>
                  <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                  <?php echo $filter['name']; ?>
                  <?php } else { ?>
                  <?php if($filter['color']){ ?>
                    <p class="color" style="background-color: #<?php echo $filter['color']; ?>"></p> 
                  <?php } ?>
                  <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
                  <?php echo $filter['name']; ?>
                  <?php } ?>
                   <i class="fa fa-check"></i>
                </label>
              
              <?php } ?>
                </div>
                <?php } ?>
                <div class="btn_searce">
                    <input type="button" id="button-filter" class="btn btn-primary" value="<?php echo $button_filter; ?>" >
                </div>
            </div>   
            
        <div class="col-xs-6"> 
        <a href=".sort" class="js-filter sort_top" data-target="sort"><?php echo $text_sort; ?> <i class="fa fa-angle-down"></i></a>
        </div> 
        <div class="sort">
            <?php foreach ($sorts as $sortt) { ?>
            <?php if ($sortt['value'] == $sort . '-' . $order) { ?>
            <p><a href="<?php echo $sortt['href']; ?>" class="_active"><?php echo $sortt['text']; ?></a></p>
            <?php } else { ?>
            <p><a href="<?php echo $sortt['href']; ?>"><?php echo $sortt['text']; ?></a></p>
            <?php } ?>
            <?php } ?>
        </div>
        </div>
      </div>
      <br />
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-6">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                  <?php } ?>
                  <?php if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } ?>
                </p>
                <?php } ?>
              </div>
              <div class="button-group">
                <p onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><?php echo $button_cart; ?></p>
                <!--<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>-->
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
$('#button-filter').on('click', function() {
	filter = [];

	$('.filter input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});


$('a.js-filter').click(function(e){
    e.preventDefault();
    var selector;
    if ( $($(this).attr('href')).css('display') == 'none'){
        selector = ($(this).attr('href'));
    }
    $('.sort').hide();
    $('.filter').hide();
    if(selector){
        $(selector).show();
        if(selector=='.sort'){
            $('.filter-group').hide();
            //$('.filter_now').show();
        }
    }else{
        $('.filter-group').hide();
        //$('.filter_now').show();
    }


        //$($(this).attr('href')+':hidden').show();
        //$($(this).attr('href')+':visible').hide();

});

    $('.filter a').click(function(e){
        e.preventDefault();
        $('.filter-group').hide();
        $('#filter-group'+$(this).attr('href')).show();
    });
    $('input').click(function(e){
        //if($(this+':checked')){

        //}
        //e.preventDefault();
        if($(this).is(':checked')){
            //console.log(this);
            //console.log($('input[value='+$(this).val()+']').val());
            $($('input[value='+$(this).val()+']')).prop("checked", true);
        }else{
            $($('input[value='+$(this).val()+']')).prop("checked", false);
        }
        $('#button-filter').show();
        
        //console.log($(this.id+':checked').val()); 
    });
    $('.filter div p a').click(function(e){
        if($(this).parent().parent().children('label').css('display')=='none'){
            $(this).parent().parent().children('label').fadeIn('slow');
        }else{
            $(this).parent().parent().children('label').fadeOut('fast');
        }
    });
</script>