<?php
namespace Cart;
class Currency {
	private $currencies = array();

	public function __construct($registry) {
//            var_dump($registry->get('session'));
		$this->db = $registry->get('db');
		$this->language = $registry->get('language');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency");
                
                $this->session = $registry->get('session');
                $symbol_right = '';
                $symbol_left = '';
//                var_dump($this->session->data['country_code']);
                
                $this->request = $registry->get('request');
//                var_dump($this->request->get['country_code']);
                
                
                
                if(isset($this->request->get['country_code'])){
                if($this->request->get['country_code']=='ua'){
                    $symbol_right = ' грн';
                }elseif($this->request->get['country_code']=='ru'){
                    $symbol_right = ' руб';
                }else{
                    $symbol_left = '$';
                }
                }elseif(isset($this->session->data['country_code'])){
                if($this->session->data['country_code']=='ua'){
                    $symbol_right = ' грн';
                }elseif($this->session->data['country_code']=='ru'){
                    $symbol_right = ' руб';
                }else{
                    $symbol_left = '$';
                }
                }
		foreach ($query->rows as $result) {
			$this->currencies[$result['code']] = array(
				'currency_id'   => $result['currency_id'],
				'title'         => $result['title'],
//				'symbol_left'   => $result['symbol_left'],
                                'symbol_left'   => $symbol_left,
//				'symbol_right'  => $result['symbol_right'],
                                'symbol_right'  => $symbol_right,
				'decimal_place' => $result['decimal_place'],
				'value'         => $result['value']
			);
		}
	}

	public function format($number, $currency, $value = '', $format = true, $country_code = false) {
            
		$symbol_left = $this->currencies[$currency]['symbol_left'];
		$symbol_right = $this->currencies[$currency]['symbol_right'];
		$decimal_place = $this->currencies[$currency]['decimal_place'];
//                var_dump($this->session->data['country_code']);
		if (!$value) {
			$value = $this->currencies[$currency]['value'];
		}
//                var_dump($number);
//                var_dump($country_code);
                if($country_code){
                    $symbol_right = '';
                    $symbol_left = '';
                    if($country_code == 'ua'){
                        $symbol_right = ' грн';
                    }elseif($country_code == 'ru'){
                        $symbol_right = ' руб';
                    }else{
                        $symbol_left = '$';
                    }
                }
//                var_dump($symbol_left);
		$amount = $value ? (float)$number * $value : (float)$number;
		
		$amount = round($amount, (int)$decimal_place);
		
		if (!$format) {
			return $amount;
		}

		$string = '';

		if ($symbol_left) {
			$string .= $symbol_left;
		}

		$string .= number_format($amount, (int)$decimal_place, $this->language->get('decimal_point'), $this->language->get('thousand_point'));

		if ($symbol_right) {
			$string .= $symbol_right;
		}

		return $string;
	}

	public function convert($value, $from, $to) {
		if (isset($this->currencies[$from])) {
			$from = $this->currencies[$from]['value'];
		} else {
			$from = 1;
		}

		if (isset($this->currencies[$to])) {
			$to = $this->currencies[$to]['value'];
		} else {
			$to = 1;
		}

		return $value * ($to / $from);
	}
	
	public function getId($currency) {
		if (isset($this->currencies[$currency])) {
			return $this->currencies[$currency]['currency_id'];
		} else {
			return 0;
		}
	}

	public function getSymbolLeft($currency) {
		if (isset($this->currencies[$currency])) {
			return $this->currencies[$currency]['symbol_left'];
		} else {
			return '';
		}
	}

	public function getSymbolRight($currency) {
		if (isset($this->currencies[$currency])) {
			return $this->currencies[$currency]['symbol_right'];
		} else {
			return '';
		}
	}

	public function getDecimalPlace($currency) {
		if (isset($this->currencies[$currency])) {
			return $this->currencies[$currency]['decimal_place'];
		} else {
			return 0;
		}
	}

	public function getValue($currency) {
		if (isset($this->currencies[$currency])) {
			return $this->currencies[$currency]['value'];
		} else {
			return 0;
		}
	}

	public function has($currency) {
		return isset($this->currencies[$currency]);
	}
}
