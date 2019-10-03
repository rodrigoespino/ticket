<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Home page
 */
class guardarvista extends MY_Controller {
	
		public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	public function index()
	{
     echo 'Datos enviados';
	
        }
 
	
}
