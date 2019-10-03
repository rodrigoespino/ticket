
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class validate_ctrl extends My_Controller {
function __construct() {
parent::__construct();
$this->load->model('form_builder');
  
}
function index()
{
// Including Validation Library
$this->load->library('form_validation');
// Displaying Errors In Div
$this->form_validation->set_error_delimiters('<div class="error">', '</div>');
// Validation For Name Field
$this->form_validation->set_rules('dname', 'Username', 'required|min_length[5]|max_length[15]');
// Validation For Email Field
$this->form_validation->set_rules('demail', 'Email', 'required|valid_email');
// Validation For Contact Field
$this->form_validation->set_rules('dmobile', 'Contact No.', 'required|regex_match[/^[0-9]{10}$/]');
// Validation For Address Field
$this->form_validation->set_rules('daddress', 'Address', 'required|min_length[10]|max_length[50]');
if ($this->form_validation->run() == FALSE)
{
$this->load->view('mivista');
}
else
{
$this->load->view('formsubmit');
}
}
}
?>