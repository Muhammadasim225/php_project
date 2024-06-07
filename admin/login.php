<?php
include '../components/connection.php';
session_start();

if (isset($_POST["login"])) {
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $pass = filter_var($_POST['password'], FILTER_SANITIZE_STRING);

    $select_admin = $conn->prepare("SELECT * FROM `admin` WHERE email = ?");
    $select_admin->execute([$email]);

    if ($select_admin->rowCount() > 0) {
        $fetch_admin = $select_admin->fetch(PDO::FETCH_ASSOC);
        $hashed_password = $fetch_admin['password'];

        if (password_verify($pass, $hashed_password)) {
            $_SESSION['admin_id'] = $fetch_admin['id'];
            header("Location: dashboard.php");
        } else {
            $warning_msg[] = 'Incorrect password';
        }
    } else {
        $warning_msg[] = 'Incorrect email';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>green coffee admin panel - login page</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" />
    <link rel="stylesheet" type="text/css" href="admin_style.css?v=<?php echo time(); ?>">
</head>
<body>
    <div class="main">
        <section>
            <div class="form-container" id="admin_login">
                <form action="" method="post" enctype="multipart/form-data">
                    <h3>login now</h3>
                    <div class="input-field">
                        <label>user email <sup>*</sup></label>
                        <input type="email" name="email" maxlength="50" required placeholder="Enter your email" oninput="this.value.replace(/\s/g,'')">
                    </div>
                    <div class="input-field">
                        <label>user password <sup>*</sup></label>
                        <input type="password" name="password" maxlength="50" required placeholder="Enter your password" oninput="this.value.replace(/\s/g,'')">
                    </div>
                    <button type="submit" name="login" class="btn">login now</button>
                    <p>do not have an account? <a href="register.php">register now</a></p>
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
