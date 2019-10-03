<div class="row">

 

	<div class="col-md-4">
		<?php echo modules::run('adminlte/widget/info_box', 'yellow', $count['users'], 'Users', 'fa fa-users', 'user'); ?>
	</div>
	
	<div class="col-md-4"  >
	
	  <span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
		<?php echo modules::run('adminlte/widget/small_box', 'green', $count['users'], 'Users', 'fa fa-users', 'user'); ?>
	</div>
	<div class="info-box">
  <!-- Apply any bg-* class to to the icon to color it -->
  <span class="info-box-icon bg-red"><i class="fa fa-star-o"></i></span>
  <div class="info-box-content">
    <span class="info-box-text">Likes</span>
    <span class="info-box-number">93,139</span>
  </div>
  
  
	
	 
</div>

	<div class="col-md-2">
		<?php echo modules::run('adminlte/widget/box_open', 'Shortcuts'); ?>
			<?php echo modules::run('adminlte/widget/app_btn', 'fa fa-user', 'Account', 'panel/account'); ?>
			<?php echo modules::run('adminlte/widget/app_btn', 'fa fa-sign-out', 'Logout', 'panel/logout'); ?>
	<?php echo modules::run('adminlte/widget/app_btn', 'fa fa-sign-out', 'Logout', 'panel/logout'); ?>	
	<?php echo modules::run('adminlte/widget/box_close'); ?>
	</div>
	
	
	
</div>

<div class="info-box bg-yellow">
  <span class="info-box-icon"><i class="fa fa-comments-o"></i></span>
  <div class="info-box-content">
    <span class="info-box-text">Likes</span>
    <span class="info-box-number">41,410</span>
    <!-- The progress section is optional -->
    <div class="progress">
      <div class="progress-bar" style="width: 70%"></div>
    </div>
    <span class="progress-description">
      70% Increase in 30 Days
    </span>
  </div>
  <!-- /.info-box-content -->
</div>
 
 