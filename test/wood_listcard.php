<?php
$page_title = '木工創客地點列表';
$page_name = 'wood_list';
require __DIR__ . '/../parts/__connect_db.php';
$perPage = 5;
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$t_sql = "SELECT COUNT(1) FROM `a_wood_maker`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = ceil($totalRows / $perPage);

$rows = [];
if ($totalRows > 0) {
    if ($page < 1) {
        header('Location: wood_list.php');
        exit;
    }
    if ($page > $totalPages) {
        header('Location: wood_list.php?page=' . $totalPages);
        exit;
    };

    $sql = sprintf("SELECT * FROM `a_wood_maker` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);
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
        <h3>木工創客地點列表</h3>
    </div>

    <div class="row justify-content-between">
        <div class="col">
            <a href="wood_list.php" class="btn btn-warning choose">列表</a>
            <a href="wood_listcard.php" class="btn btn-warning choose">網格</a>
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

                        <h5 class="card-title">組織名稱: <?= $r['organizer'] ?></h5>
                        <p class="card-text">流水號#: <?= $r['sid'] ?></p>
                        <p class="card-text">地址: <?= $r['address'] ?></p>
                        <p class="card-text">信箱: <?= $r['email'] ?></p>
                        <p class="card-text">手機: <?= $r['mobile'] ?></p>
                        <p class="card-text">每日營業開始時間: <?= $r['open_time'] ?></p>
                        <p class="card-text">每日營業結束時間: <?= $r['close_time'] ?></p>
                        <p class="card-text">介紹: <?= htmlentities($r['introduction']) ?></p>


                        <?php if (isset($_SESSION['admin'])) : ?>
                            <a href="wood_experiencedelete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>" class="btn btn-warning">刪除</a>

                            <a href="wood_experienceedit.php?sid=<?= $r['sid'] ?>" class="btn btn-warning">修改</a>
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