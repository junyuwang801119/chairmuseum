<?php

$page_title = "明細列表";
$page_name = "data_list_detail";

require __DIR__ . '/../parts/__connect_db.php';
$perPage = 10; //每頁有幾筆資料

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;


$pn_sql = "SELECT * FROM `w_product_mainList` ORDER BY sid ASC";
$cate_product_name = $pdo->query($pn_sql)->fetchAll();

$t_sql = sprintf("SELECT COUNT(1) FROM `J_order_detail` WHERE `PO_NO` LIKE '%s'", $_GET['PO_NO']);
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
// exit; //結束程式

$totalPages = ceil($totalRows / $perPage);

$rows = [];
if ($totalRows > 0) {
    $page < 1 ? ($page = 1) : "";
    if ($page > $totalPages) $page = $totalPages;

    $sql  = sprintf("SELECT * FROM `J_order_detail` WHERE `PO_NO` = '%s' LIMIT %s, %s", $_GET['PO_NO'], ($page - 1) * $perPage, $perPage);

    $stmt = $pdo->query($sql);

    $rows = $stmt->fetchAll();
}


?>

<?php

$ds_sql = "SELECT * FROM `J_detail_status` ORDER BY sid ASC";
$cate_destil_status = $pdo->query($ds_sql)->fetchAll();

$q_sql = "SELECT * FROM `J_cart_qualify` ORDER BY sid ASC";
$cate_qualify = $pdo->query($q_sql)->fetchAll();

?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    .dd {
        cursor: pointer;
    }
</style>
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
                <th scope="col">Picture</th>
                <th scope="col">product_name</th>
                <th scope="col">quantity</th>
                <th scope="col">qualify</th>
                <th scope="col">product_status</th>
                <th scope="col"><i class="fas fa-edit"></i></th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $r) : ?>
                <?php
                for ($i = 1; $i <= 2; $i++) {
                    if ($r['qualify'] ==  $i) {
                        $qualify = $cate_qualify[$i - 1]['qualify'];
                    }
                };

                for ($i = 1; $i <= 2; $i++) {
                    if ($r['product_status'] ==  $i) {
                        $product_status = $cate_destil_status[$i - 1]['product_status'];
                    }
                };
                $i = 1;
                while (true) {
                    if ($r['product_name'] == $i) {
                        $product_name = $cate_product_name[$i - 1]['product_name'];
                        break;
                    };
                    $i++;
                };
                $j = 1;
                while (true) {
                    if ($r['product_name'] == $i) {
                        $pic_name = $cate_product_name[$i - 1]['photo'];
                        break;
                    };
                    $j++;
                };

                ?>
                <tr>
                    <td><?= $r['sid'] ?></td>
                    <td><?= $r['PO_NO'] ?></td>
                    <td><img style="width:200px;heigh:100px" src="../uploads/<?= $pic_name ?>"></td>
                    <td><?= $product_name . " " . $r['product_name'] ?></td>
                    <td><?= $r['quantity'] ?></td>
                    <td><?= $qualify ?></td>
                    <td><?= $product_status ?></td>
                    <td><a href="data-edit-detail.php?sid=<?= $r['sid'] ?>"><i class="fas fa-edit"></i></a></td>
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
                    <li class="page-item">
                        <a class="page-link dd" onClick="javascript:history.back(1)">上一頁</a>
                    </li>
                    <!-- <li class="page-item"><a class="page-link" href="page=<?= $page + 1 ?>"><i class="fas fa-arrow-circle-right"></i></a></li> -->
                </ul>

            </nav>
        </div>
    </div>

</div>

<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>