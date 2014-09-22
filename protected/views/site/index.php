<?php
/* @var $this SiteController */
// /index.php?r=site/analystDashboard
$this->pageTitle=Yii::app()->name;
?>
<script type="text/javascript">
/* <![CDATA[ */
	function requestProposal() {
		// Open survey page in same window
		// ./index.php?r=site/survey
	}
	function askQuestion() {
		// Open the contact page in same window
		// ./index.php?r=site/contact
	}
	/* ]]> */
</script>

<body style="text-align: center;
	  background: wheat url(./splash.jpg) no-repeat fixed center center" >
	<div id="timestamp"><h3><?php echo $time; ?></h3></div>
	<h1>WELCOME TO THE FUTURE</h1>
	<h2>Will you be ready?</h2>
	<p><h2>Information Systems Information Solutions (ISIS)</h2>
	<h3>Helps companies develop cutting edge technology <br/>
		to give them a competitive edge <br/>
		for the future and beyond.</p>
	<p>Let us help you.</p>
	</h3>
	<p><h1>
	<input type="button" value="Request a Proposal Online" style="width: 450px" 
		onclick="requestProposal();"/>&nbsp;
	</br>
	<input type="button" value="Ask us a Question" style="width: 450px" 
		onclick="askQuestion();"/>&nbsp;
	</h1></p>
</body>

