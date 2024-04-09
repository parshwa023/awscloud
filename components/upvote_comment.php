<?php
if(isset($_POST['upvote_comment'])){
   if($user_id != ''){
      $post_id = $_POST['post_id'];
      $post_id = filter_var($post_id, FILTER_SANITIZE_STRING);
      $admin_id = $_POST['admin_id'];
      $admin_id = filter_var($admin_id, FILTER_SANITIZE_STRING);
      $comment_id = $_POST['comment_id'];
      $comment_id = filter_var($comment_id,FILTER_SANITIZE_STRING);
      $user_name = $_POST['user_name'];
      $user_name = filter_var($user_name,FILTER_SANITIZE_STRING);
      $select_comment_upvote = $conn->prepare("SELECT * FROM `upvotes` WHERE comment_id = ? AND user_id = ?");
      $select_comment_upvote->execute([$comment_id, $user_id]);
      $select_comment_downvote = $conn->prepare("SELECT * FROM `downvotes` WHERE comment_id = ? AND user_id = ?");
      $select_comment_downvote->execute([$comment_id,$user_id]);

      if($select_comment_upvote->rowCount() > 0){
         $remove_upvote = $conn->prepare("DELETE FROM `upvotes` WHERE user_id = ?");
         $remove_upvote->execute([$user_id]);
         $remove_leaderboard = $conn->prepare("DELETE FROM `leaderboard` WHERE user_id = ?");
         $remove_leaderboard->execute([$user_id]);
         $message[] = 'Removed from upvotes';
      }else{
         if($select_comment_downvote->rowCount() >0){
            $remove_downvoted = $conn->prepare("DELETE FROM `downvotes` WHERE user_id = ?");
            $remove_downvoted->execute([$user_id]);
            $leaderboard_downvote = $conn->prepare("DELETE FROM `leaderboard` WHERE user_id=?");
            $leaderboard_downvote->execute([$user_id]);
         }
         $add_upvote = $conn->prepare("INSERT INTO `upvotes`(user_id, post_id, admin_id,comment_id) VALUES(?,?,?,?)");
         $add_upvote->execute([$user_id, $post_id, $admin_id,$comment_id]);
         $select_user_name = $conn->prepare("SELECT user_name FROM `comments` WHERE id = ?");
         $select_user_name->execute([$comment_id]);
         $user_name_result = $select_user_name->fetch(PDO::FETCH_ASSOC);
         $user_name_result = $user_name_result['user_name'];
         $leaderboard = $conn->prepare("INSERT INTO  `leaderboard`(user_id,post_id,admin_id,comment_id,user_name,upvotes_id) VALUES(?,?,?,?,?,?)");
         $leaderboard->execute([$user_id, $post_id, $admin_id,$comment_id,$user_name_result,$comment_id]);
         $message[] = 'Comment upvoted';
      }      
   } else{ 
      $message[] = 'Please login first!';
   }
}



















// if(isset($_POST['upvote_comment'])){

//    if($user_id != ''){
     
//       $post_id = $_POST['post_id'];
//       $post_id = filter_var($post_id, FILTER_SANITIZE_STRING);
//       $admin_id = $_POST['admin_id'];
//       $admin_id = filter_var($admin_id, FILTER_SANITIZE_STRING);
//       $comment_id = $_POST['comment_id'];
//       $comment_id = filter_var($comment_id,FILTER_SANITIZE_STRING);
//       $user_name = $_POST['user_name'];
//       $user_name = filter_var($user_name,FILTER_SANITIZE_STRING);
   

//       $select_comment_upvote = $conn->prepare("SELECT * FROM `upvotes` WHERE comment_id = ? AND user_id = ?");
//       $select_comment_upvote->execute([$comment_id, $user_id]);
//       $select_comment_downvote = $conn->prepare("SELECT * FROM `downvotes` WHERE comment_id = ? AND user_id = ?");
//       $select_comment_downvote->execute([$comment_id,$user_id]);

//       if($select_comment_upvote->rowCount() > 0){

//          $remove_upvote = $conn->prepare("DELETE FROM `upvotes` WHERE user_id = ?");
//          $remove_upvote->execute([$user_id]);
//          $remove_leaderboard = $conn->prepare("DELETE FROM `leaderboard_upvote` WHERE user_id =?");
//          $remove_leaderboard->execute([$user_id]);
//          $message[] = 'Removed from upvotes';
//       }else{
//          if($select_comment_downvote->rowCount() >0){
//             $remove_downvoted = $conn->prepare("DELETE FROM `downvotes` WHERE user_id = ?");
//             $remove_downvoted->execute([$user_id]);
//             $leaderboard_downvote = $conn->prepare("DELETE FROM `leaderboard_downvote` WHERE user_id=?");
//             $leaderboard_downvote->execute([$user_id]);
//          }
//          $add_upvote = $conn->prepare("INSERT INTO `upvotes`(user_id, post_id, admin_id,comment_id) VALUES(?,?,?,?)");
//          $add_upvote->execute([$user_id, $post_id, $admin_id,$comment_id]);
//          $select_user_name = $conn->prepare("SELECT user_name FROM `comments` WHERE id = ?");
//          $select_user_name->execute([$comment_id]);
//          $user_name_result = $select_user_name->fetch(PDO::FETCH_ASSOC);
//          $user_name_result = $user_name_result['user_name'];
//          $leaderboard = $conn->prepare("INSERT INTO  `leaderboard_upvote`(user_id,post_id,admin_id,comment_id,user_name) VALUES(?,?,?,?,?)");
//          $leaderboard->execute([$user_id, $post_id, $admin_id,$comment_id,$user_name_result]);
//          // $upvotes_id = $_POST['id'];
//          // $upvotes_id = filter_var($upvotes_id,FILTER_SANITIZE_STRING);
//          // $leaderboard1 = $conn->prepare("INSERT INTO `leaderboard`(user_id,post_id,admin_id,comment_id,user_name,upvotes_id) VALUES(?,?,?,?,?,?)");
//          // $leaderboard1->execute([$user_id,$post_id,$admin_id,$comment_id,$user_name,$upvotes_id]);

//          $message[] = 'Comment upvoted';
//       }
      
//    } else{ $message[] = 'Please login first!';
//    }
// }
?>