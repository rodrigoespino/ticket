<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class vista_ticket extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
		 $this->load->library('grocery_CRUD');
 //      echo '<div class="alert alert-success">Thank You!now please login </div>'.$id;
	 //


	// $this->load->library('ajax_grocery_CRUD');
	}

	// Frontend User CRUD
	public function index()
	{
		$id = $this->input->get('id');
		//echo '<div class="alert alert-success">Thank You!now please login </div>'.$id;
	 /// List Departments Ticket
		$crud = $this->generate_crud('dep_tickets');
		$crud->where('id_depts',intval($id));
 

		$crud->columns('id_dept', 'description');
	//	$this->unset_crud_fields('id_dept');

	// disable direct create / delete Frontend User
	//	$crud->unset_add();
		$crud->unset_delete();

		$this->mPageTitle = 'History Tickets';
		$this->render_crud();
}
 
}
	