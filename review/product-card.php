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

    $sql = sprintf("SELECT * FROM `w_review` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);

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
        width: 90px;
        height: 40px;


    }

    .card {
        /* width: 300px; */
        margin-top: 30px;
        min-height: 600px;
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
        height: 350px;
        object-fit: cover;
        background-size: cover !Important;
        background-position: center;
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
            <li class="breadcrumb-item "><a class="text-black-50" href="#">留言管理</a></li>
            <li class="breadcrumb-item active" aria-current="page">產品回饋</li>
        </ol>
    </div>
    <div class="row">
        <h3>我的評價</h3>

    </div>
    <div class="row justify-content-between">
        <div class="col">
            <!-- <a href="product-list.php" class="btn btn-warning choose">列表</a> -->
            <!-- <a href="product-card.php " class="btn btn-warning choose">網格</a> -->
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

                        <?php if (empty($r['review'])) : ?>


                        <?php else : ?>
                        <?php endif ?>

                        <img src="../uploads/<?= $r['user_photo'] ?>" alt="">


                    </div>
                    <div class="card-body">
                        <h5 class="card-title">購買產品： <?= $r['buy_product'] ?> </h5>
                        <?php if (empty($r['review'])) : ?>
                            <p>等待您的評價</p>

                        <?php else : ?>
                            <p class="card-text"> <?= $r['stars'] ?> </p>
                            <p class="card-text"> <?= $r['review'] ?> </p>
                        <?php endif ?>






                        <?php if (empty($r['review'])) : ?>

                            <a href="review-edit.php?sid=<?= $r['sid'] ?>" class="btn btn-warning">我要評論</a>

                        <?php else : ?>

                            <a href="review-edit.php?sid=<?= $r['sid'] ?>" class="btn btn-warning">修改評論</a>


                            <a href="javascript:delete_it(<?= $r['sid'] ?>)" class="btn btn-warning">刪除評論</a>

                        <?php endif ?>




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
            location.href = 'review-delete.php?sid=' + sid;
        }
    }
</script>

<?php require __DIR__ . '/../parts/__html_foot.php'  ?>