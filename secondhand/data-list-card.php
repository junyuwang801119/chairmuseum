<?php
$page_title = '二手商品表';
$page_name = 'data-list';
require __DIR__ . '/../parts/__connect_db.php';
$perPage = 6;

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
//用戶決定看第幾頁



$t_sql = "SELECT COUNT(1) FROM `i_secondhand_product`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
// exit;

$totalPages = ceil($totalRows / $perPage);

$rows = [];
if ($totalRows > 0) {
    if ($page < 1) {
        header('Location:data-list.php');
        exit;
    };
    if ($page > $totalPages) {
        header('Location:data-list.php?page=' . $totalPages);
        exit;
    };

    $sql = sprintf("SELECT * FROM `i_secondhand_product` ORDER BY sid DESC LIMIT %s, %s", ($page - 1) * $perPage, $perPage);
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
}


$c_sql = "SELECT * FROM i_secondhand_conditions ORDER BY sid ASC";
$cates = $pdo->query($c_sql)->fetchAll();

?>

<?php
$row = $pdo->query("SELECT * FROM `i_secondhand_product` ")->fetch();

$c_sql = "SELECT * FROM i_secondhand_conditions ORDER BY sid ASC";
$cates = $pdo->query($c_sql)->fetchAll();

$h_sql = "SELECT * FROM i_secondhand_framework ORDER BY sid ASC";
$framework = $pdo->query($h_sql)->fetchAll();

$v_sql = "SELECT * FROM i_secondhand_material ORDER BY sid ASC";
$material = $pdo->query($v_sql)->fetchAll();

$g_sql = "SELECT * FROM i_secondhand_categories ORDER BY sid ASC";
$categories = $pdo->query($g_sql)->fetchAll();
?>
<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    body {
        background-color: #EFF0F0;
    }



    table.table tr th {
        background-color: #5F6B6B !Important;

        color: white !Important;

    }

    .choose {
        color: #5F6B6B;
        cursor: pointer;
    }

    .choose:hover {
        color: #C77334;
    }

    .fas {
        color: #5F6B6B;
    }

    h3 {
        margin: auto;

        margin-bottom: 20px;
    }

    .redstars {
        color: red;
    }

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

    .right {
        margin-right: 10px;

        margin-bottom: 20px;
    }

    .breadcrumb {
        background-color: #EFF0F0;
    }

    .breadcrumb .breadcrumb-item.active {
        color: #C77334;
    }
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">
    <ol class="breadcrumb ">
        <li class="breadcrumb-item "><a class="text-black-50" href="#">後台管理</a></li>
        <li class="breadcrumb-item "><a class="text-black-50" href="#">二手管理</a></li>
        <li class="breadcrumb-item active" aria-current="page">產品列表</li>
    </ol>

    <!-- `sid`, `product_no`, `productname`, `photo`, `price`, `description`, `stock` -->

    <div class="row justify-content-center">
        <h3>產品列表</h3>
    </div>
    <div class="row justify-content-end right">

        <a href="data-list.php" class="btn btn-light choose"><i class="fas fa-list"></i></a>
        <a href="data-list-card.php " class="btn btn-light choose"><i class="fas fa-th"></i></a>
    </div>
    <?php foreach ($rows as $key => $r) : ?>
        <?php
        for ($i = 1; $i <= 5; $i++) {
            if ($r['conditions_sid'] == $i) {
                $conditions_sid = $cates[$i - 1]['name'];
            }
            if ($r['categories_sid'] == $i) {
                $categories_sid = $categories[$i - 1]['name'];
            }
            if ($r['framework_sid'] == $i) {
                $framework_sid = $framework[$i - 1]['name'];
            }
        };

        switch ($r['material_sid']) {
            case 1:
                $material_sid = $material[0]['name'];
                break;
            case 2:
                $material_sid = $material[1]['name'];
                break;
            case 5:
                $material_sid = $material[2]['name'];
                break;
            default:
                $material_sid = "未知";
        }
        ?>

    <?php endforeach; ?>
    <div class="row justify-content-center">
        <?php foreach ($rows as $r) : ?>
            <div class="col-4">
                <div class="card mx-2">

                    <div class="wrap">
                        <img src="../uploads/<?= $r['photo'] ?>" alt="">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><?= $r['product_no'] ?></h5>

                        <p class="card-text">產品名稱： <?= $r['productname'] ?> </p>
                        <p class="card-text">價錢： <?= $r['price'] ?> </p>
                        <p class="card-text">商品描述： <?= $r['description'] ?> </p>
                        <p class="card-text">庫存： <?= $r['stock'] ?> </p>
                        <p class="card-text">商品狀況： <?= $conditions_sid ?> </p>
                        <p class="card-text">分類： <?= $categories_sid ?> </p>
                        <p class="card-text">材質： <?= $material_sid ?> </p>
                        <p class="card-text">骨架： <?= $framework_sid ?> </p>


                        <?php if (isset($_SESSION['admin'])) : ?>
                            <a href="data-delete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>"><i class="fas fa-trash-alt "></i></a>
                        <?php endif; ?>
                        <?php if (isset($_SESSION['admin'])) : ?>
                            <td><a href="data-edit.php?sid=<?= $r['sid'] ?>"><i class="fas fa-edit"></i></a></td>
                        <?php endif; ?>
                    </div>
                </div>
            </div>


        <?php endforeach; ?>
    </div>
    <div class="row">
        <div class="col d-flex justify-content-center mt-5">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item <?= $page == 1  ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page - 1 ?>">
                            <i class="fas fa-arrow-left"></i>
                        </a>
                    </li>
                    <?php for ($i = $page - 3; $i <= $page + 3; $i++) :
                        if ($i < 1) continue;
                        if ($i > $totalPages) break;
                    ?>
                        <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                        </li>
                    <?php endfor; ?>
                    <li class="page-item <?= $page == $totalPages  ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page + 1 ?>">
                            <i class="fas fa-arrow-right"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    function ifDel(event) {
        // event.preventDefault();//取消連往href的設定
        const a = event.currentTarget;
        console.log(event.target, event.currentTarget);
        const sid = a.getAttribute('data-sid');
        if (!confirm(`是否要刪除編號為${sid}的資料？`)) {
            event.preventDefault();
        }
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>