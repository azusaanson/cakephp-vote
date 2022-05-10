<h2>ALL POLLS</h2>

<ul>
	<?php foreach($polls as $poll): ?>
		<li id="post_<?php echo h($poll['Poll']['id']); ?>">	
			<?php
				echo $this->Html->link($poll['Poll']['title'], '/polls/view/' . $poll['Poll']['id']);
			?>
		</li>
	<?php endforeach; ?>
</ul>

<br>
<br>

<h3>
	<?php echo $this->Html->link('Create New Poll', array('controller'=>'polls', 'action'=>'add')); ?>
</h3>
