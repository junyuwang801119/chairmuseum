<?php

$page_title = "資料列表";
$page_name = "order-list";

require __DIR__ . "/../parts/__connect_db.php";
$perPage = 5; //每頁有幾筆資料

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;




$t_sql = 'SELECT COUNT(1) FROM `J_cart_order`';
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
// exit; //結束程式

$totalPages = ceil($totalRows / $perPage);

$rows = [];
if ($totalRows > 0) {
    $page < 1 ? ($page = 1) : "";
    if ($page > $totalPages) $page = $totalPages;

    $sql  = sprintf("SELECT * FROM `J_cart_order` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);

    $stmt = $pdo->query($sql);

    $rows = $stmt->fetchAll();
}




?>

<?php

$q_sql = "SELECT * FROM `J_cart_qualify` ORDER BY sid ASC";
$cate_qualify = $pdo->query($q_sql)->fetchAll();

$os_sql = "SELECT * FROM `J_cart_order_status` ORDER BY sid ASC";
$cate_order_status = $pdo->query($os_sql)->fetchAll();

$ds_sql = "SELECT * FROM `J_cart_delivery_status` ORDER BY sid ASC";
$cate_delivery_status = $pdo->query($ds_sql)->fetchAll();

$mi_sql = "SELECT * FROM `members` ORDER BY sid ASC";
$cate_member_id = $pdo->query($mi_sql)->fetchAll();

?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>

<div class="container">

    <table class="table table-striped">
        <!--`sid`, `PO_NO`, `member`,
         `qualify`, `order_date`, `order_status`,
          `delivery_status`, `point`, `total` 
        -->
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">PO_NO</th>
                <th scope="col">member</th>
                <th scope="col">qualify</th>
                <th scope="col">order_date</th>
                <th scope="col">order_status</th>
                <th scope="col">delivery_status</th>
                <th scope="col">point</th>
                <th scope="col">total</th>
                <th scope="col"><i class="fas fa-edit"></i></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $r) : ?>

                <?php
                switch ($r['order_status']) {
                    case 1:
                        $order_status = $cate_order_status[0]['order_status'];
                        break;
                    case 2:
                        $order_status = $cate_order_status[1]['order_status'];
                        break;
                    case 3:
                        $order_status = $cate_order_status[2]['order_status'];
                        break;
                    case 4:
                        $order_status = $cate_order_status[3]['order_status'];
                        break;
                    default:
                        $order_status = "未判斷";
                }

                switch ($r['delivery_status']) {
                    case 1:
                        $delivery_status = $cate_delivery_status[0]['delivery_status'];
                        break;
                    case 2:
                        $delivery_status = $cate_delivery_status[1]['delivery_status'];
                        break;
                    case 3:
                        $delivery_status = $cate_delivery_status[2]['delivery_status'];
                        break;
                    case 4:
                        $delivery_status = $cate_delivery_status[3]['delivery_status'];
                        break;
                    default:
                        $delivery_status = "未判斷";
                }
                $i = 1;
                while (true) {
                    if ($r['member'] == $i) {
                        $member = $cate_member_id[$i - 1]['name'];
                        break;
                    }
                    $i++;
                };


                // if ($r['delivery_status'] == 3) {
                //     $delivery_status = $cate_delivery_status[2]['delivery_status'];
                // } else {
                //     $delivery_status = '未判斷';
                // }


                ?>

                <tr>
                    <td><?= $r['sid'] ?></td>
                    <td><a href="./data_list_detail.php?PO_NO=<?= $r['PO_NO'] ?>"><?= $r['PO_NO'] ?></a></td>
                    <td><?= $member ?></td>
                    <td><?= ($r['qualify'] == 1) ? $cate_qualify[0]['qualify'] : $cate_qualify[1]['qualify'] ?></td>
                    <td><?= $r['order_date'] ?></td>
                    <td><?= $order_status ?></td>
                    <td><?= $delivery_status ?></td>
                    <td><?= $r['point'] ?></td>
                    <td><?= $r['total'] ?></td>
                    <td><a href="data-edit.php?sid=<?= $r['sid'] ?>"><i class="fas fa-edit"></i></a></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div class="row">
        <div class="col d-flex justify-content-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <!-- <li class="page-item"><a class="page-link" href="page=<?= $page - 1 ?>"><i class="fas fa-arrow-circle-left"></i></a></li> -->
                    <?php for ($i = 1; $i <= $totalPages; $i++) : ?>
                        <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                        </li>
                    <?php endfor; ?>
                    <!-- <li class="page-item"><a class="page-link" href="page=<?= $page + 1 ?>"><i class="fas fa-arrow-circle-right"></i></a></li> -->
                </ul>
            </nav>
        </div>
    </div>

</div>

<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>