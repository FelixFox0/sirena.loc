<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
    
    <?php echo $content_top; ?>
  <div class="category-main"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="category-grid <?php //echo $class; ?>">
      
      <?php if (false) { ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php //if ($thumb || $description) { ?>
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
      <?php if (($categories)&&(!$products)) { ?>


  
        
     
            <?php foreach ($categories as $category) { ?>
    <div class="item all-cat-hover">
    <?php if ($category['thumb']) { ?>
	<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $meta_title; ?>" /></a>
        <?php if ($category['label']) { ?>
            <img src="<?php echo $category['label']['label_image']; ?>" alt="<?php echo $category['label']['label_name']; ?>" class="product-layout__bage">
        <?php } ?>  
    </div>
        
	<?php } ?>
    <div class="name">
        <h3><?php echo $category['name']; ?></h3>
        <a href="<?php echo $category['href']; ?>"><?php echo $text_more; ?></a>
    </div>
    </div>
            <?php } ?>
       


      <?php } ?>
      
      </div>
      
      <?php if ($products) { ?>
      <?php if (false) { ?>
      <div class="panel panel-default">
        <div class="panel-heading"><?php echo $fiter_title; ?></div>
        <div class="list-group">
          <?php foreach ($filter_groups as $filter_group) { ?>
          <a class="list-group-item"><?php echo $filter_group['name']; ?></a>
          <div class="list-group-item">
            <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
              <?php foreach ($filter_group['filter'] as $filter) { ?>
              <div class="checkbox">
                <label>
                  <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                  <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                  <?php echo $filter['name']; ?>
                  <?php } else { ?>
                  <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
                  <?php echo $filter['name']; ?>
                  <?php } ?>
                </label>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
        </div>
        <div class="panel-footer text-right">
          <button type="button" id="button-filter1" class="btn btn-primary"><?php echo $button_filter; ?></button>
        </div>
      </div>
      <?php } ?>
      
      <?php //echo $filter; ?>
      
      <div class="row category_top">
        <?php if (false) { ?>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sortt) { ?>
            <?php if ($sortt['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sortt['href']; ?>" selected="selected"><?php echo $sortt['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sortt['href']; ?>"><?php echo $sortt['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $fiter_title; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control">
            <?php foreach ($filter_groups as $filter_group) { ?>
  
            <option value="<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></option>

            <?php } ?>
          </select>
        </div>
        <?php } ?>
        <div class="col-md-9">
            <div class="filter_now">
                <?php foreach ($filter_groups as $filter_group) { ?>

                    <?php foreach ($filter_group['filter'] as $filter) { ?>

                        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                            <?php $btn_search = true; ?>
                            <label>
                                <?php if($filter['color']){ ?>
                                    <p class="color" style="background-color: #<?php echo $filter['color']; ?>"></p> 
                                <?php } ?>
                                <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" /><?php echo $filter['name']; ?> <span>×</span>
                            </label>
                        <?php } ?>

                    <?php } ?>
                  
                <?php } ?>
            </div>
            
            
          <?php foreach ($filter_groups as $filter_group) { ?>

            <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>" class="filter-group">
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
                   <span>×</span>
                </label>

              <?php } ?>
              
            </div>
          
          <?php } ?>
          <?php if(isset($btn_search)){ ?>
            <input type="button" id="button-filter" class="btn btn-primary" value="<?php echo $button_filter; ?>" >
          <?php }else{ ?>
            <input type="button" id="button-filter" class="btn btn-primary" value="<?php echo $button_filter; ?>" style="display:none;">
          <?php } ?>
          
        </div>
        <div class="col-md-3">
            <div class="col-md-6">
            <a href=".filter" class="js-filter filter_top" data-target="filter"><?php echo $fiter_title; ?> <i class="fa fa-angle-down"></i></a>
            <div class="filter">
                <?php foreach ($filter_groups as $filter_group) { ?>
                <p><a href="<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></a></p>
                <?php } ?>
            </div>   
            </div> 
            <div class="col-md-6"> 
        <a href=".sort" class="js-filter sort_top" data-target="sort"><?php echo $text_sort; ?> <i class="fa fa-angle-down"></i></a>
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
          
        
          
      </div>
      <div class="grid3">
      <div class="product-grid product-cat-block">
          
          
        <?php foreach ($products as $product) { ?>
        
        <div class="item contrast_font product-layout product-cat-inline">
    <!-- <a href="javascript:void(0)" class="icon-cart2 quick-buy" onclick="cart.add('<?php echo $product['product_id']; ?>')"></a> -->

       <div class="image">
           <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $meta_title; ?>;" /></a>


        <?php if (false) { ?>
        <?php //if ($product['label']) { ?>
            <img src="<?php echo $product['label']['label_image']; ?>" alt="<?php echo $product['label']['label_name']; ?>" class="product-layout__bage">
        <?php } ?>  
    
        </div><!-- image ends -->
      <div class="information_wrapper">
      <div class="left">
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
       <?php if ($product['brand_name'] && $cosyone_brand) { ?>
                <span class="brand main_font"><?php echo $product['brand_name']; ?></span>
                <?php } ?>
                <?php if ($product['rating']) { ?>      
      <div class="rating"><span class="rating r<?php echo $product['rating']; ?>"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span></div>
      <?php } ?>
      </div>
      <div class="description main_font"><?php echo $product['description']; ?></div>

      <div class="info-hidden">
          <?php if ($product['price']) { ?>
          <div class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
            <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
            <?php } ?>
            <?php if ($product['tax']) { ?>
            <br />
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
            <?php } ?>
          </div>
          <?php } ?>
          <div class="prod-cat-buy">
              <a href="#" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="quick-buy open-popup"><?php echo $button_cart; ?></a>
          </div>
      </div>

              <?php if (($product['special']) && ($product['special_date_end'] > 0) && ($cosyone_product_countdown)) { ?>
    	<div class="offer_popup">
        <div class="offer_background"></div>
        <div class="offer_content">
        <div class="countdown <?php echo $product['product_id']; ?>"></div>
        <?php if ($cosyone_product_hurry) { ?>
        <span class="hurry main_font"><?php echo $product['stock_quantity']; ?></span>
        <?php } ?>
        </div>
        </div>

    	<?php } ?>
    	</div>



    </div>
        
        <?php if(false) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <p><?php echo $product['description']; ?></p>
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
                <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
        
        <?php } ?>
        
        
        
        
        
        
        </div>
        
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php //echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
$('#button-filter').on('click', function() {
	filter = [];

	$('.filter-group input[name^=\'filter\']:checked').each(function(element) {
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
            $('.filter_now').show();
        }
    }else{
        $('.filter-group').hide();
        $('.filter_now').show();
    }


        //$($(this).attr('href')+':hidden').show();
        //$($(this).attr('href')+':visible').hide();

});

    $('.filter a').click(function(e){
        e.preventDefault();
        $('.filter_now').hide();
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
    $('.filter_now input').click(function(e){
        $(this).parent().remove();
    });
</script>