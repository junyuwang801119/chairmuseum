<?php
$page_title = '會員贊助紀錄';
$page_name = 'data-frecord';

require __DIR__ . '/../parts/__connect_db.php';
$perPage = 5;

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;

$t_sql = "SELECT COUNT(1) FROM `e_frecord`";
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];

$totalPages = ceil($totalRows / $perPage);

$rows = [];

if ($totalRows > 0) {
  if ($page < 1) {
    header('Location: datalist2_delete.php');
    exit;
  }
  if ($page > $totalPages) $page = $totalPages;

  $sql = sprintf("SELECT * FROM `e_frecord`  LIMIT %s, %s", ($page - 1) * $perPage, $perPage);

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

  .form-group input {
    width: 400px;
  }

  .form-group textarea {
    width: 400px;
  }

  .btn {
    margin-bottom: 20px;
    margin-right: 15px;
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
    <!-- <div class="col d-flex justify-content-end">
            <a href="datalist2_delete.php" class="btn btn-info choose">列表檢視</a>
            <a href="datalist2_card.php " class="btn btn-info choose">卡牌檢視</a>
        </div> -->

    <!-- `sid`, `e_designer_sid`, `e_proname`, `e_cate`, 
`e_prointro`, `e_lowprice`, `e_goal`, `e_start_time`, 
`e_end_time`, `e_pro_url`, `e_realize_time`, `e_created_at`SELECT * FROM `e_fund_project` -->

    <table class="table">
      <thead class="thead-dark">
        <tr>


          <!-- <th scope="col"><i class="fas fa-trash-alt "></i></th> -->

          <th scope="col">贊助編號</th>
          <!-- <th scope="col">設計師編號</th> -->
          <th scope="col">會員帳號</th>
          <th scope="col">訂單編號</th>

          <th scope="col">募資編號</th>
          <th scope="col">募資名稱</th>
          <th scope="col">贊助金額</th>
          <th scope="col">贊助時間</th>
          <th scope="col">備註</th>
          <th scope="col"><i class="fas fa-pencil-alt  "></i></th>
          <!-- <th scope="col">產品網址</th> -->


        </tr>
      </thead>
      <tbody>
        <?php foreach ($rows as $r) :  ?>
          <tr>
            <!-- <td><a href="data-delete.php?sid=" onclick="ifDel(event)" data-sid=""><i class="fas fa-trash-alt my-trash-i"></i></a></td> -->
            <td><?= $r['sid'] ?></td>

            <td><?= $r['e_memember_sid'] ?></td>
            <td><?= $r['e_f_order_sid'] ?></td>
            <!-- <td>  -->
            <!-- <img src="../parts/e_img/" alt=""  width="100px"></td> -->
            <td><?= $r['e_fproj_sid'] ?></td>
            <td><?= strip_tags($r['e_f_record_name']) ?></td>
            <td><?= $r['e_f_price'] ?></td>
            <td><?= $r['e_f_time'] ?></td>
            <td><?= $r['note'] ?></td>


            <td><a href="123.php?sid=<?= $r['sid'] ?>"><i class="fas fa-pencil-alt  mypencil"></i></a></td>

          </tr>
        <?php endforeach; ?>

      </tbody>

    </table>
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

      // function ifDel(event){

      //      const a = event.currentTarget;
      //      console.log(event.target, event.currentTarget);
      //      const sid = a.getAttribute('data-sid');

      //     //  currentTarget為a  目前抓的東西

      //     if(! confirm(`是否要編輯編號為 ${sid} 的紀錄？`)){
      //         event.preventDefault();
      //     }
      // }
    </script>
    <?php include __DIR__ . '/../parts/__html_foot.php'; ?>