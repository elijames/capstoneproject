<?php
/* @var $this AnalysisController */
/* @var $model Analysis */

$this->breadcrumbs=array(
	'Analysises'=>array('index'),
	$model->idAnalysis=>array('view','id'=>$model->idAnalysis),
	'Update',
);

$this->menu=array(
	array('label'=>'List Analysis', 'url'=>array('index')),
	array('label'=>'Create Analysis', 'url'=>array('create')),
	array('label'=>'View Analysis', 'url'=>array('view', 'id'=>$model->idAnalysis)),
	array('label'=>'Manage Analysis', 'url'=>array('admin')),
);
?>

<h1>Update Analysis <?php echo $model->idAnalysis; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>