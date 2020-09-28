<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php if ($_GET['age'] >= 18) : ?>
        <img src="./img/old.jpg" alt="">
    <?php else : ?>
        <img src="./img/young.jpeg" alt="">

    <?php endif; ?>
</body>

</html>