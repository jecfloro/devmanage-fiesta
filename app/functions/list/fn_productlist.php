<?php

declare(strict_types=1);

include '../../connection/MYSQLSERVER.php';
require '../../setting/AESCLASS.php';

date_default_timezone_set("Asia/Manila");
$year_start = date("Y");
$year_end = date("Y") + 1;
$date = date("Y-m-d");
$todaysDate = date("Y-m-d H:i:s");

$sort = $_POST['sort'];
$search = $_POST['search'];
$category = $_POST['category'];
$product = $_POST['product'];
$min = $_POST['min'];
$max = $_POST['max'];

if ($sort == "default") {
    $sortquery = "";
}

if ($sort == "sortLow") {
    $sortquery = " ORDER BY `regularPrice` ASC";
}

if ($sort == "sortHigh") {
    $sortquery = " ORDER BY `regularPrice` DESC";
}

if ($search != "") {
    $searchquery = "";
}

if ($category != "All Category") {
    $categoryquery = " AND FK_mscCategories = $category";
}

if ($product != "All Products") {

    if ($product == "Regular") {
        $categoryquery = " AND isRegular = 1";
    }

    if ($product == "Sale") {
        $categoryquery = " AND isSale = 1";
    }

    if ($product == "Repo") {
        $categoryquery = " AND isRepo = 1";
    }
}

if ($min >= 0 && $max > 0) {
    $rangequery = " AND regularPrice BETWEEN $min AND $max OR salePrice BETWEEN $min AND $max OR repoPrice BETWEEN $min AND $max";
}

try {
    $conn = new PDO("mysql:host=$fa_dbserver;dbname=$fa_dbname", $fa_dbuser, $fa_dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $product = $conn->prepare("SELECT * FROM msc_products LEFT JOIN msc_categories ON msc_products.FK_mscCategories = msc_categories.PK_mscCategories WHERE productName LIKE '%$search%' $categoryquery $rangequery $sortquery");
    $product->execute();
    $cproduct = $product->rowCount();
    $rproduct = $product->fetchall(PDO::FETCH_ASSOC);

    if ($cproduct > 0) {

        $productarr = [];

        for ($aa = 0; $aa < count($rproduct); $aa++) {

            $productname = $rproduct[$aa]["productName"];
            $productsku = $rproduct[$aa]["productSKU"];
            $productdescription = $rproduct[$aa]["productDescription"];
            $productdetailsid = $rproduct[$aa]["FK_detailsId"];
            $productcategory = $rproduct[$aa]["description"];

            $productid = $rproduct[$aa]["PK_mscProducts"];
            $productquantity = $rproduct[$aa]["quantity"];
            $productregularprice = $rproduct[$aa]["regularPrice"];
            $productsaleprice = $rproduct[$aa]["salePrice"];
            $productrepoprice = $rproduct[$aa]["repoPrice"];
            $productstockminimum = $rproduct[$aa]["stockMinimum"];
            $productstockmaximum = $rproduct[$aa]["stockMaximum"];
            $productisregular = $rproduct[$aa]["isRegular"];
            $productissale = $rproduct[$aa]["isSale"];
            $productisrepo = $rproduct[$aa]["isRepo"];
            $productstatus = $rproduct[$aa]["productStatus"];

            $prodarr = array(
                'productid' => $productid,
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
                'productstatus' => $productstatus
            );

            array_push($productarr, $prodarr);
        }

        $response = array('status' => 200, 'productarr' => $productarr);
        echo json_encode($response);
    } else {
        $response = array('status' => 200, 'productarr' => $productarr);
        echo json_encode($response);
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
