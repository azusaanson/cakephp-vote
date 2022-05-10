<h2>Create New Poll</h2>

<?php
	$day_later =  date('Y-m-d h:i:s', time()+86400);
	$week_later = date('Y-m-d h:i:s', time()+604800);
	$month_later = date('Y-m-d h:i:s', time()+2629743.83);
	$date_options = [$day_later => "One Day Later",
					$week_later => "One Week Later", 
					$month_later => "One Month Later"];
	echo $this->Form->create('Poll');
	echo $this->Form->input('title');
	echo $this->Form->input('body', array('rows'=>3));
	echo $this->Form->input('end', array('type' => 'select', 'options' => $date_options));
	echo $this->Form->end('Submit');
?>
