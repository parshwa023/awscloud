<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};



?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home page</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="css/style.css">

</head>

<body>
    <?php
    include 'components/user_header.php';
    include 'components/upvote_comment.php';
    include 'components/downvote_comment.php';
    ?>
<section class="leaderboard">
    <h1 class="heading">Leaderboard</h1>

    <table class="content-table">
        <thead>
            <tr>
            <th>Position</th>
            <th>Name</th>
            <th>Upvotes</th>
            <th>Downvotes</th>
            </tr>
            </thead>
            <tbody>
                <?php

                // $select_leaderboard = $conn->query("SELECT user_name, COUNT(CASE WHEN upvotes_id IS NOT NULL THEN 1 END) AS upvotes,COUNT(CASE WHEN downvotes_id IS NOT NULL THEN 1 END) AS downvotes,@position:=@position+1 as position FROM leaderboard, (SELECT @position:=0) p WHERE upvotes_id IS NOT NULL OR downvotes_id IS NOT NULL GROUP BY user_name ORDER BY upvotes DESC");
                
                $select_leaderboard = $conn->query("SELECT user_name, COUNT(CASE WHEN upvotes_id IS NOT NULL THEN 1 END) AS upvotes, COUNT(CASE WHEN downvotes_id IS NOT NULL THEN 1 END) AS downvotes FROM leaderboard WHERE upvotes_id IS NOT NULL OR downvotes_id IS NOT NULL GROUP BY user_name ORDER BY upvotes DESC");
                

$rank = 1;
$prev_upvotes=null;
           ?>       
           <?php foreach ($select_leaderboard as $row) {
// Check if the current row has the same number of upvotes as the previous row
if (isset($prev_upvotes) && $row['upvotes'] == $prev_upvotes) {
    // If so, assign the same rank as the previous row
    $row['rank'] = $prev_rank + 1;
  } else {
    // Otherwise, assign the current rank and update the previous rank and number of upvotes
    $row['rank'] = $rank;
    $prev_rank = $rank;
    $prev_upvotes = $row['upvotes'] +1;
    $rank++;
  }
  // Display the leaderboard row
  echo '<tr><td>'.$row['rank'].'</td><td>'.$row['user_name'].'</td><td>'.$row['upvotes'].'</td><td>'.$row['downvotes'].'</td></tr>';
}
   ?>    
   </tbody> 
    </table>
</section>   




<script src="js/script.js"></script>
<?php
    include 'components/footer.php';
    ?>
</body>
</html>