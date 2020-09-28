<?php
$page_title = '設計師資料';
$page_name = 'designer_intro';

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

  <!-- `sid`, `e_designer_sid`, `e_proname`, `e_cate`, 
`e_prointro`, `e_lowprice`, `e_goal`, `e_start_time`, 
`e_end_time`, `e_pro_url`, `e_realize_time`, `e_created_at`SELECT * FROM `e_fund_project` -->

  <table class="table">
    <thead class="thead-dark">
      <tr>


        <th scope="col"><i class="fas fa-trash-alt "></i></th>

        <th scope="col">#</th>
        <!-- <th scope="col">設計師編號</th> -->
        <th scope="col">提案名稱</th>
        <th scope="col">分類</th>
        <th scope="col">圖片</th>
        <th scope="col">提案介紹</th>
        <th scope="col">底價</th>
        <th scope="col">目標金額</th>
        <th scope="col">開始時間</th>
        <th scope="col">結束時間</th>
        <!-- <th scope="col">產品網址</th> -->
        <th scope="col">產品實踐時間</th>
        <th scope="col"><i class="fas fa-pencil-alt"></i></th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($rows as $r) :  ?>
        <tr>
          <td><a href="data-delete.php?sid=<?= $r['sid'] ?>" onclick="ifDel(event)" data-sid="<?= $r['sid'] ?>"><i class="fas fa-trash-alt my-trash-i"></i></a></td>
          <td><?= $r['sid'] ?></td>

          <td><?= strip_tags($r['e_proname']) ?></td>
          <td><?= $r['e_cate'] ?></td>
          <td>
            <img src="/e_img<?= $row['e_pic'] ?>" alt="" width="100px"></td>
          <td><?= strip_tags($r['e_prointro']) ?></td>
          <td><?= strip_tags($r['e_lowprice']) ?></td>
          <td><?= strip_tags($r['e_goal']) ?></td>
          <td><?= $r['e_start_time'] ?></td>
          <td><?= $r['e_end_time'] ?></td>

          <td><?= $r['e_realize_time'] ?></td>

          <td><a href="data-edit.php?sid=<?= $r['sid'] ?>"><i class="fas fa-pencil-alt  mypencil"></i></a></td>

        </tr>
      <?php endforeach; ?>

    </tbody>

  </table>
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

    function ifDel(event) {

      const a = event.currentTarget;
      console.log(event.target, event.currentTarget);
      const sid = a.getAttribute('data-sid');

      //  currentTarget為a  目前抓的東西

      if (!confirm(`是否要刪除編號為 ${sid} 的資料？`)) {
        event.preventDefault();
      }
    }
  </script>
  <?php include __DIR__ . '/../parts/__html_foot.php'; ?>