<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        .box {
            width: 400px;
            margin: 60px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px gray;
        }

        h2 {
            text-align: center;
            color: #2a5298;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #2a5298;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #1e3c72;
        }
    </style>
</head>
<body>

<div class="box">
    <h2>Add New Product</h2>

    <form action="addProduct" method="post">
        <input type="text" name="pname" placeholder="Product Name" required>
        <input type="text" name="description" placeholder="Description" required>
        <input type="number" step="0.01" name="price" placeholder="Price" required>
        <input type="text" name="category" placeholder="Category" required>
        <input type="number" name="quantity" placeholder="Quantity" required>
        <input type="text" name="image" placeholder="Image name (shoes1.jpg)" required>

        <button type="submit">Add Product</button>
    </form>
</div>

</body>
</html>
