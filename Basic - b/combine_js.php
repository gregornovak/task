<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Combine JS files</title>
</head>
<body>
    <script>
    <?php
        foreach(glob("./js/*.js") as $file) {
            include($file);
        }
    ?>
    </script>
</body>
</html>
