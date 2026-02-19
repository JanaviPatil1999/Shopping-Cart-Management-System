<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(120deg, #89f7fe, #66a6ff);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            background: white;
            width: 350px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .login-box input[type="submit"] {
            background: #66a6ff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .login-box input[type="submit"]:hover {
            background: #558de8;
        }

        .login-box p {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .login-box a {
            color: #66a6ff;
            text-decoration: none;
        }
    </style>
</head>

<body>

    <div class="login-box">
        <h2>User Login</h2>

        <form action="login" method="post">
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="Login">
        </form>

        <p>New user? <a href="register.jsp">Register here</a></p>
    </div>

</body>
</html>
