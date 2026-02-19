<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

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

        .register-box {
            background: white;
            width: 380px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .register-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .register-box input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .register-box input[type="submit"] {
            background: #66a6ff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .register-box input[type="submit"]:hover {
            background: #558de8;
        }

        .register-box p {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .register-box a {
            color: #66a6ff;
            text-decoration: none;
        }
    </style>
</head>

<body>

    <div class="register-box">
        <h2>Register Here</h2>

        <form action="register" method="post">
            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="text" name="address" placeholder="Enter Address" required>
            <input type="text" name="phone" placeholder="Enter Phone" required>
            <input type="submit" value="Register">
        </form>

        <p>Already registered? <a href="login.jsp">Login here</a></p>
    </div>

</body>
</html>
