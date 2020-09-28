<?php
$page_title = '資料列表';
// 1.history 2.trend 3.partner
require __DIR__ . '/../parts/__connect_db.php';

$perPage = 6; // 每頁有幾筆資料
$page_name = 'blog_data_list';

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;

$t_sql = "SELECT COUNT(1) FROM `blog`";

// $sql = "SELECT * FROM `members` LEFT JOIN browsing_history LIMIT 0 , 2;";

$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
// die('~~~'); //exit; // 結束程式
$totalPages = ceil($totalRows / $perPage);

$rows = [];    //這裡有個功能可以再加
if ($totalRows > 0) {
    // if ($page < 1) $page = 1;
    // if ($page > $totalPages) $page = $totalPages;

    //另一種寫法不會reload
    if ($page < 1) {
        header('Location: blog_data_list.php');
        exit;
    }
    if ($page > $totalPages) {
        header('Location: blog_data_list.php?page=' . $totalPages);
        exit;
    };

    $sql = sprintf("SELECT * FROM `blog` LIMIT %s, %s", ($page - 1) * $perPage, $perPage);
    $stmt = $pdo->query($sql);
    $rows = $stmt->fetchAll();
}


// 定義主題，對應資料庫的 theme(number 型態)
$type = array(
    1 => '椅子始源',
    2 => '流行趨勢',
    3 => '廠商合作',
)

?>
<?php include __DIR__ . '/../parts/__html_head.php'; ?>

<style>
    .title {
        margin-top: 30px;
        margin-bottom: 30px;
    }

    .fas1 {
        margin-left: 30px;
        font-size: 20px;
    }

    .v_btn {
        margin-left: 40px;
    }

    .row {
        padding: 0 25px;
    }
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container ">
    <div class="title row justify-content-center">
        <h3>部落格列表</h3>
    </div>
    <div class="row justify-content-between">
        <?php foreach ($rows as $r) : ?>
            <div class="card mb-5" style="width: 18rem;">

                <img class="card-img-top" src="../uploads/<?= $r['picture']; ?>" alt="部落格圖片">
                <div class="card-body">
                    <div>#<?= $r['sid'] ?></div>
                    <h5 class="card-title">主題:<?= $type[$r['theme']] ?></h5>
                    <p class="card-text"><?= $r['text'] ?></p>


                    <a href="blog_delete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>">
                        <i class="fas1 fas fa-trash-alt"></i>
                    </a>

                    <a href="blog_edit.php?sid=<?= $r['sid'] ?>"><i class="fas1 fas fa-edit"></i></a>

                    <a href="../product/product-card.php" class="v_btn btn btn-primary">購買連結</a>
                </div>
            </div>
        <?php endforeach; ?>

        <?php
        // css 版面問題，自己填充以利排版
        if (count($rows) % 3 == 2) {
            echo '<div class="filling_card mb-5" style="width: 18rem;"></div>';
        }
        ?>

    </div>


    <div class="row justify-content-center pt-5 pb-3">

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
            location.href = 'v_delete.php?sid='
            sid;
        }
    }
</script>

<?php include __DIR__ . '/../parts/__html_foot.php'; ?>


<style>
</style>