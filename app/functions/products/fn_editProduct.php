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
$ii_productidedit = $_POST['ii_productidedit'];
$ii_productnameedit = $_POST['ii_productnameedit'];
$ii_productunitedit = $_POST['ii_productunitedit'];
$ii_productbrandedit = $_POST['ii_productbrandedit'];
$ii_productmodeledit = $_POST['ii_productmodeledit'];
$ii_productskuedit = $_POST['ii_productskuedit'];
$ii_productcategoryedit = $_POST['ii_productcategoryedit'];
$ii_productdescriptionedit = $_POST['ii_productdescriptionedit'];
$ii_totalquantityedit = $_POST['ii_totalquantityedit'];
$ii_minstockedit = $_POST['ii_minstockedit'];
$ii_maxstockedit = $_POST['ii_maxstockedit'];
$ii_regularpriceedit = $_POST['ii_regularpriceedit'];
$ii_salepriceedit = $_POST['ii_salepriceedit'];
$ii_repopriceedit = $_POST['ii_repopriceedit'];
$ii_productsettingedit = $_POST['ii_productsettingedit'];
$ii_productstatusedit = $_POST['ii_productstatusedit'];
$arrdetails = $_POST['arrdetails'];

$_SESSION["tempproductid"] = $ii_productidedit;

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $select_product = $conn->query("SELECT * FROM `msc_products` WHERE `PK_mscProducts` = '$ii_productidedit'");
    $select_product->execute();
    $cselect_product = $select_product->rowCount();

    if ($cselect_product > 0) {

        $randomId = substr(str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'), 1, 6);

        $ii_detailsencrypt = $randomId;

        if ($ii_productsettingedit == "Regular") {
            $isSetting = "isRegular";
        }
        if ($ii_productsettingedit == "Sale") {
            $isSetting = "isSale";
        }
        if ($ii_productsettingedit == "Repo") {
            $isSetting = "isRepo";
        }

        $update = $conn->prepare("UPDATE msc_products SET productName = '$ii_productnameedit', productUnit = '$ii_productunitedit', productBrand = '$ii_productbrandedit', productModel = '$ii_productmodeledit', productSKU = '$ii_productskuedit', FK_mscCategories = '$ii_productcategoryedit', productDescription = '$ii_productdescriptionedit', quantity = '$ii_totalquantityedit', regularPrice = '$ii_regularpriceedit', salePrice = '$ii_salepriceedit', repoPrice = '$ii_repopriceedit', stockMinimum = '$ii_minstockedit', stockMaximum = '$ii_maxstockedit', $isSetting = 1, productStatus = '$ii_productstatusedit' WHERE PK_mscProducts = '$ii_productidedit'");
        $update->execute();
        $cupdate = $update->rowCount();

        $verify_product = $conn->query("SELECT * FROM `msc_products` WHERE `PK_mscProducts` = '$ii_productidedit'");
        $verify_product->execute();
        $cverify_product = $verify_product->rowCount();
        $rverify_product = $verify_product->fetch(PDO::FETCH_ASSOC);

        $detailsid = $rverify_product["FK_detailsId"];

        $verify_details = $conn->prepare("SELECT * FROM msc_details WHERE detailsId = '$detailsid'");
        $verify_details->execute();
        $cverify_details = $verify_details->rowCount();

        if ($arrdetails != "null") {

            if (count($arrdetails) > 0) {

                $delete = $conn->prepare("DELETE FROM msc_details WHERE detailsId = '$detailsid'");
                $delete->execute();
    
                for ($i = 0; $i < count($arrdetails); $i++) {
                    $ii_detailtitle = $arrdetails[$i]['input1'];
                    $ii_detaildescription = $arrdetails[$i]['input2'];
                    $order = $i + 1;
                    $insertdetails = $conn->prepare("INSERT INTO `msc_details` (`order`, `detailsId`, `title`, `description`) VALUES ('$order','$detailsid', '$ii_detailtitle', '$ii_detaildescription')");
                    $insertdetails->execute();
                }

            }

        } else {

            $delete = $conn->prepare("DELETE FROM msc_details WHERE detailsId = '$detailsid'");
            $delete->execute();

        }

        $response = array('status' => 200, 'message' => "Product Updated!");
        echo json_encode($response);

    } else {
        $response = array('status' => 409, 'message' => "Product not found!");
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
