<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
| Email Settings
| -------------------------------------------------------------------
| Configuration of outgoing mail server.
| */

$config['protocol'] = 'smtp';
$config['smtp_host'] = 'mail.donalejo.com.ar';
$config['smtp_port'] = '25';
$config['smtp_timeout'] = '30';
$config['smtp_user'] = 'ventas@donalejo.com.ar';
$config['smtp_pass'] = 'slash123';
$config['charset'] = 'utf-8';
$config['mailtype'] = 'html';
$config['wordwrap'] = TRUE;
$config['newline'] = "\r\n";
