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

    echo "<div class='alert alert-success' role='alert'>Invoice generated successfully! Total Amount: $$total_amount</div>";
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Invoice</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Generate Invoice</h3>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="generate_invoice.php">
                            <div class="mb-3">
                                <label for="customer_name" class="form-label">Customer Name</label>
                                <input type="text" class="form-control" id="customer_name" name="customer_name"
                                    required>
                            </div>

                            <div class="mb-3">
                                <label for="products" class="form-label">Select Products</label>
                                <select class="form-select" id="products" name="products[]" multiple required>
                                    <?php
                                    include 'db_connect.php'; // Your database connection
                                    $product_query = "SELECT * FROM product_mst";
                                    $product_result = mysqli_query($conn, $product_query);
                                    while ($row = mysqli_fetch_assoc($product_result)) {
                                        echo "<option value='{$row['product_id']}'>{$row['product_name']} (Stock: {$row['product_stock']})</option>";
                                    }
                                    ?>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="quantities" class="form-label">Quantity (in order of selected
                                    products)</label>
                                <input type="number" class="form-control" id="quantities" name="quantities[]" min="1"
                                    required>
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Generate Invoice</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>