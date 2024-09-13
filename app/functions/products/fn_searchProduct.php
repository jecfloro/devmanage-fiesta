<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$ProductID = $_POST['ProductID'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $product = $conn->prepare("SELECT * FROM msc_products LEFT JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE PK_mscProducts = '$ProductID'");
    $product->execute();
    $cproduct = $product->rowCount();
    $rproduct = $product->fetchall(PDO::FETCH_ASSOC);

    if ($cproduct > 0) {

        $productname = $rproduct[0]["productName"];
        $productsku = $rproduct[0]["productSKU"];
        $productdescription = $rproduct[0]["productDescription"];
        $productdetailsid = $rproduct[0]["FK_detailsId"];
        $productcategory = $rproduct[0]["description"];
        
        $productquantity = $rproduct[0]["quantity"];
        $productregularprice = $rproduct[0]["regularPrice"];
        $productsaleprice = $rproduct[0]["salePrice"];
        $productrepoprice = $rproduct[0]["repoPrice"];
        $productstockminimum = $rproduct[0]["stockMinimum"];
        $productstockmaximum = $rproduct[0]["stockMaximum"];
        $productisregular = $rproduct[0]["isRegular"];
        $productissale = $rproduct[0]["isSale"];
        $productisrepo = $rproduct[0]["isRepo"];
        $productstatus = $rproduct[0]["productStatus"];

        $productdetails = $conn->prepare("SELECT `order`, `title`, `description` FROM msc_details WHERE detailsId = '$productdetailsid' ORDER BY `order` ASC");
        $productdetails->execute();
        $cproductdetails = $productdetails->rowCount();
        $rproductdetails = $productdetails->fetchall(PDO::FETCH_ASSOC);

        $response = array('status' => 200, 
            'productname' => $productname,
            'productsku' => $productsku,
            'productdescription' => $productdescription,
            'productcategory' => $productcategory,
            'productquantity' => $productquantity,
            'productregularprice' => $productregularprice,
            'productsaleprice' => $productsaleprice,
            'productrepoprice' => $productrepoprice,
            'productstockminimum' => $productstockminimum,
            'productstockmaximum' => $productstockmaximum,
            'productisregular' => $productisregular,
            'productissale' => $productissale,
            'productisrepo' => $productisrepo,
            'productstatus' => $productstatus,
            'productdetails' => $rproductdetails
        );
        echo json_encode($response);
        
    } else {
        $response = array('status' => 500, 'message' => "System Error, Please contact administrator!");
        echo json_encode($response);
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
