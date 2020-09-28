<?php

//這是做啥呢？
if (!isset($page_name)) $page_name = '';

?>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">後台管理</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    首頁管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">banner</a>
                    <a class="dropdown-item" href="#">slider</a>
                </div>
            </li>

            <li class="nav-item dropdown <?= $page_name == 'data_list' || 'data-insert'  ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    產品管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../product/product-list.php">產品列表</a>
                    <a class="dropdown-item" href="../product/product-insert.php">新增產品</a>


                </div>
            </li>

            <li class="nav-item dropdown <?= $page_name == 'data_list' || 'data_experienceinsert' || 'wood_experienceinsert' || 'wood_list' || 'title_data_list' || 'title_data_list_insert' ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    體驗管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../test/data_list.php">體驗活動列表</a>
                    <a class="dropdown-item" href="../test/data_experienceinsert.php">新增體驗資料</a>
                    <a class="dropdown-item" href="../test/wood_list.php">木工創客地點表</a>
                    <a class="dropdown-item" href="../test/wood_experienceinsert.php">新增木工創客地點資料</a>
                    <a class="dropdown-item" href="../test/title_data_list.php">文章列表</a>
                    <a class="dropdown-item" href="../test/title_data_list_insert.php">新增文章列表</a>
                </div>
            </li>

            <li class="nav-item dropdown <?= $page_name == 'datalist2_delete' || 'data-insert'  ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    募資管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../eva/datalist2_delete.php">募資商品列表</a>
                    <a class="dropdown-item" href="../eva/data-insert.php">新增募資商品</a>
                    <a class="dropdown-item" href="../eva/data-frecord.php">贊助紀錄</a>
                </div>
            </li>











            <li class="nav-item dropdown <?= $page_name == 'data-list' || 'data-insert' ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    二手管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../secondhand/data-list.php">二手商品表單</a>
                    <a class="dropdown-item" href="../secondhand/data-insert.php">新增二手商品</a>
                </div>
            </li>

            <li class="nav-item dropdown <?= $page_name == 'biddingList' || 'biddingAdd' ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    競標管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../code/biddingList.php">競標商品表單</a>
                    <a class="dropdown-item" href="../code/biddingAdd.php">新增競標商品</a>
                </div>
            </li>

            <li class="nav-item dropdown active">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    留言管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../review/product-card.php">產品</a>
                    <a class="dropdown-item" href="#">體驗</a>
                    <a class="dropdown-item" href="#">募資</a>
                    <a class="dropdown-item" href="#">二手</a>
                    <a class="dropdown-item" href="#">競標</a>
                </div>
            </li>

            <li class="nav-item dropdown <?= $page_name == 'blog_data_list' || 'blog_insert' ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    文章管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../blog/blog_data_list.php">文章列表</a>
                    <a class="dropdown-item" href="../blog/blog_insert.php">新增文章</a>
                </div>
            </li>


            <li class="nav-item dropdown <?= $page_name == 'order-list' || 'ata_list_detail' ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    購物車
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../j_order-master/data_list.php">訂單</a>
                </div>
            </li>

            <li class="nav-item dropdown <?= $page_name == 'members_data_list' || 'insert' ? 'active' : '' ?>">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    會員中心
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../members/members_data_list.php">會員名單</a>
                    <a class="dropdown-item" href="../members/insert.php">新增會員</a>
                    <a class="dropdown-item" href="../members/fake_data.php">新增會員假資料</a>
                </div>
            </li>




        </ul>
        <ul class="navbar-nav">
            <?php if (isset($_SESSION['admin'])) : ?>
                <li class="nav-item">
                    <a class="nav-link">您好！<?= $_SESSION['admin']['nickname'] ?></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../product/log-out.php">登出</a>
                </li>

            <?php else : ?>
                <li class="nav-item <?= $page_name == 'login' ? 'active' : '' ?>">
                    <a class="nav-link" href="../product/log-in.php">登入</a>
                </li>
            <?php endif; ?>

        </ul>

    </div>
</nav>