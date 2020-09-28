<?php
$page_title = '文章列表';
$page_name = 'title_data_list';
require __DIR__ . '/../parts/__connect_db.php';
$perPage = 10;
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$t_sql = "SELECT COUNT(1) FROM `a_title_mainlist`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = ceil($totalRows / $perPage);

$rows = [];
if ($totalRows > 0) {
    if ($page < 1) {
        header('Location: title_data_list.php');
        exit;
    }
    if ($page > $totalPages) {
        header('Location: title_data_list.php?page=' . $totalPages);
        exit;
    };

    $sql = sprintf("SELECT * FROM `a_title_mainlist` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
}

?>

<?php
$row = $pdo->query("SELECT * FROM `a_title_mainlist` ")->fetch();

$c_sql = "SELECT * FROM a_title_category WHERE sid";
$cates = $pdo->query($c_sql)->fetchAll();
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
</style>

<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">

    <div class="row">
        <h3>文章列表</h3>
    </div>

    <div class="row justify-content-between">
        <div class="col">
            <a href="title_data_list.php" class="btn btn-warning choose">列表</a>
            <a href="title_data_listcard.php" class="btn btn-warning choose">網格</a>
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


    <div class="row">
        <table class="table table-striped">
            <!--`sid`, `title`, `images`, `introduction`, `created_at`, `title_sid`-->
            <thead>
                <tr>
                    <?php if (isset($_SESSION['admin'])) : ?>
                        <th scope="col"><i class="fas fa-trash-alt"></i></th>
                        <th scope="col"><i class="fas fa-edit"></i></th>
                    <?php endif; ?>
                    <th scope="col">#</th>
                    <th scope="col">文章標題</th>
                    <th scope="col">文章圖片</th>
                    <th scope="col">文章介紹</th>
                    <th scope="col">文章發佈日期</th>
                    <th scope="col">文章種類</th>
                </tr>
            </thead>
            <tbody>

                <?php foreach ($rows as $key => $r) : ?>
                    <?php
                    for ($i = 1; $i <= 5; $i++) {
                        if ($r['title_sid'] == $i) {
                            $title_sid = $cates[$i - 1]['title_name'];
                        }
                    };
                    ?>

                    <tr>
                        <?php if (isset($_SESSION['admin'])) : ?>
                            <td><a href="title_data_list_delete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>">
                                    <i class="fas fa-trash-alt my-trash-i"></i>
                                </a></td>
                            <td><a href="title_data_list_edit.php?sid=<?= $r['sid'] ?>"><i class="fas fa-edit"></i></a></td>
                        <?php endif; ?>

                        <!--`sid`, `title`, `images`, `introduction`, `created_at`, `title_sid`-->
                        <td><?= $r['sid'] ?></td>
                        <td style="overflow:hidden;white-space:nowrap"><?= $r['title'] ?></td>
                        <td><img src="./../uploads/<?= $r['images'] ?>" alt="" width="100px"></td>
                        <td><?= htmlentities($r['introduction']) ?></td>
                        <td style="overflow:hidden;white-space:nowrap"><?= $r['created_at'] ?></td>
                        <td style="overflow:hidden;white-space:nowrap"><?= $title_sid ?></td>



                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
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
            location.href = 'title_data_list.php?sid=' + sid;
        }
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>