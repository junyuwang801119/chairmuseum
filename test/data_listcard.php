<?php
$page_title = '體驗資料列表';
$page_name = 'data_list';
require __DIR__ . '/../parts/__connect_db.php';
$perPage = 6;
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$t_sql = "SELECT COUNT(1) FROM `a_experience_mainlist`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = ceil($totalRows / $perPage);

$rows = [];
if ($totalRows > 0) {
    if ($page < 1) {
        header('Location: data_list.php');
        exit;
    }
    if ($page > $totalPages) {
        header('Location: data_list.php?page=' . $totalPages);
        exit;
    };

    $sql = sprintf("SELECT * FROM `a_experience_mainlist` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
}

?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    small.error-msg {
        color: brown;
    }

    .red-stars {
        color: red;
    }

    body {
        background-color: #EFF0F0;
    }

    h3 {
        margin: auto;
        margin-top: 40px;
        margin-bottom: 20px;
    }

    form {
        margin: auto;
        margin-bottom: 100px;
    }

    .form-group {
        margin: 20px;
    }

    .form-group input {
        width: 400px;

        height: 45px;
        margin-top: 10px;
        height: 45px;

    }

    .form-group textarea {
        width: 400px;

        margin-top: 10px;
    }

    .form-group select {
        width: 400px;

        margin-top: 10px;
        height: 45px;
    }

    .form-group button {
        width: 400px;
        height: 45px;
        margin-bottom: 25px;
        margin-top: 10px;
    }


    #infobar {
        margin: auto
    }

    .h123 {
        width: 400px;
        height: 45px;
        margin-bottom: 25px;
        margin-top: 10px;

    }
</style>


<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">
    <div class="row">
        <h3>體驗資料列表</h3>
    </div>

    <div class="row justify-content-between">
        <div class="col">
            <a href="data_list.php" class="btn btn-warning choose">列表</a>
            <a href="data_listcard.php" class="btn btn-warning choose">網格</a>
        </div>

        <div class="col">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-end">
                    <li class="page-item <?= $page == 1 ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page - 1 ?>">
                            <i class="fas fa-arrow-circle-left"></i>
                        </a>
                    </li>
                    <?php for ($i = $page - 2; $i <= $page + 2; $i++) :
                        if ($i < 1) continue;
                        if ($i > $totalPages) break;
                    ?>
                        <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                        </li>
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
                <div class="card mx-2 mb-5">

                    <div class="wrap">
                        <img src="./../uploads/<?= $r['images'] ?>" alt="" width="100%">
                    </div>
                    <div class="card-body">

                        <h5 class="card-title">活動名稱: <?= $r['activitie_name'] ?></h5>
                        <p class="card-text">流水號#: <?= $r['sid'] ?></p>
                        <p class="card-text">活動代碼: <?= $r['activitie_id'] ?></p>
                        <p class="card-text">地址: <?= $r['address'] ?></p>
                        <p class="card-text">師資: <?= $r['teacher'] ?></p>
                        <p class="card-text">體驗開始日期: <?= $r['start_date'] ?></p>
                        <p class="card-text">體驗結束日期: <?= $r['end_date'] ?></p>
                        <p class="card-text">原價: <?= $r['origina_price'] ?></p>
                        <p class="card-text">特價: <?= $r['sale_price'] ?></p>
                        <!--<p class="card-text">報名人數: <?= $r['registered_people'] ?></p>-->
                        <p class="card-text">最低開班人數: <?= $r['low_people'] ?></p>
                        <p class="card-text">截止人數: <?= $r['total_people'] ?></p>
                        <p class="card-text">活動種類: <?= $r['category_sid'] ?></p>
                        <!--<p class="card-text">追蹤: <?= $r['following'] ?></p>-->
                        <!--<p class="card-text">上架: <?= $r['visible'] ?></p>-->

                        <p class="card-text">介紹: <?= htmlentities($r['introduction']) ?></p>


                        <?php if (isset($_SESSION['admin'])) : ?>
                            <a href="data_experiencedelete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>" class="btn btn-warning">刪除</a>

                            <a href="data_experienceedit.php?sid=<?= $r['sid'] ?>" class="btn btn-warning">修改</a>
                        <?php endif; ?>




                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="row">
        <div class="col d-flex justify-content-center">
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
                        <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                        </li>
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

</div>








<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    function ifDel(event) {
        const a = event.currentTarget;
        console.log(event.target, event.currentTarget);
        const sid = a.getAttribute('data-sid');
        if (!confirm(`是否要刪除編號為 ${sid} 的資料?`)) {
            event.preventDefault(); // 取消連往 href 的設定
        }
    }

    function delete_it(sid) {
        if (confirm(`是否要刪除編號為 ${sid} 的資料???`)) {
            location.href = 'data-delete.php?sid=' + sid;
        }
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>