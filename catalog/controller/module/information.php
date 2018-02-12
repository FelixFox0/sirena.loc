<?php
class ControllerModuleInformation extends Controller {
	public function index() {
		$this->load->language('module/information');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_sitemap'] = $this->language->get('text_sitemap');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			$data['informations'][] = array(
				'title' => $result['title'],
				'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'], false, $this->session->data['country_code'], $this->session->data['language_name'])
			);
		}

		$data['contact'] = $this->url->link('information/contact', '', false, $this->session->data['country_code'], $this->session->data['language_name']);
		$data['sitemap'] = $this->url->link('information/sitemap', '', false, $this->session->data['country_code'], $this->session->data['language_name']);

		return $this->load->view('module/information', $data);
	}
}