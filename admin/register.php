<?php
include '../components/connection.php';

if(isset($_POST["register"])){
    $id = unique_id();

    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $pass = filter_var($_POST['password'], FILTER_SANITIZE_STRING);
    $cpass = filter_var($_POST['cpassword'], FILTER_SANITIZE_STRING);
    $image = $_FILES['image']['name'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = '../image/' . $image;

    $select_admin = $conn->prepare("SELECT * FROM `admin` WHERE email = ?");
    $select_admin->execute([$email]);

    if($select_admin->rowCount() > 0){
        $warning_msg[] = "User email already exists";
    } else {
        if($pass != $cpass){
            $warning_msg[] = "Confirm password not matched";
        } else {
            // Hash the password securely
            $hashed_password = password_hash($pass, PASSWORD_DEFAULT);

            $insert_admin = $conn->prepare("INSERT INTO `admin` (id, name, email, password, profile) VALUES (?, ?, ?, ?, ?)");
            $insert_admin->execute([$id, $name, $email, $hashed_password, $image]);
            move_uploaded_file($image_tmp_name, $image_folder);

            $success_msg[] = "New admin registered";
        }
    }
}
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="admin_style.css?v=<?php echo time(); ?>">
    <title>green coffee admin panel - register page</title>
</head>
<body>
    <div class="main">
        <section>
            <div class="form-container" id="admin_login">
                <form action="" method="post" enctype="multipart/form-data">
                <h3>register now</h3>
                <div class="input-field">
                <label>user name <sup>*</sup></label>
                <input type="text" name="name" maxlength="20" required placeholder="Enter your username" oninput="this.value.replace(/\s/g,'')">
                </div>
                <div class="input-field">
                <label>user email <sup>*</sup></label>
                <input type="email" name="email" maxlength="20" required placeholder="Enter your email" oninput="this.value.replace(/\s/g,'')">
                </div>
                <div class="input-field">
                <label>user password <sup>*</sup></label>
                <input type="password" name="password" maxlength="20" required placeholder="Enter your password" oninput="this.value.replace(/\s/g,'')">
                </div>
                <div class="input-field">
                <label>confirm password <sup>*</sup></label>
                <input type="password" name="cpassword" maxlength="20" required placeholder="confirm password" oninput="this.value.replace(/\s/g,'')">
                </div>
                <div class="input-field">
                <label>select profile <sup>*</sup></label>
                <input type="file" name="image" accept="image/*">
               
                </div>
                <button type="submit" name="register" class="btn">register now</button>
                <p>already have an account ? <a href="login.php">login now</a></p>
                </form>

            </div>
        </section>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script type="text/javascript" src="script.js"></script>


    <?php 
    include '../components/alert.php'; ?>
</body>
</html>