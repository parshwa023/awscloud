<?php
if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>

<header class="header">

   <a href="dashboard.php" class="logo">Question<span>Panel</span></a>

   <div class="profile">
      <?php
         $select_profile = $conn->prepare("SELECT * FROM `admin` WHERE id = ?");
         $select_profile->execute([$admin_id]);
      
         $fetch_profile = $select_profile->fetch(PDO::FETCH_ASSOC);

?>
   
      <p><?= ucwords($fetch_profile['name']) ?>
      <?php if($fetch_profile['name']=="Anonymous"){ ?> 
      <i id ="alert"  class="fas fa-exclamation-triangle" onclick=  "alert('This is an anonymous account, here you can post questions anonymously');" ></i>
<?php }elseif($fetch_profile['name']!="Anonymous"){?>
</p>
      <a href="update_profile.php" class="btn">update profile</a>
   </div>
<?php } ?>
   <nav class="navbar">
      <a href="dashboard.php"><i class="fas fa-home"></i> <span>Home</span></a>
      <a href="add_posts.php"><i class="fas fa-pen"></i> <span>Post Questions</span></a>
      <a href="view_posts.php"><i class="fas fa-eye"></i> <span>View Questions</span></a>
      <!-- <a href="admin_accounts.php"><i class="fas fa-user"></i> <span>Accounts</span></a> -->
      <a href="../components/admin_logout.php" style="color:var(--red);" onclick="return confirm('logout from the website?');"><i class="fas fa-right-from-bracket"></i><span>logout</span></a>
   </nav>

   <div class="flex-btn">
   
      <!-- <a href="register_admin.php" class="option-btn">register</a> -->
   </div>

</header>

<div id="menu-btn" class="fas fa-bars"></div>