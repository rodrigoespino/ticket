<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ticket extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
		 $this->load->library('grocery_CRUD');
		 $this->load->library('email');	
 

    }

	// Frontend User CRUD
	public function index()
	{

	
        /// List Departments Ticket
		$crud = $this->generate_crud('dep_tickets');
				//$crud->set_theme('datatables');

		$crud->columns('id_dept', 'description');
		$crud->unset_delete();

		$this->mPageTitle = 'List Tickets';
		$this->render_crud();
}
public function depticket()
	{
	    /// List Departments Ticket
		$crud = $this->generate_crud('dep_tickets');
		$crud->columns('id_dept', 'description');
		$crud->unset_delete();
		$this->mPageTitle = 'List Tickets';
		$this->render_crud();
                                                        
	}
public 	function open_ticket()
{
					//// Open Tickets 	
					$crud = $this->generate_crud('ticket');
				   //$crud->set_theme('datatables');

					$crud->fields('id_ticket','dataopen','dateclose','subject',	'message','file','id_status','id_depts','id','id_prio');
					$crud->display_as('id_status','Status');
					$crud->display_as('id_depts','Departments');
					$crud->display_as('user_open','Guest User Open');
				    $crud->set_subject('TICKETS');
					$crud->set_field_upload('file','assets/uploads/files');
					$crud->set_relation('id_status','ticket_stratus','description');
					$crud->set_relation('id_depts','dep_tickets','description');
				    $crud->set_relation('id','users','username');
					$crud->set_relation('id_prio','ticket_priority','description');
					$crud->unset_columns('message','file','dateclose');
					$crud->add_action('History Ticket', '', '','fa fa-clipboard',array($this,'just_a_test'));
					$crud->display_as('id','Asigned To:');
     				$crud->display_as('id_prio','Priority:');
					$crud->unset_fields('id_ticket');
					$crud->callback_column('id_status',array($this,'_colorline'));

					$crud->callback_before_update(array($this,'update_history_ticket'));

					 $this->mPageTitle = 'List Tickets';
			 
				 $this->render_crud();
}
public function _colorline($value, $row)
	{
   if ($row->id_status == 'OPEN'){
  return "<pre style='color:red'>".$row->id_status."</pre>";}
  else {return $row->id_status;}
      
	} 
function update_history_ticket($post_array,$row)
{
	
	  echo '<div class="alert alert-success">Thank You!now please login </div>'.$mailer;

        $status = $post_array['id_status'];
		$userid = $post_array['id'];
		$boletnumber = $post_array['id_ticket'];
		$depto =  $post_array['id_depts'];
		$postino =  $post_array['message'];
		$mailer =  $post_array['user_open'];

        $history_logs = array("id_dep" => $depto,"id_support" => $boletnumber,"id_sta" => $status,"num_user" => $userid);
        $this->db->insert('history_ticket',$history_logs);
  //////////////////////////////////////	
 /// Send Emails                 //////
 /////////////////////////////////////
/* 
            $this->email->set_newline("\r\n");

            set email information and content
            $this->email->from('ventas@donalejo.com.ar', 'Rodrigo Espino');
            $this->email->to($mailer);
            $this->email->subject('Confirmation for Registration');
            $this->email->message($postino);
            $this->email->set_mailtype('html');
			$this->email->send();
  */

  echo '<div class="alert alert-success">Thank You!now please login </div>'.$mailer;
  return true;
}

function just_a_test($post_array,$row)
{
 return site_url('/admin/vista_ticket').'?'.$row->id;
}

}
	