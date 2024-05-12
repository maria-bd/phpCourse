<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if the 'region' field is set and not empty
    if (isset($_POST['region']) && !empty($_POST['region'])) {
        $selected_region = $_POST['region'];
        // Now you can do whatever you want with $selected_region
    } else {
        echo "Please select a region.";
    }
}
?>
