<?php
/* @var $this SurveyController */
/* @var $model Survey */

$this->breadcrumbs=array(
	'Surveys'=>array('index'),
	$model->idSurvey=>array('view','id'=>$model->idSurvey),
	'Update',
);

$this->menu=array(
	array('label'=>'List Survey', 'url'=>array('index')),
	array('label'=>'Create Survey', 'url'=>array('create')),
	array('label'=>'View Survey', 'url'=>array('view', 'id'=>$model->idSurvey)),
	array('label'=>'Manage Survey', 'url'=>array('admin')),
);
?>

<h1>Update Survey <?php echo $model->idSurvey; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>