<?php
    require "koneksi.php";
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response       = array();
    $fullname          = $_POST['fullname'];
    $subdivisi   = $_POST['subdivisi'];
    $location       = $_POST['location'];
    $status       = $_POST['status'];
    $description       = $_POST['description'];
    $target          = $_POST['target'];
    $date_visit   = $_POST['date_visit'];
    $stk_numbers       = $_POST['stk_numbers'];
    $data_gambar       = $_POST['data_gambar'];
    $id_user       = $_POST['id_user'];

    $insert = "INSERT INTO br_masuk VALUE(NULL,
    '$fullname', 
    '$subdivisi', 
    '$location', 
    '$status', 
    '$description', 
    '$target', 
    '$date_visit', 
    '$stk_numbers', 
    '$data_gambar', 
    '$id_user')"; 
        if(mysqli_query($con,$insert)) {
            $response['value'] = 1;
            $response['message'] = "Produk Successfully";
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Produk not Succesfully";
            echo json_encode($response);
        }
}
?>