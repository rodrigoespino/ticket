<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Home page
 */
class mivista extends MY_Controller {
	
		public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
		        $this->load->library('session');

	}

	public function index()
	{
	$this->load->library('form_validation');
    $this->load->helper(array('mivista_helper','url'));
    $this->load->view('mivista');
    
	
	   //  $this->load->helper(array('mivista', 'url'));
 
        }
 
	
}
