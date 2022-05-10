<?php

class PollsController extends AppController{
	public $helpers = array('Html', 'Form');
	
	public function get_result($id = null) {
		$this->Poll->id = $id;
		$total = ($this->Poll->field('yes')) + ($this->Poll->field('no'));
		if ($total == 0) {
			// no result
			$this->Poll->saveField('result', 3);
		} elseif (($this->Poll->field('yes')) == 0) {
			// reject
			$this->Poll->saveField('result', 2);
		} else {
			$yes_ratio = ($this->Poll->field('yes')) / $total;
			if ($yes_ratio == 0.5) {
				// no result
				$this->Poll->saveField('result', 3);
			} elseif ($yes_ratio > 0.5) {
				// pass
				$this->Poll->saveField('result', 1);
			} elseif ($yes_ratio < 0.5) {
				// reject
				$this->Poll->saveField('result', 2);
			} 
		}
		return $this->redirect(array('controller'=>'polls', 'action'=>'view', $id));
	}

	public function index(){
		$this->set('polls', $this->Poll->find('all'));
		$this->set('title_for_layout', 'ALL POLLS');
	}

	public function view($id = null) {
		$this->Poll->id = $id;
		//compare current datetime and end date
		//if current >= end, get_result
		$cur_date = date('Y-m-d h:i:s', time());
		$end = $this->Poll->field('end');
		if ($this->Poll->field('result') == 0 and $cur_date >= $end) {
			$this->get_result($id);
		}
		$this->set('poll', $this->Poll->read());
	}

	public function add() {
		if($this->request->is('post')){
			if($this->Poll->save($this->request->data)){
				$this->Session->setFlash('Success!');
				$this->redirect(array('action'=>'index'));
			} else {
				$this->Session->setFlash('Failed!');
			}
		}
	}

	public function voteyes($id = null) {
		$this->Poll->id = $id;
		if ($this->Poll->field('result') != 0) {
			$this->Session->setFlash('Failed! Ended poll!');
		} else {
			$this->header('Content-Type: application/json');
			$voted_user_array = json_decode($this->Poll->field('voted_user'), true);
			if (in_array(AuthComponent::user('id'), $voted_user_array)) {
				$this->Session->setFlash('Failed! You have voted!');
			} else {
				if($this->Poll->saveField('yes', ($this->Poll->field('yes'))+1)) {
					array_push($voted_user_array, AuthComponent::user('id'));
					$new_voted_user = json_encode($voted_user_array);
					$this->Poll->saveField('voted_user', $new_voted_user);
					$this->Session->setFlash('Successfully Voted YES!');
				} else {
					$this->Session->setFlash('Failed!');
				}
			}
		}
		return $this->redirect(array('controller'=>'polls', 'action'=>'view', $id));
	}
	
	public function voteno($id = null) {
		$this->Poll->id = $id;
		if ($this->Poll->field('result') != 0) {
			$this->Session->setFlash('Failed! Ended poll!');
		} else {
			$this->header('Content-Type: application/json');
			$voted_user_array = json_decode($this->Poll->field('voted_user'), true);
			if (in_array(AuthComponent::user('id'), $voted_user_array)) {
				$this->Session->setFlash('Failed! You have voted!');
			} else {
				if($this->Poll->saveField('no', ($this->Poll->field('no'))+1)) {
					array_push($voted_user_array, AuthComponent::user('id'));
					$new_voted_user = json_encode($voted_user_array);
					$this->Poll->saveField('voted_user', $new_voted_user);
					$this->Session->setFlash('Successfully Voted NO!');
				} else {
					$this->Session->setFlash('Voting Failed!');
				}
			}
		}
		return $this->redirect(array('controller'=>'polls', 'action'=>'view', $id));
	}

}
