<?php
include 'db_connect.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $customer_name = $_POST['customer_name'];
    $product_ids = $_POST['products'];
    $quantities = $_POST['quantities'];

    $total_amount = 0;

    // Validate product stock availability
    for ($i = 0; $i < count($product_ids); $i++) {
        $product_id = $product_ids[$i];
        $quantity = $quantities[$i];

        $product_query = "SELECT * FROM product_mst WHERE product_id = $product_id";
        $product_result = mysqli_query($conn, $product_query);
        $product = mysqli_fetch_assoc($product_result);

        if ($product['product_stock'] < $quantity) {
            die("Error: Not enough stock for {$product['product_name']}");
        }
        $total_amount += $quantity * 100; // Assume each product costs $100 for simplicity
    }

    // Store invoice data into the database
    $invoice_query = "INSERT INTO invoice_mst (customer_name, total_amount) VALUES ('$customer_name', '$total_amount')";
    mysqli_query($conn, $invoice_query);

    // Update product stock in the database
    for ($i = 0; $i < count($product_ids); $i++) {
        $product_id = $product_ids[$i];
        $quantity = $quantities[$i];
        $update_stock_query = "UPDATE product_mst SET product_stock = product_stock - $quantity WHERE product_id = $product_id";
        mysqli_query($conn, $update_stock_query);
    }

    echo "Invoice generated successfully! Total Amount: $$total_amount";
}
