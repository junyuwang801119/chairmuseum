<?php
$page_title = '產品列表';
$page_name = 'data-list';

require __DIR__ . '/../parts/__connect_db.php';

$perPage = 20;
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

    table.table tr th {
        background-color: #5F6B6B !Important;
        color: white !Important;
    }

    .my-trash-i {
        color: #5F6B6B;
        cursor: pointer;
    }

    .my-edit-i {
        color: #C77334;
        cursor: pointer;
    }


    .form-group input {
        width: 400px;
    }

    .form-group textarea {
        width: 400px;
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
        background-position: center;
        background-size: cover;
        background-repeat: no-repeat;
        width: 150px;
    }

    .wrap img {
        width: 100%;
        height: 150px;
        object-fit: cover
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

<!-- `sid`, `產品編號`, `產品名稱`, `產品描述`, `顏色`, `產品類別`, `材質`, `產品圖`, `產品價格`, `Hashtag`, `上架日期` -->

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
        <div class="col">


            <a href="product-list.php" class="btn btn-light choose"><i class="fas fa-list"></i></a>
            <a href="product-card.php " class="btn btn-light choose"><i class="fas fa-th"></i></a>
        </div>

        <div class="col ">

            <nav aria-label="Page navigation example ">
                <ul class="pagination justify-content-end ">
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
        <table class="table">
            <thead class="thead-dark">
                <tr class="">
                    <?php if (isset($_SESSION['admin'])) : ?>
                        <th scope="col">刪除</th>
                        <th scope="col">編輯</th>
                    <?php endif; ?>
                    <th scope="col">#</th>
                    <th scope="col">產品圖</th>
                    <th scope="col">產品編號</th>
                    <th scope="col">產品名稱</th>
                    <th scope="col">產品描述</th>
                    <th scope="col">產品類別</th>
                    <th scope="col">顏色</th>
                    <th scope="col">椅身材質</th>
                    <th scope="col">椅墊材質</th>
                    <th scope="col">設計師</th>
                    <th scope="col">產品價格</th>
                    <th scope="col">Hashtag</th>
                    <th scope="col">上架日期</th>
                    <th scope="col">下架日期</th>
                    <th scope="col">最後修改時間</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // The foreach construct provides an easy way to iterate over arrays. foreach works only on arrays and objects

                // foreach (array_expression as $value)

                // loops over the array given by array_expression. On each iteration, the value of the current element is assigned to $value

                // INSERT INTO `w_product_mainList`(`sid`, `product_no`, `product_name`, `description`, `category`, `color`, `chair_body`, `chair_seat`, `designer`, `photo`, `price`, `hashtag`, `on_shelf_time`, `off_shelf_time`, `last_edit_time`) VALUES 

                ?>

                <?php foreach ($rows as $r) : ?>
                    <tr class="">
                        <?php if (isset($_SESSION['admin'])) : ?>
                            <td>
                                <a href="javascript:delete_it(<?= $r['sid'] ?>)">
                                    <i class="fas fa-trash-alt my-trash-i"></i>
                                </a>
                            </td>
                            <td>
                                <a href="product-edit.php?sid=<?= $r['sid'] ?>">
                                    <i class="fas fa-edit my-edit-i"></i>
                                </a>
                            </td>
                        <?php endif; ?>
                        <td><?= $r['sid'] ?></td>
                        <td>
                            <div class="wrap">
                                <img src="../uploads/<?= $r['photo'] ?>" alt="" width="150px">
                            </div>
                        </td>
                        <td><?= $r['product_no'] ?></td>
                        <td><?= $r['product_name'] ?></td>
                        <td><?= $r['description'] ?></td>
                        <td><?= $r['category'] ?></td>
                        <td><?= $r['color'] ?></td>
                        <td><?= $r['chair_body'] ?></td>
                        <td><?= $r['chair_seat'] ?></td>
                        <td><?= $r['designer'] ?></td>
                        <td><?= $r['price'] ?></td>
                        <td><?= $r['hashtag'] ?></td>
                        <td><?= $r['on_shelf_time'] ?></td>
                        <td><?= $r['off_shelf_time'] ?></td>
                        <td><?= $r['last_edit_time'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
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

<!-- <script>
    function ifDel(event) {
        // 什麼是 .currentTarget ??
        // 什麼是 .getAttribute() ??
        const a = event.currentTarget;
        const sid = a.getAttribute('data-sid');

        if (!confirm(`是否要刪除 ${sid}的產品資料??`)){
            event.preventDefault();
        }
    }
</script> -->

<!-- <script>
    const trashes = document.querySelectorAll('.my-trash-i');

    const trashHandler = (event) => {
        const t = event.target;
        const tr = t.closest('tr');
        tr.remove();
    };

    trashes.forEach((el) => {
        el.addEventListener('click', trashHandler)
    });
</script> -->

<?php require __DIR__ . '/../parts/__html_foot.php' ?>