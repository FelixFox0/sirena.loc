<?php if(false){ ?>
<?php if (count($countries) > 1) { ?>
   <div class="dropdown">
   <button onclick="myFunctionss()" class="dropbtn">
      <?php foreach ($countries as $country) { ?>
      <?php if ($country['code'] == $country_s) { ?>
      <?php echo $country['name']; ?>
      <?php } ?>
      <?php } ?>
   </button>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">


  <div id="myDropdown" class="dropdown-content">
    <?php foreach ($countries as $country) { ?>
      <li><button class="btn btn-link btn-block country-select header<?php echo $country['code']; ?>" type="button" name="<?php echo $country['code']; ?>"><?php echo $country['name']; ?></button></li>
      <?php } ?>
  </div>


    
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>

<?php } ?>
</div>
<?php } ?>



<?php if (count($countries) > 1) { ?>
<div class="first-frame">
  <div class="first-frame__image">
    <img src="/image/fidelitti-country-selector.jpg" alt="image">
  </div>
  <div class="first-frame__countries">
    <div class="first-frame__title">
      Please select a country and language/Пожалуйста, выберите страну и язык.
    </div>
    <div class="first-frame__list">
      <select name="" id="country" class="form-control">
      <?php foreach ($countries as $country) { ?>
      <?php if($country['iso_code_2']==$geo_country){ ?>
      <option value="/<?php echo strtolower($country['iso_code_2']); ?>" selected="selected"><?php echo $country['name']; ?></option>
      <?php }else{ ?>
        <option value="/<?php echo strtolower($country['iso_code_2']); ?>"><?php echo $country['name']; ?></option>
      <?php } ?>
      <?php } ?>
      </select>
      <?php if (count($languages) > 1) { ?>
      <select id="lang" name="languages" class="form-control">
          <?php foreach ($languages as $language) { ?>
          <?php if(strripos($language['code'],$browser_lang)===false){ ?>
            <option value="/<?php echo $language['value']. $href; ?>"><?php echo $language['name']; ?></option>
          <?php }else{ ?>
            <option value="/<?php echo $language['value']. $href; ?>" selected="selected"><?php echo $language['name']; ?></option>
          <?php } ?>
          <?php } ?>
      </select>
      <?php } ?>
      <button class="button setCountryAndLang">GO</button> 
      
    </div>
      

      
  </div>
</div>

<script>
  jQuery(document).ready(function($) {
    $(".setCountryAndLang").click(function(event) {
      window.location = $("#country").val() + $("#lang").val();
    });
  });
</script>


<?php } ?>
