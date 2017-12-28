<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <title>Car sales</title>
</head>
<body>
    <table id="table" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Vehicle ID</th>
                <th>Inhouse seller ID</th>
                <th>Buyer ID</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Model ID</th>
                <th>Sale date</th>
                <th>Buy date</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Vehicle ID</th>
                <th>Inhouse seller ID</th>
                <th>Buyer ID</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Model ID</th>
                <th>Sale date</th>
                <th>Buy date</th>
            </tr>
        </tfoot>
    </table>
    <script>
    $(document).ready(function() {
        
        $('#table').DataTable( {
            "ajax": { 
                'url': 'Datatables.php'
            },
            "processing": true,
            "serverSide": true,
            "columns": [
                { "data": "vehicle_id" },
                { "data": "inhouse_seller_id" },
                { "data": "buyer_id" },
                { "data": "name" },
                { "data": "surname" },
                { "data": "model_id" },
                { "data": "sale_date" },
                { "data": "buy_date" }
            ]

        });
    });
    </script>
</body>
</html>