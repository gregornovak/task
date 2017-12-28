<?php

class Parser
{
    public $url = 'https://admin.b2b-carmarket.com//test/project';
    public $sorted_data = [];
    public $c;

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

    public function parseData()
    {
        $this->c = curl_init();
        curl_setopt($this->c, CURLOPT_URL, $this->url);
        curl_setopt($this->c, CURLOPT_HEADER, 0);
        curl_setopt($this->c, CURLOPT_RETURNTRANSFER, true);
        
        $result = curl_exec($this->c);
        $array = explode('<br>', $result);
        $pointers = explode(',', trim($array[0]));
        
        
        for($i = 1; $i < count($array); $i++) {
            $temp = explode(',', trim($array[$i]));
        
            for($j = 0; $j < count($pointers); $j++) {
                $this->sorted_data[$i - 1][$pointers[$j]] = ($j < 4) ? (int)$temp[$j] : $temp[$j];
            }
        }
        
        curl_close($this->c);
    }

    public function fillDatabase() 
    {
        $stmt = $this->conn->query("SET foreign_key_checks = 0;");
        $added_users = [];
        
        foreach($this->sorted_data as $key => $row) {
            if(!in_array($row['BuyerID'], $added_users)) {
                $stmt = $this->conn->prepare("INSERT INTO buyer VALUES(?, ?, ?)");
                $stmt->execute([$row['BuyerID'],$this->randomName(), $this->randomLastName()]);   
                $added_users[] = $row['BuyerID'];
            }
           
            
            $stmt = $this->conn->prepare("INSERT INTO sales(vehicle_id, inhouse_seller_id, buyer_id, model_id, sale_date, buy_date) VALUES(?, ?, ?, ?, ?, ?)");
            $stmt->execute([$row['VehicleID'],$row['InhouseSellerID'],$row['BuyerID'],$row['ModelID'],$row['SaleDate'],$row['BuyDate']]);
        }

        $stmt = $this->conn->query("SET foreign_key_checks = 1;");
    }

    public function randomName()
    {
        $name_list = [
            'Ana', 
            'Boris', 
            'David', 
            'Esmeralda', 
            'Franc', 
            'Grega', 
            'Hilda', 
            'Ida', 
            'Janko', 
            'Kaja', 
            'Luka', 
            'Mihela', 
            'Nina', 
            'Oma', 
            'Primož', 
            'Rudi', 
            'Silva'
        ];

        $random_int = rand(0, count($name_list) - 1);
        return $name_list[$random_int];
    }

    public function randomLastName()
    {
        $last_name_list = [
            'Arh',
            'Brinovec', 
            'Cvetko', 
            'Čuk', 
            'Dolinar', 
            'Erman', 
            'Farazin', 
            'Gros', 
            'Hočevar', 
            'Irman', 
            'Jereb', 
            'Krepek', 
            'Lah', 
            'Matko', 
            'Nemšak', 
            'Obrez', 
            'Petek'
        ];

        $random_int = rand(0, count($last_name_list) - 1);
        return $last_name_list[$random_int];
    }

}

$parse = new Parser();
$parse->parseData();
$parse->fillDatabase();