<?php
$page_title = '資料列表';
require __DIR__ . '/../parts/__connect_db.php';

$perPage = 10; // 每頁有幾筆資料
$page_name = 'data_list';

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;

$t_sql = "SELECT COUNT(1) FROM `members`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
// die('~~~'); //exit; // 結束程式
$totalPages = ceil($totalRows / $perPage);

$rows = [];    //這裡有個功能可以再加
if ($totalRows > 0) {
    // if ($page < 1) $page = 1;
    // if ($page > $totalPages) $page = $totalPages;

    //另一種寫法不會reload
    if ($page < 1) {
        header('Location: members_data_list.php');
        exit;
    }
    if ($page > $totalPages) {
        header('Location: members_data_list.php?page=' . $totalPages);
        exit;
    };

    $sql = sprintf("SELECT * FROM `members` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
}


?>
<?php include __DIR__ . '/../parts/__html_head.php'; ?>

<style>
    .title {
        margin-top: 30px;
        margin-bottom: 30px;
    }
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">
    <div class="title row justify-content-center">
        <h3>會員列表</h3>
    </div>
    <table class="table table-striped">
        <!-- `sid`, `name`, `email`, `mobile`, `birthday`, `address`, `created_at` -->
        <thead>
            <tr>
                <?php if (isset($_SESSION['admin'])) : ?>
                    <th scope="col"><i class="fas fa-trash-alt"></i></th>
                    <!-- <th scope="col"><i class="fas fa-user-times"></i></th> -->
                <?php endif; ?>
                <th scope="col">#</th>
                <th scope="col">姓名</th>
                <th scope="col">頭像</th>
                <th scope="col">電郵</th>
                <th scope="col">密碼</th>
                <th scope="col">生日</th>
                <th scope="col">手機</th>
                <th scope="col">地址</th>
                <th scope="col">信用卡綁定</th>
                <th scope="col">狀態</th>
                <?php if (isset($_SESSION['admin'])) : ?>
                    <!-- <th scope="col">建立時間</th> -->
                    <th scope="col"><i class="fas fa-edit"></i></th>
                <?php endif; ?>


            </tr>
        </thead>
        <tbody>
            <?php foreach ($rows as $r) : ?>
                <tr>
                    <!-- <td><a href="javascript:"><i class="fas fa-trash-alt"></i></a></td> -->
                    <!-- <td><a href="0827_data_delete.php?sid=<?//= $r['sid'] ?>"><i class="fas fa-trash-alt"></i></a></td> -->
                    <?php if (isset($_SESSION['admin'])) : ?>
                        <td><a href="delete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                        <!-- <td><a href="javascript:delete_it(<?= $r['sid'] ?>)">
                                <i class="fas fa-user-times"></i>
                            </a>
                        </td> -->
                    <?php endif; ?>
                    <td><?= $r['sid'] ?></td>
                    <td><?= $r['name'] ?></td>
                    <td>
                        <img class="avatar_img" src="../uploads/<?= $r['avatar']; ?>" alt="會員頭像">
                    </td>
                    <td><?= $r['email'] ?></td>
                    <td><?= $r['password'] ?></td>
                    <td><?= $r['birthday'] ?></td>
                    <td><?= $r['mobile'] ?></td>
                    <td><?= $r['address'] ?></td>
                    <td><?= $r['visa'] ?></td>
                    <td><?= $r['status'] ?></td>

                    <?php if (isset($_SESSION['admin'])) : ?>

                        <!-- <td><?//= $r['created_at'] ?></td> -->

                        <td><a href="edit.php?sid=<?= $r['sid'] ?>"><i class="fas fa-edit"></i></a></td>

                    <?php endif; ?>



                    <!-- <td><a href="#"><i class="fas fa-edit"></i></a></td> -->
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div class="row justify-content-center">

        <nav aria-label="Page navigation example">
            <ul class="pagination">
                <li class="page-item <?= $page == 1 ? 'disabled' : '' ?>"><a class="page-link" href="?page=<?= $page - 1 ?>"><i class="fas fa-hand-point-left"></i></a></li>
                <?//php for ($i = 1; $i <= $totalPages; $i++) : ?>

                <?php for ($i = $page - 2; $i <= $page + 2; $i++) :
                    if ($i < 1) continue;
                    if ($i > $totalPages) break;
                ?>
                    <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                        <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                    </li>
                <?php endfor; ?>
                <li class="page-item <?= $page == $totalPages ? 'disabled' : '' ?>"><a class="page-link" href="?page=<?= $page + 1 ?>"><i class="fas fa-hand-point-right"></i></a></li>
            </ul>
        </nav>

    </div>
</div>



<?//php for($i=1;$i<=$totalPages;$i++): ?>

<!-- <script>
        const trashes = document.querySelectorAll('.my-trash-i');

        const trashHandler = (event) => {
            const t = event.target;
            const tr = t.closest('tr');
            tr.style.backgroundColor = 'yellow';
            setTimeout(function() {
                tr.remove();
            }, 300);
        };

        trashes.forEach((el) => {
            el.addEventListener('click', trashHandler);
        })
    </script> -->

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
            location.href = 'delete.php?sid='
            sid;
        }
    }
</script>

<?php include __DIR__ . '/../parts/__html_foot.php'; ?>


<style>
    .avatar_img {
        width: 80px;
        height: 80px;
        border: 1px solid gray;
        padding: 3px;
    }
</style>