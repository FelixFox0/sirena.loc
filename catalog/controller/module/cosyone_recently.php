<?php
class ControllerModuleCosyoneRecently extends Controller {
	public function index($setting) {
		
		$this->load->language('module/cosyone_recently');
		
		$data['lang'] = $this->language->get('code');
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		
		$data['cosyone_percentage_sale_badge'] = $this->config->get('cosyone_percentage_sale_badge');
		
		$cosyone_quicklook = $this->config->get('cosyone_text_ql');
		
		if(empty($cosyone_quicklook[$this->config->get('config_language_id')])) {
			$data['cosyone_text_ql'] = false;
		} else if (isset($cosyone_quicklook[$this->config->get('config_language_id')])) {
			$data['cosyone_text_ql'] = html_entity_decode($cosyone_quicklook[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		}
		
		$data['cosyone_brand'] = $this->config->get('cosyone_brand');
		
		$data['grid'] = $setting['grid'];
		
		$this->load->model('catalog/product');

		$this->load->model('tool/image');
                
                $this->load->model('catalog/label');

		$data['products'] = array();

        $products = array();

        if (isset($this->request->cookie['cosyone_recently'])) {
            $products = explode(',', $this->request->cookie['cosyone_recently']);
        } else if (isset($this->session->data['cosyone_recently'])) {
            $products = $this->session->data['cosyone_recently'];
        }

        if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
            $product_id = $this->request->get['product_id'];
            $products = array_diff($products, array($product_id));
            array_unshift($products, $product_id);
            setcookie('cosyone_recently', implode(',',$products), time() + 60 * 60 * 24 * 30, '/', $this->request->server['HTTP_HOST']);
        }

		if (empty($setting['limit'])) {
			$setting['limit'] = 4;
		}

		$products = array_slice($products, 1, (int)$setting['limit']);

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], 283, 513);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
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
				
				if ((float)$product_info['special']) {
				$sales_percantage = ((($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))-($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax'))))/(($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))/100));
				} else {
				$sales_percantage = false;
				}
                                
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
				
				$data['products'][] = array(
					'product_id'  => $product_info['product_id'],
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id'], false, $this->session->data['country_code'], $this->session->data['language_name']),
					'quickview'   => $this->url->link('product/quickview', 'product_id=' . $product_info['product_id'], '', true, $this->session->data['country_code'], $this->session->data['language_name']),
					'sales_percantage' => number_format($sales_percantage, 0, ',', '.'),
			 		'brand_name' 	 => $product_info['manufacturer'],
                                        'special_date_end' => 0,
                                        'label'       => $label,
				);
			}
		}

		if ($data['products']) {
			return $this->load->view('module/cosyone_recently', $data);
			
		}
	}
}