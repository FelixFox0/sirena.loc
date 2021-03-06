<?php
class ControllerAccountAccount extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

			$this->response->redirect($this->url->link('account/login', '', true, $this->session->data['country_code'], $this->session->data['language_name']));
		}

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name'])
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
                
                $data['home'] = $this->url->link('common/home', '', false, $this->session->data['country_code'], $this->session->data['language_name']);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_hello'] = $this->language->get('heading_hello');
		$data['heading_text'] = $this->language->get('heading_text');
		$data['heading_logout'] = $this->language->get('heading_logout');
		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_account_sp'] = $this->language->get('text_my_account_sp');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_credit_card'] = $this->language->get('text_credit_card');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');
                
                $data['text_shop'] = $this->language->get('text_shop');
                
                $data['text_lastname'] = $this->language->get('text_lastname');
                $data['text_firstname'] = $this->language->get('text_firstname');
                $data['text_country'] = $this->language->get('text_country');
                $data['text_phone'] = $this->language->get('text_phone');
                $data['text_mail'] = $this->language->get('text_mail');
                $data['text_edit'] = $this->language->get('text_edit');
                $data['text_total_orders'] = $this->language->get('text_total_orders');
                $data['text_see_all'] = $this->language->get('text_see_all');
                $data['text_description'] = $this->language->get('text_description');
//                var_dump($data);
		
		$data['menu_account'] = $this->language->get('menu_account');
		$data['menu_wishlist'] = $this->language->get('menu_wishlist');
		$data['menu_order'] = $this->language->get('menu_order');
		$data['menu_edit'] = $this->language->get('menu_edit');

		$data['edit'] = $this->url->link('account/edit', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['password'] = $this->url->link('account/password', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['address'] = $this->url->link('account/address', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		
		$data['credit_cards'] = array();
		
		$files = glob(DIR_APPLICATION . 'controller/credit_card/*.php');
		
		foreach ($files as $file) {
			$code = basename($file, '.php');
			
			if ($this->config->get($code . '_status') && $this->config->get($code)) {
				$this->load->language('credit_card/' . $code);

				$data['credit_cards'][] = array(
					'name' => $this->language->get('heading_title'),
					'href' => $this->url->link('credit_card/' . $code, '', true, $this->session->data['country_code'], $this->session->data['language_name'])
				);
			}
		}
		
		$data['wishlist'] = $this->url->link('account/wishlist', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['order'] = $this->url->link('account/order', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['download'] = $this->url->link('account/download', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		
		if ($this->config->get('reward_status')) {
			$data['reward'] = $this->url->link('account/reward', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		} else {
			$data['reward'] = '';
		}	
                
                
//                var_dump($this->customer->getFirstName());
//                var_dump($this->customer->getLastName());
//                var_dump($this->customer->getEmail());
//                var_dump($this->customer->getTelephone());
                
//                var_dump($this->model_account_address->getAddress($this->customer->getAddressId())['country']);
                
                $data['firstname'] = $this->customer->getFirstName();
                $data['lastname'] = $this->customer->getLastName();
                $data['email'] = $this->customer->getEmail();
                $data['phone'] = $this->customer->getTelephone();
                $this->load->model('account/address');
                $data['country'] = $this->model_account_address->getAddress($this->customer->getAddressId())['country'];
                $this->load->model('account/order');
                $data['total_orders'] = $this->model_account_order->getTotalOrders();
		
		$data['return'] = $this->url->link('account/return', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['transaction'] = $this->url->link('account/transaction', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['recurring'] = $this->url->link('account/recurring', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
 		$data['logout'] = $this->url->link('account/logout', '', true, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['account'] = $this->url->link('account/account', '', true, $this->session->data['country_code'], $this->session->data['language_name']);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
                
                
                
		$this->response->setOutput($this->load->view('account/account', $data));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
