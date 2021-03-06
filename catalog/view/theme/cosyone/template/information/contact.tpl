<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

    <?php if(false){ ?>


      <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <?php } ?>



    <div class="static-pages">

      <div class="static-top-menu">
        <ul>
          <li><a href="#">нужна помощь?</a></li>
          <li><a href="#">политика продаж</a></li>
          <li><a href="#">вакансии</a></li>
        </ul>
      </div>
      </div>
        <div class="clearfix static-pages__container">
    <?php echo $left_menu; ?>
    <div class="col-md-9">
      <div class="static-pages__content">
      <?php if ($cosyone_google_map) { ?>
  <div class="contact_map">
  <?php echo html_entity_decode($cosyone_google_map, ENT_QUOTES, 'UTF-8'); ?>
   </div>
  <?php } ?>


<div class="contact-page">
  <div class="contact-content">
    <div class="contact-center-content">
      <h3><?php echo $heading_title; ?></h3>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <fieldset>
          <div class="">
            <div class="clearfix">
              <div class="form-group required">
                <input type="text" name="name" value="<?php //echo $name; ?>" id="input-name" class="form-control" placeholder="<?php echo $entry_name; ?>" />
                <?php if ($error_name) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
                <?php } ?>
              </div>
              <div class="form-group required" >
                <input type="text" name="last_name" value="<?php //echo $last_name; ?>" id="input-last_name" class="form-control" placeholder="<?php echo $text_lastname; ?>"/>
                <?php if ($error_last_name) { ?>
                <div class="text-danger"><?php echo $error_last_name; ?></div>
                <?php } ?>
              </div>
              <div class="form-group required">
                <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" placeholder="<?php echo $entry_email; ?>"/>
                <?php if ($error_email) { ?>
                <div class="text-danger"><?php echo $error_email; ?></div>
                <?php } ?>
              </div>

            </div>
            <div class="form-group required target-toggle">
              <input type="text" name="number" value="" id="input-number" class="form-control" placeholder="<?php echo $text_number; ?>" />
            </div>
            <div class="form-group required">
              <input type="text" name="position" value="" id="input-name" class="form-control" placeholder="<?php echo $text_position; ?>"/>
            </div>
            <div class="form-group required">
              <select name="" id="" class="form-control">
                <option disabled><?php echo $text_select; ?></option>
                <?php foreach($text_options as $option){ ?>
                <option value="<?php echo $option; ?>"><?php echo $option; ?></option>
                <?php } ?>
              </select>
            </div>


            <div class="row">
              <div class="form-group required">
                <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                <?php if ($error_enquiry) { ?>
                <div class="text-danger"><?php echo $error_enquiry; ?></div>
                <?php } ?>
              </div>

              <div class="vertical-captcha">
                <?php echo $captcha; ?>
              </div>
              <div class="text-info">
                Information entered above will only be used to give an accurate response to your inquiry. Fidelitti will never release personal data. For more details, please read our Privacy Policy.
              </div>
              <div class="text-center">
                <input class="button" type="submit" value="<?php echo $button_submit; ?>" />
              </div>
            </div>
          </div>
        </fieldset>
      </form>

    </div>
    <div class="contact-right-content">
      <div class="contact-right-content__top">
        <div class="contact-right-content__top__head">
          Свяжитесь с офисами<br />FIDELITTI
        </div>
        <div class="contact-right-content__top__info">
          <p>по телефону: 0 800 210 385</p>
          <p>E-mail: fidelitti@gmail.com</p>
        </div>
      </div>
      <div class="contact-right-content__bottom">
        <div class="cont-text">Для клиентов интернет-магазина служба доступна с понедельника по пятницу, с 9.30 до 18.30 часа, и с 10 до 18 часа по выходным <span>(UTC+02:00)</span>.</div>
        <div class="info-2">Телефоны:<br /><span class="info-inn-1">0 800 210 385</span><br /><span class="info-inn-2">+38 093 170 21 16</span></div>
      </div>

    </div>
  </div>















  <!--<div class="contact-page__info text-right">
        
    <?php echo $text_text; ?>
        

        <div class="">
          <?php if ($image) { ?>
          <div class="col-md-12 margin-b">
          <img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" />
          </div>
          <?php } ?>
          <div class="col-md-12 margin-b">
          <span class="contrast_font"><?php //echo $store; ?></span><br />
    <p><?php //echo $address; ?></p>
          <?php if ($geocode) { ?>
      <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
      <?php } ?>
          </div>
          <div class="col-md-12 margin-b">
          <span class="contrast_font"><?php //echo $text_telephone; ?></span><br />
    <?php //echo $telephone; ?><br />
          <?php if ($fax) { ?>
      <br /><span class="contrast_font"><?php echo $text_fax; ?></span><br />
      <?php echo $fax; ?>
      <?php } ?>
          </div>
          <div class="col-sm-3 margin-b">
          <?php if ($open) { ?>
          <span class="contrast_font"><?php echo $text_open; ?></span><br />
    <?php echo $open; ?>
          <br />
          <?php } ?>
          <?php if ($comment) { ?>
          <br /><span class="contrast_font"><?php echo $text_comment; ?></span><br />
          <?php echo $comment; ?>
          <?php } ?>
          </div>
        </div>
  </div>-->
  
</div>
  
      
      
      <?php if ($locations) { ?>
      <!--<div class="box-heading"><?php echo $text_store; ?></div>-->
      <div class="panel-group" id="accordion">
        <?php foreach ($locations as $location) { ?>
        <div class="panel panel-cosyone">
          <div class="panel-heading">
            <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
          </div>
          <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
            <div class="panel-body">
              <div class="row">
                <?php if ($location['image']) { ?>
                <div class="col-sm-3"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" /></div>
                <?php } ?>
                <div class="col-sm-3 margin-b">
                <span class="contrast_font"><?php echo $location['name']; ?></span><br />
                  <p><?php echo $location['address']; ?></p>
                  <?php if ($location['geocode']) { ?>
                  <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                  <?php } ?>
                </div>
                <div class="col-sm-3 margin-b">
                <span class="contrast_font"><?php echo $text_telephone; ?></span><br>
                  <?php echo $location['telephone']; ?><br />
                  <br />
                  <?php if ($location['fax']) { ?>
                  <span class="contrast_font"><?php echo $text_fax; ?></span><br>
                  <?php echo $location['fax']; ?>
                  <?php } ?>
                </div>
                <div class="col-sm-3 margin-b">
                  <?php if ($location['open']) { ?>
                  <span class="contrast_font"><?php echo $text_open; ?></span><br />
                  <?php echo $location['open']; ?><br />
                  <br />
                  <?php } ?>
                  <?php if ($location['comment']) { ?>
                  <span class="contrast_font"><?php echo $text_comment; ?></span><br />
                  <?php echo $location['comment']; ?>
                  <?php } ?>
                </div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      
      <!-- <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <fieldset>
          <div class="box-heading"><?php echo $text_contact; ?></div>
          <div class="row">
          <div class="form-group col-sm-6 required">
            <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          <div class="form-group col-sm-6 required">
            <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
          </div>
          <div class="form-group col-sm-12 required">
            <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
          </div>
          <div class="vertical-captcha">
          <?php echo $captcha; ?>
          </div>
          
            <div class="col-sm-12 text-right">
            <input class="btn btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
          </div>
        </fieldset>
      </form> -->
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
</div>
    </div></div>
        </div>


<script>
  
  $(document).ready(function() {
    $(".contact-page__tabs .button").click(function(event) {
      event.preventDefault();
      $(".contact-page__tabs .button").removeClass('active');
      if($(this).is(".js-toggler")) {
        $(this).addClass("active");
        $(".target-toggle").addClass('active');
      } else {
        $(this).removeClass("active");
        $(".target-toggle").removeClass('active');
      }
      

    });
  });
</script>
<?php echo $footer; ?>