<?php
/* @var $this SurveyController */
/* @var $model Survey */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'idSurvey'); ?>
		<?php echo $form->textField($model,'idSurvey'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'Answer'); ?>
		<?php echo $form->textField($model,'Answer',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'idQuestion'); ?>
		<?php echo $form->textField($model,'idQuestion'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->