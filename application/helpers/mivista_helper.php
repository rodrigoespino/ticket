 
<?php 
if ( ! defined('BASEPATH')) exit('No direct script access allowed');
 
//si no existe la función invierte_date_time la creamos
if(!function_exists('invierte_date_time'))
{
    //formateamos la fecha y la hora, función de cesarcancino.com
 function invierte_date_time($fecha)
 {
 
 $day=substr($fecha,8,2);
 $month=substr($fecha,5,2);
 $year=substr($fecha,0,4);
 $hour = substr($fecha,11,5);
 $datetime_format=$day."-".$month."-".$year.' '.$hour;
 return $datetime_format;
  }
  }

?>