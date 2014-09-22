<?php

class m140914_084228_create_issue_user_and_assignment_tables extends CDbMigration
{
	public function up()
	{
	}

	public function down()
	{
		echo "m140914_052511_create_issue_user_and_assignment_tables does not support migration down.\n";
		return false;
	}

	
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		//create the issue table
		$this->createTable('tbl_issue', array(
		  id => 'pk',
		  name => 'string NOT NULL',
		  description => 'text',
		  analysis_id => 'int(11) DEFAULT NULL',
		  type_id => 'int(11) DEFAULT NULL',
		  status_id => 'int(11) DEFAULT NULL',
		  owner_id => 'int(11) DEFAULT NULL',
		  requester_id => 'int(11) DEFAULT NULL',
		  create_time => 'datetime DEFAULT NULL',
		  create_user_id => 'int(11) DEFAULT NULL',
		  update_time => 'datetime DEFAULT NULL',
		  update_user_id => 'int(11) DEFAULT NULL',
		   ), 'ENGINE=InnoDB');

		//create the assignment table that allows for many-to-many 
		//relationship between analysis and users
		$this->createTable('tbl_analysis_user_assignment', array(
		  analysis_id => 'int(11) NOT NULL',
		  user_id => 'int(11) NOT NULL',
		), 'ENGINE=InnoDB');

		//foreign key relationships

		//the tbl_issue.analysis_id is a reference to analysis.idAnalysis
		$this->addForeignKey("fk_issue_analysis", "tbl_issue", "analysis_id", 
		"analysis", "idAnalysis", "CASCADE", "RESTRICT");

		//the tbl_issue.owner_id is a reference to user.idUser
		$this->addForeignKey("fk_issue_owner", "tbl_issue", "owner_id", 
		"user", "idUser", "CASCADE", "RESTRICT");

		//the tbl_issue.requester_id is a reference to user.idUser
		$this->addForeignKey("fk_issue_requester", "tbl_issue", 
		"requester_id", "user", "idUser", "CASCADE", "RESTRICT");

		//the tbl_analysis_user_assignment.analysis_id is a reference 
		// to analysis.idAnalysis
		$this->addForeignKey("fk_analysis_user", "tbl_analysis_user_assignment", 
		"analysis_id", "analysis", "idAnalysis", "CASCADE", "RESTRICT");

		//the tbl_analysis_user_assignment.user_id is a reference 
		// to user.idUser
		$this->addForeignKey("fk_user_analysis", "tbl_analysis_user_assignment", 
		"user_id", "user", "idUser", "CASCADE", "RESTRICT");
	}

	public function safeDown()
	{
		$this->truncateTable('tbl_analysis_user_assignment');
		$this->truncateTable('tbl_issue');
		$this->truncateTable('tbl_user');
		$this->dropTable('tbl_analysis_user_assignment');
		$this->dropTable('tbl_issue');
		$this->dropTable('tbl_user');
	}
}