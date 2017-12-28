<?php

class Datatables
{
    public $host = '127.0.0.1';
    public $user = 'homestead';
    public $pass = 'secret';
    public $dbname = 'car_sales';

    public $conn;
    
    public function __construct()
    {
        try {
            $this->conn = new PDO("mysql:host=$this->host;dbname=$this->dbname;charset=utf8", $this->user, $this->pass);
        } catch(PDOException $e){
            die($e->getMessage());
        }
    }

    public function getData()
    {
        $offset = $_GET['start'];
        $per_page = $_GET['length'];
        $page = $_GET['draw'];

        $query = "SELECT * FROM sales INNER JOIN buyer ON sales.buyer_id = buyer.id ";

        $filter = (!empty($_GET['search']['value']) && strlen($_GET['search']['value']) > 0) ? $_GET['search']['value'] : false;
        if($filter != false) {
            $value = $_GET['search']['value'];
            $query .= "WHERE sales.sale_date LIKE '%$value%' OR buyer.name LIKE '%$value%' OR buyer.surname LIKE '%$value%' ";
        }

        $query .= "LIMIT $offset, $per_page";

        $stmt = $this->conn->query($query);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt2 = $this->conn->query("SELECT COUNT(*) FROM sales");
        $count = $stmt2->fetch();

        $filter_count = $count[0];
        if($filter != false) {
            $stmt3 = $this->conn->query("SELECT COUNT(*) FROM sales INNER JOIN buyer ON sales.buyer_id = buyer.id  WHERE sales.sale_date LIKE '%$value%' OR buyer.name LIKE '%$value%' OR buyer.surname LIKE '%$value%'");
            $filter_count = $stmt3->fetch()[0];
        }

        $data = [
            'recordsTotal' => $count[0],
            'recordsFiltered' => $filter_count,
            'data' => $result
        ];
        echo json_encode($data);
    }
}

$data = new Datatables();
$data->getData();