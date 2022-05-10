<h2><?php echo h($poll['Poll']['title']); ?></h2>
<p><?php echo h($poll['Poll']['body']); ?></p>

<br>

<h3>
	<?php
		switch ($poll['Poll']['result']) {
			case 0:
				echo 'Still Voting';
				break;
			case 1:
				echo 'PASSED';
				break;
			case 2:
				echo 'REJECTED';
				break;
			case 3:
				echo 'NO RESULT!';
				break;
			
			default:
				echo 'ERROR';
				break;
		}
	?>		
</h3>
<br>

<h3>YES count: <?php echo h($poll['Poll']['yes']); ?> | NO count: <?php echo h($poll['Poll']['no']); ?></h3>
<br>

<h4>ENDING</h4>
<p><?php echo h($poll['Poll']['end']); ?> UTC/GMT+1</p>
<br>

<h4>POSTED ON</h4>
<p><?php echo h($poll['Poll']['created']); ?> UTC/GMT+1</p>
<br>

<h2>Vote</h2>
<h3>Notice that you can only vote ONCE!</h3>
<button style="background:lightgreen;color:white;height:80px;width:100px;">
	<h3><?php echo $this->Html->link('YES', '/polls/voteyes/' . $poll['Poll']['id']); ?></h3>
</button>
<button style="background:lightcoral;color:white;height:80px;width:100px;">
	<h3><?php echo $this->Html->link('NO', '/polls/voteno/' . $poll['Poll']['id']); ?></h3>
</button>
<br>
<br>

<h2>Comments</h2>

<ul>
	<?php foreach($poll['Comment'] as $comment): ?>
		<li id="comment_<?php echo h($comment['id']); ?>">
			<?php echo h($comment['body']); ?>
		</li>
	<?php endforeach; ?>
</ul>
<br>

<h2>Add Comment</h2>

<?php 
	echo $this->Form->create('Comment', array('url'=>'/comments/add'));
	echo $this->Form->input('body', array('rows'=>3));
	echo $this->Form->input('Comment.poll_id', array('type'=>'hidden', 'value'=>$poll['Poll']['id']));
	echo $this->Form->end('Save Comment')
?>
