<?php

class CommentsController extends AppController{
	public $helpers = array('Html', 'Form');

	public function add() {
		if($this->request->is('post')){
			if($this->Comment->save($this->request->data)){
				$this->Session->setFlash('Success!');
				$this->redirect(array('controller'=>'polls', 'action'=>'view', $this->data['Comment']['poll_id']));
			} else {
				$this->Session->setFlash('Failed!');
			}
		}
	}

}
