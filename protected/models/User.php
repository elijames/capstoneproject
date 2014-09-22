<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property integer $idUser
 * @property integer $idUserType
 * @property string $LastName
 * @property string $FirstName
 * @property string $Password
 * @property string $Email
 * @property integer $Phone
 * @property integer $idStatus
 */
class User extends CActiveRecord
{
	const TYPE_BUG=0;
	const TYPE_FEATURE=1;
	const TYPE_TASK=2;

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('idUser', 'required'),
			array('idUser, idUserType, Phone, idStatus', 'numerical', 'integerOnly'=>true),
			array('LastName', 'length', 'max'=>20),
			array('FirstName', 'length', 'max'=>15),
			array('Password', 'length', 'max'=>45),
			array('Email', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('idUser, idUserType, LastName, FirstName, Password, Email, Phone, idStatus', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idUser' => 'Id User',
			'idUserType' => 'Id User Type',
			'LastName' => 'Last Name',
			'FirstName' => 'First Name',
			'Password' => 'Password',
			'Email' => 'Email',
			'Phone' => 'Phone',
			'idStatus' => 'Id Status',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('idUser',$this->idUser);
		$criteria->compare('idUserType',$this->idUserType);
		$criteria->compare('LastName',$this->LastName,true);
		$criteria->compare('FirstName',$this->FirstName,true);
		$criteria->compare('Password',$this->Password,true);
		$criteria->compare('Email',$this->Email,true);
		$criteria->compare('Phone',$this->Phone);
		$criteria->compare('idStatus',$this->idStatus);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
	/**
	  * Retrieves a list of issue types
	  * @return array an array of available issue types.
	  */ 
	public function getTypeOptions() 
	{
	  return array(
	    self::TYPE_BUG=>'Bug',
	    self::TYPE_FEATURE=>'Feature',
	    self::TYPE_TASK=>'Task'
	  );
	}
}
