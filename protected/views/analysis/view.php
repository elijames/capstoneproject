<?php
/* @var $this AnalysisController */
/* @var $model Analysis */

$this->breadcrumbs=array(
	'Analysises'=>array('index'),
	$model->idAnalysis,
);

$this->menu=array(
	array('label'=>'List Analysis', 'url'=>array('index')),
	array('label'=>'Create Analysis', 'url'=>array('create')),
	array('label'=>'Update Analysis', 'url'=>array('update', 'id'=>$model->idAnalysis)),
	array('label'=>'Delete Analysis', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->idAnalysis),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Analysis', 'url'=>array('admin')),
);
?>

<h1>View Analysis #<?php echo $model->idAnalysis; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'idAnalysis',
		'idCustomer',
		'idUser',
		'Comments',
	),
)); ?>
