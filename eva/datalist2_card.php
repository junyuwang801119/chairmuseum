<?php
$page_title = '募資提案列表';
$page_name = 'data-list(card)';

require __DIR__ . '/../parts/__connect_db.php';
$perPage = 5;

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;

$t_sql = "SELECT COUNT(1) FROM `e_fund_project`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];

$totalPages = ceil($totalRows / $perPage);

$rows = [];

if ($totalRows > 0) {
    if ($page < 1) {
        header('Location: datalist2_delete.php');
        exit;
    }
    if ($page > $totalPages) $page = $totalPages;

    $sql = sprintf("SELECT * FROM `e_fund_project`  LIMIT %s, %s", ($page - 1) * $perPage, $perPage);

    $stmt = $pdo->query($sql);

    $rows = $stmt->fetchAll();
}

// $sql = sprintf("SELECT * FROM `e_fund_project` LIMIT %s, %s");

// $stmt = $pdo->query("SELECT * FROM `e_fund_project` LIMIT ");

// $rows = $stmt->fetchAll();

?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    body {
        background-color: #EFF0F0;
    }

    .my-trash-i {
        color: #153b5f;
        cursor: pointer;
    }

    nav {
        color: #153b5f;
    }


    .mypencil {
        color: #153b5f;
        cursor: pointer;
    }

    .pagination {
        color: #153b5f;
    }

    .page-item {
        color: #153b5f;
    }

    .page-link {
        color: white;
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

    .row {
        margin: auto;
    }


    .btn {
        margin-bottom: 20px;
        margin-right: 15px;
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
        border: 5px 5px 5px grey;


    }

    .wrap {
        background-position: center;
        background-repeat: no-repeat;
    }

    .wrap img {
        width: 100%;
        height: 250px;
        object-fit: fill;
        background-size: fill !Important;
        background-position: fill;
    }
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>

<div class="container">
    <div class="row">
        <div class="col d-flex justify-content-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item <?= $page == 1 ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page - 1 ?> ">
                            <i class="fas fa-arrow-left">

                            </i>
                        </a>
                    </li>
                    <?php for ($i = $page - 3; $i <= $page + 3; $i++) :
                        if ($i < 1) continue;
                        if ($i > $totalPages) break;


                    ?>
                        <li class="page-item  <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>

                        </li>
                    <?php endfor; ?>

                    <li class="page-item <?= $page == $totalPages ? 'disabled' : '' ?>"><a class="page-link" href="?page=<?= $page + 1 ?> "><i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

        </div>
    </div>

    <div class="row">
        <div class="col d-flex justify-content-end">
            <a href="datalist2_delete.php" class="btn btn-info choose">列表檢視</a>
            <a href="datalist2_card.php " class="btn btn-info choose">卡牌檢視</a>
        </div>
    </div>
    <!-- `sid`, `e_designer_sid`, `e_proname`, `e_cate`, 
`e_prointro`, `e_lowprice`, `e_goal`, `e_start_time`, 
`e_end_time`, `e_pro_url`, `e_realize_time`, `e_created_at`SELECT * FROM `e_fund_project` -->


    <div class="row justify-content-center">
        <?php foreach ($rows as $r) : ?>
            <div class="col-4">
                <div class="card mx-2">

                    <div class="wrap">
                        <img src="../uploads/<?= $r['e_pic'] ?>" alt="">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><?= $r['e_proname'] ?></h5>
                        <p class="card-text">提案編號： <?= $r['sid'] ?> </p>
                        <p class="card-text">提案名稱： <?= $r['e_proname'] ?> </p>
                        <p class="card-text">產品分類： <?= $r['e_cate'] ?> </p>
                        <p class="card-text">提案介紹：<br> <?= $r['e_prointro'] ?> </p>
                        <p class="card-text">底價： <?= $r['e_lowprice'] ?> </p>
                        <p class="card-text">目標金額： <?= $r['e_goal'] ?> </p>
                        <p class="card-text">開始時間： <?= $r['e_start_time'] ?> </p>
                        <p class="card-text">結束時間： <?= $r['e_end_time'] ?> </p>
                        <p class="card-text">產品實踐時間： <?= $r['e_realize_time'] ?> </p>
                        <a href="javascript:delete_it(<?= $r['sid'] ?>)" class="btn btn-info"><i class="fas fa-trash-alt "></i></a>
                        <a href="data-edit.php?sid=<?= $r['sid'] ?>" class="btn btn-info"><i class="fas fa-pencil-alt"></i></a>
                    </div>
                </div>
            </div>


        <?php endforeach; ?>
    </div>




    <div class="row">
        <div class="col d-flex justify-content-center">
            <nav aria-label="Page navigation example">
                <ul class="pagination ">
                    <li class="page-item <?= $page == 1 ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page - 1 ?> ">
                            <i class="fas fa-arrow-left">

                            </i>
                        </a>
                    </li>
                    <?php for ($i = $page - 3; $i <= $page + 3; $i++) :
                        if ($i < 1) continue;
                        if ($i > $totalPages) break;


                    ?>
                        <li class="page-item  <?= $i == $page ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>

                        </li>
                    <?php endfor; ?>

                    <li class="page-item <?= $page == $totalPages ? 'disabled' : '' ?>"><a class="page-link" href="?page=<?= $page + 1 ?> "><i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </nav>

        </div>

    </div>

    <?php include __DIR__ . '/../parts/__scripts.php'; ?>
    <script>
        //  const trashes = document.querySelectorAll('.my-trash-i');

        //  const trashHandler = (event) =>{
        //      const t = event.target;
        //      const tr =t.closest('tr');
        //      tr.style.backgroundColor = 'gray'
        //      setTimeout(function(){
        //          tr.remove();
        //      },300)

        //  };

        //  trashes.forEach((el)=>{
        //      el.addEventListener('click',trashHandler);

        //  })
        // table.addEventListener('click', (event)=>{
        //     const t = event.target;
        //     console.log(t.classList.contains('my-trash-i'));

        //     if(t.classList.contains('my-trash-i')){
        //         t.closest('tr').remove();
        //     }
        // })

        function delete_it(sid) {
            if (confirm(`是否要刪除 ${sid}的提案??`)) {
                location.href = 'data-delete.php?sid=' + sid;
            }
        }
    </script>
    <?php include __DIR__ . '/../parts/__html_foot.php'; ?>