<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <style>
    body {
        margin: 0;
        height: 100vh;
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
    }

    .admin-box {
        background: white;
        width: 360px;
        padding: 40px;
        border-radius: 12px;
        text-align: center;
        box-shadow: 0 12px 30px rgba(0,0,0,0.35);
    }

    .admin-box h2 {
        margin-bottom: 25px;
        color: #2a5298;
        letter-spacing: 2px;
    }

    /* ===== USERNAME INPUT ===== */
    .admin-box input[type=text] {
        width: 100%;
        box-sizing: border-box;
        padding: 14px;
        margin-top: 15px;

        text-align: center;
        font-size: 16px;

        border-radius: 8px;
        border: 2px solid #94a3b8;
        outline: none;
    }

    /* ===== PASSWORD INPUT ===== */
    .admin-box input[type=password] {
        width: 100%;
        box-sizing: border-box;
        padding: 16px;
        margin-top: 15px;

        text-align: center;
        background: #dbeafe;
        color: #2563eb;
        font-size: 18px;
        font-weight: 600;

        letter-spacing: 0.55em;
        border-radius: 10px;
        border: 2px solid #60a5fa;
        outline: none;
    }

    .show {
        margin-top: 12px;
        font-size: 14px;
        color: #333;
    }

    button {
        width: 100%;
        margin-top: 25px;
        padding: 12px;
        font-size: 16px;
        border: none;
        background: #2a5298;
        color: white;
        border-radius: 6px;
        cursor: pointer;
    }

    button:hover {
        background: #1e3c72;
    }

    .error {
        color: red;
        margin-top: 15px;
        font-size: 14px;
    }
</style>

<script>
    function togglePassword() {
        let pwd = document.getElementById("password");
        pwd.type = (pwd.type === "password") ? "text" : "password";
    }
</script>
</head>

<body>

<div class="admin-box">
    <h2>ADMIN LOGIN</h2>

    <form action="adminLogin" method="post">

        <input 
            type="text" 
            name="username" 
            placeholder="ADMIN USERNAME" 
            required
        >

        <input 
            type="password" 
            id="password" 
            name="password" 
            placeholder="ADMIN PASSWORD" 
            required
        >

        <div class="show">
            <input type="checkbox" onclick="togglePassword()"> Show Password
        </div>

        <button type="submit">LOGIN</button>
    </form>

    <div class="error">
        <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
    </div>
</div>

</body>
</html>
