<?php

include './_function.php';

/*
 * Get the hit from sensor and make update on the table 
 * http://localhost:81/ERest/HitService.php?channel=PARKING&id=5&status=FREE
 * http://localhost:81/ERest/HitService.php?channel=TABLE&id=10&status=FREE
 */

$channel = $_GET['channel'];
$status = $_GET['status'];
$id = $_GET['id'];


switch ($channel) {
    case "PARKING":
        echo 'Parking Channel started <br>';
        updateParkingStatus($id, $status);
        break;
    case "TABLE":
        break;
        echo 'Table started ' . $channel;
}

function updateParkingStatus($id, $status) {
    $parkingReservedForNow = isParkingReservedForNow($id);
    if ($parkingReservedForNow) {
        echo 'Reserved';
    } else {
        updateSlotStatus($id, $status);
        //Update the slot table according to the status
    }
}

function isParkingReservedForNow($id) {
    $flag = false;
    $conn = getDBConnection();
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    $sql = "  SELECT *  FROM slot_reservation WHERE NOW() BETWEEN from_time AND to_time
 AND STATUS = 'BUK' AND slotno = '$id' ";
//    echo '<br>'.$sql;
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        $flag = true;
    } else {
        
    }

    mysqli_close($conn);
    return $flag;
}

function updateTableStatus($id, $status) {
    
}

function updateSlotStatus($id, $status) {
    $conn = getDBConnection();
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }
    $sql = "UPDATE slot SET STATUS = '$status' WHERE slotno = '$id'";
    if (mysqli_query($conn, $sql)) {
        echo "<br>slot updated successfully, FREE->".$status;
    } else {
        echo "Error updating record: " . mysqli_error($conn);
    }
    mysqli_close($conn);
}

?>