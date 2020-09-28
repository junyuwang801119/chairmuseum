<?php
$page_title = '產品列表';
$page_name = 'data-list';

require __DIR__ . '/../parts/__connect_db.php';

$perPage = 21;
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$t_sql = "SELECT COUNT(1) FROM `w_product_mainList`";
// 這裡看不懂？
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = ceil($totalRows / $perPage);

$rows = [];

if ($totalRows > 0) {
    if ($page < 1) $page = 1;
    if ($page > $totalPages) $page = $totalPages;

    $sql = sprintf("SELECT * FROM `w_product_mainList` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);

    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
};

// msql_query("string : The SQL query.") sends a query to the currently active database on the server that's associated with the specified link identifier.

// $stmp = $pdo->query("SELECT * FROM `product`");

// fetchAll() : Fetch all results from a result set. Type : Array
//$rows = $stmp->fetchAll();
?>

<?php require __DIR__ . '/../parts/__html_head.php' ?>

<style>
    .row {

        margin: auto;
    }

    body {
        background-color: #EFF0F0;
    }

    h3 {
        margin: auto;
        margin-top: 40px;
        margin-bottom: 20px;
    }

    img {
        width: 100%;
    }

    .card a {
        width: 138px;
        height: 40px;

    }

    .card {
        /* width: 300px; */
        margin-top: 30px;
        margin-bottom: 30px;
        border: none;
    }

    /* .choose {
        margin: 30px 0px 30px 0px !Important;
        border-radius: 0px;
    } */

    .pagination>li>a {
        background-color: white;
        color: darkgray;
    }

    .pagination>li>a:focus,
    .pagination>li>a:hover,
    .pagination>li>span:focus,
    .pagination>li>span:hover {
        color: #5a5a5a;
        background-color: #eee;
        border-color: #ddd;
    }

    .pagination>.active>a {
        color: white;
        background-color: #C77334 !Important;
        border: solid 1px #ddd !Important;
    }

    .pagination>.active>a:hover {
        background-color: #C77334 !Important;
        border: solid 1px #5A4181;
    }

    .wrap {
        /* background-position: center; */
        background-repeat: no-repeat;
    }

    .wrap img {
        width: 100%;
        height: 450px;
        object-fit: cover;
        background-size: cover !Important;
        background-position: center;
    }

    .choose {
        color: #5F6B6B;
        cursor: pointer;
    }

    .choose:hover {
        color: #C77334;
    }

    .breadcrumb {
        background-color: #EFF0F0;
    }

    .breadcrumb .breadcrumb-item.active {
        color: #C77334;
    }
</style>

<?php require __DIR__ . '/../parts/__navbar.php' ?>

<div class="container">
    <div class="row">
        <ol class="breadcrumb ">
            <li class="breadcrumb-item "><a class="text-black-50" href="#">後台管理</a></li>
            <li class="breadcrumb-item "><a class="text-black-50" href="#">產品管理</a></li>
            <li class="breadcrumb-item active" aria-current="page">產品列表</li>
        </ol>
    </div>
    <div class="row">
        <h3>產品列表</h3>

    </div>
    <div class="row justify-content-between">
        <div class="col ">

            <a href="product-list.php" class="btn btn-light choose"><i class="fas fa-list"></i></a>
            <a href="product-card.php " class="btn btn-light choose"><i class="fas fa-th"></i></a>
        </div>

        <div class="col ">

            <nav aria-label="Page navigation example ">
                <ul class="pagination justify-content-end align-items-center">
                    <li class="page-item <?= $page == 1 ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page - 1 ?>">
                            <i class="fas fa-arrow-circle-left"></i>
                        </a>
                    </li>

                    <?php for ($i = $page - 2; $i <= $page + 2; $i++) :
                        if ($i < 1) continue;
                        if ($i > $totalPages) break;
                    ?>

                        <li class="page-item <?= $i == $page ? 'active' : '' ?>"><a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a></li>
                    <?php endfor; ?>

                    <li class="page-item <?= $page == $totalPages ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page + 1 ?>">
                            <i class="fas fa-arrow-circle-right"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>


    </div>



    <div class="row justify-content-center">
        <?php foreach ($rows as $r) : ?>
            <div class="col-4">
                <div class="card mx-2">

                    <div class="wrap">
                        <img src="../uploads/<?= $r['photo'] ?>" alt="">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><?= $r['product_name'] ?></h5>
                        <p class="card-text">SID： <?= $r['sid'] ?> </p>
                        <p class="card-text">產品編號： <?= $r['product_no'] ?> </p>
                        <p class="card-text">產品敘述： <?= $r['description'] ?> </p>
                        <p class="card-text">產品分類： <?= $r['category'] ?> </p>
                        <p class="card-text">顏色： <?= $r['color'] ?> </p>
                        <p class="card-text">椅身材質： <?= $r['chair_body'] ?> </p>
                        <p class="card-text">椅墊材質： <?= $r['chair_seat'] ?> </p>
                        <p class="card-text">品牌： <?= $r['designer'] ?> </p>
                        <p class="card-text">價格： <?= $r['price'] ?> </p>
                        <p class="card-text">Hashtag： <?= $r['hashtag'] ?> </p>
                        <p class="card-text">預約上架時間： <?= $r['on_shelf_time'] ?> </p>
                        <p class="card-text">預約下架時間： <?= $r['off_shelf_time'] ?> </p>
                        <p class="card-text">最後修改時間： <?= $r['last_edit_time'] ?> </p>
                        <?php if (isset($_SESSION['admin'])) : ?>
                            <a href="javascript:delete_it(<?= $r['sid'] ?>)" class="btn btn-warning">刪除</a>
                            <a href="product-edit.php?sid=<?= $r['sid'] ?>" class="btn btn-warning">修改</a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>


        <?php endforeach; ?>
    </div>

    <div class="row justify-content-center">
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item <?= $page == 1 ? 'disabled' : '' ?>">
                    <a class="page-link" href="?page=<?= $page - 1 ?>">
                        <i class="fas fa-arrow-circle-left"></i>
                    </a>
                </li>

                <?php for ($i = $page - 2; $i <= $page + 2; $i++) :
                    if ($i < 1) continue;
                    if ($i > $totalPages) break;
                ?>

                    <li class="page-item <?= $i == $page ? 'active' : '' ?>"><a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a></li>
                <?php endfor; ?>

                <li class="page-item <?= $page == $totalPages ? 'disabled' : '' ?>">
                    <a class="page-link" href="?page=<?= $page + 1 ?>">
                        <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</div>

<?php require __DIR__ . '/../parts/__scripts.php' ?>
<script>
    function delete_it(sid) {
        if (confirm(`是否要刪除 ${sid}的產品資料??`)) {
            location.href = 'product-delete.php?sid=' + sid;
        }
    }
</script>
<?php require __DIR__ . '/../parts/__html_foot.php' ?>