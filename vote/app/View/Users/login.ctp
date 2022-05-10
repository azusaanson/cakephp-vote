<?php echo $this->Flash->render('auth'); ?>

<h2>Sign in to VOTE</h2>

<h4>Please enter your username and password</h4>

<?php 
    echo $this->Form->create('User');
    echo $this->Form->input('username');
    echo $this->Form->input('password');
    echo $this->Form->end('Login');
?>

<h4>
    Don't have an account?
    <?php echo $this->Html->link('Sign up', '/users/add/'); ?>
</h4>