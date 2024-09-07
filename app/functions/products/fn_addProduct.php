<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$chkbxReturnable = $_POST['chkbxReturnable'];
$ii_productname = $_POST['ii_productname'];
$ii_productsku = $_POST['ii_productsku'];
$ii_productcategory = $_POST['ii_productcategory'];
$ii_productdescription = $_POST['ii_productdescription'];
$ii_totalquantity = $_POST['ii_totalquantity'];
$ii_minstock = $_POST['ii_minstock'];
$ii_maxstock = $_POST['ii_maxstock'];
$ii_regularprice = $_POST['ii_regularprice'];
$ii_saleprice = $_POST['ii_saleprice'];
$ii_repoprice = $_POST['ii_repoprice'];
$arrdetails = $_POST['arrdetails'];
$ii_productsetting = $_POST['ii_productsetting'];
$ii_productstatus = $_POST['ii_productstatus'];

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $ii_productnameencrypt = secureToken::tokenencrypt($ii_productname);
    $ii_productskuencrypt = secureToken::tokenencrypt($ii_productsku);
    $ii_productdescriptionencrypt = secureToken::tokenencrypt($ii_productdescription);

    $select_product = $conn->query("SELECT * FROM `msc_products` WHERE `productName` = '$ii_productnameencrypt'");
    $select_product->execute();
    $cselect_product = $select_product->rowCount();

    if ($cselect_product == 0) {

        $randomId = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 1, 6);

        $ii_detailsencrypt = secureToken::tokenencrypt($randomId);

        if ($ii_productsetting == "Regular") {
            $isSetting = "isRegular";
        }
        if ($ii_productsetting == "Sale") {
            $isSetting = "isSale";
        }
        if ($ii_productsetting == "Repo") {
            $isSetting = "isRepo";
        }

        $insert = $conn->prepare("INSERT INTO `msc_products` (productName, productSKU, FK_mscCategories, productDescription, FK_detailsId, quantity, regularPrice, salePrice, repoPrice, stockMinimum, stockMaximum, $isSetting, productStatus) VALUES (
        '$ii_productnameencrypt',
        '$ii_productskuencrypt',
        '$ii_productcategory',
        '$ii_productdescriptionencrypt',
        '$ii_detailsencrypt',
        '$ii_totalquantity',
        '$ii_regularprice',
        '$ii_saleprice',
        '$ii_repoprice',
        '$ii_minstock',
        '$ii_maxstock',
        1,
        '$ii_productstatus'
        )");
        $insert->execute();
        $cinsert = $insert->rowCount();

        for ($i=0; $i < count($arrdetails); $i++) { 
            $ii_detailtitle = $arrdetails[$i]['input1'];
            $ii_detaildescription = $arrdetails[$i]['input2'];
            $order = $i + 1;
            $insertdetails = $conn->prepare("INSERT INTO `msc_details` (`order`, `detailsId`, `title`, `description`) VALUES ('$order','$ii_detailsencrypt', '$ii_detailtitle', '$ii_detaildescription')");
            $insertdetails->execute();
        }

        if ($cinsert > 0) {
            $response = array('status' => 200, 'message' => "Product Added!");
            echo json_encode($response);
        } else {
            $response = array('status' => 500, 'message' => "Server Error, Please contact administrator!");
            echo json_encode($response);
        }

    } else {
        $response = array('status' => 409, 'message' => "Category already exists!");
        echo json_encode($response);
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
