<?php
/* @var $this UsertypeController */
/* @var $data Usertype */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('idUserType')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->idUserType), array('view', 'id'=>$data->idUserType)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('UserType')); ?>:</b>
	<?php echo CHtml::encode($data->UserType); ?>
	<br />


</div>