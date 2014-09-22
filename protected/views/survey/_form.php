<?php
/* @var $this SurveyController */
/* @var $model Survey */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'survey-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'idSurvey'); ?>
		<?php echo $form->textField($model,'idSurvey'); ?>
		<?php echo $form->error($model,'idSurvey'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'Answer'); ?>
		<?php echo $form->textField($model,'Answer',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'Answer'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'idQuestion'); ?>
		<?php echo $form->textField($model,'idQuestion'); ?>
		<?php echo $form->error($model,'idQuestion'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->