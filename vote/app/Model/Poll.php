<?php
	
class Poll extends AppModel{
	public $hasMany = 'Comment';
	public $validate = array(
		'title' => array(
			'rule' => 'notBlank',
			'message' => '必須',
			),
		'body' => array(
			'rule' => 'notBlank',
			'message' => '必須',
			),
		'end' => array(
			'rule' => 'notBlank',
			'message' => '必須',
			)
	);
}