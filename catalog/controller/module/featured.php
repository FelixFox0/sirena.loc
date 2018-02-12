<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');
                
                $this->load->model('catalog/label');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		if (!empty($setting['product'])) {
			$products = array_slice($setting['product'], 0, (int)$setting['limit']);

			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'], '', true, strtolower($this->session->data['country_code']));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'], '', true, strtolower($this->session->data['country_code']));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency'], '', true, strtolower($this->session->data['country_code']));
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
                                        
//                                        var_dump($product_info);
//                                        die();
                                        
                                        $label = $this->model_catalog_label->getLabel($product_info['label']);
//                          
                                        if($label){
                                            if($label['label_width'] && $label['label_height']){
                                                $label['label_image'] = $this->model_tool_image->resize($label['label_image'],$label['label_width'], $label['label_height']);
                                            }elseif($label['label_width']){
                                                $label['label_image'] = $this->model_tool_image->resize_width($label['label_image'], $label['label_width']);
                                            }elseif($label['label_height']){
                                                $label['label_image'] = $this->model_tool_image->resize_height($label['label_image'], $label['label_height']);
                                            }else{
                                                $label['label_image'] = $this->model_tool_image->resize_width($label['label_image'], 45);
                                            }
                                        }
                                        $images = $this->model_catalog_product->getProductImages($product_info['product_id']);
//                                        var_dump($images);
                                        if(isset($images[0]['image']) && !empty($images[0]['image'])){
                                            $images =$images[0]['image'];
                                        } else {
                                            $images = 'no_image.png';
                                        }
                                        
					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
                                                'thumb_hover'  => $this->model_tool_image->resize($images, $setting['width'], $setting['height']),
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
                                                'model'       => $product_info['model'],
						'rating'      => $rating,
                                                'label'       => $label,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
					);
				}
			}
		}

		if ($data['products']) {
			return $this->load->view('module/featured', $data);
		}
	}
}