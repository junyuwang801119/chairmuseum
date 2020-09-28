<?php require __DIR__ . '/../parts/__connect_db.php' ?>
<?php require __DIR__ . '/../parts/__admin-required.php'; ?>

<?php

$page_title = '編輯產品';
$page_name = 'data-edit';

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: product-list.php');
    exit;
}

$sql = " SELECT * FROM w_product_mainList WHERE sid=$sid";
$row = $pdo->query($sql)->fetch();
if (empty($row)) {
    header('Location: product-list.php');
    exit;
}

$cates = $pdo->query("SELECT * FROM `w_product_categories`")->fetchAll();
$chair_bodys = $pdo->query('SELECT * FROM `w_chair_body`')->fetchAll();
$chair_seats = $pdo->query('SELECT * FROM `w_chair_seat`')->fetchAll();
$chair_brands = $pdo->query('SELECT * FROM `w_chair_designer`')->fetchAll();

$chair_colors = $pdo->query('SELECT * FROM `w_chair_color`')->fetchAll();
?>

<?php require __DIR__ . '/../parts/__html_head.php' ?>

<style>
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
        border: none;
        height: 45px;
        margin-top: 10px;

    }

    .form-group textarea {
        width: 400px;
        border: none;
        margin-top: 10px;
    }

    .form-group select {
        width: 400px;
        border: none;
        margin-top: 10px;
        height: 45px;
    }

    .form-group button {
        width: 400px;
        height: 45px;
        margin-bottom: 25px;
        margin-top: 10px;
    }

    .redstars {
        color: red;
    }

    #infobar {
        margin: auto
    }

    .breadcrumb {
        background-color: #EFF0F0;
    }

    .breadcrumb .breadcrumb-item.active {
        color: #C77334;
    }
</style>

<?php require __DIR__ . '/../parts/__navbar.php' ?>


<div class="container">
    <div class="row">
        <ol class="breadcrumb ">
            <li class="breadcrumb-item "><a class="text-black-50" href="#">後台管理</a></li>
            <li class="breadcrumb-item "><a class="text-black-50" href="#">產品管理</a></li>
            <li class="breadcrumb-item active" aria-current="page">編輯產品</li>
        </ol>
    </div>


    <div class="row">
        <h3>編輯產品</h3>
    </div>


    <div class="row">
        <div id="infobar" class="alert alert-dark" role="alert" style="display: none ; width:875px">
            A simple success alert—check it out!
        </div>
    </div>


    <div class="row">
        <form class="d-flex" name="form1" onsubmit="checkForm(); return false;" novalidate>
            <div class=" col">
                <input type="hidden" name="sid" value="<?= $row['sid'] ?>">
                <div>
                    <div class="form-group">
                        <label><span class="redstars">** </span>產品編號
                            <input type="text" class="form-control" name="product_no" value="<?= htmlentities($row['product_no']) ?>">
                        </label>
                    </div>

                    <div class="form-group">
                        <label><span class="redstars">** </span>產品名稱
                            <input type="text" class="form-control" name="product_name" value="<?= htmlentities($row['product_name']) ?>">
                        </label>
                    </div>

                    <div class="form-group">
                        <label>產品描述
                            <textarea class="form-control" style="resize:none" name="description" rows="10"><?= htmlentities($row['description']) ?></textarea>
                        </label>
                    </div>

                    <div class="form-group">
                        <label><span class="redstars">** </span>產品價格
                            <input type="text" class="form-control" name="price" value="<?= htmlentities($row['price']) ?>">
                        </label>
                    </div>

                    <div class="form-group">
                        <label><span class="redstars">** </span>產品類別


                            <select class="form-control" name="category">

                                <?php foreach ($cates as $k => $v) : ?>
                                    <option value="<?= $v['name'] ?>" <?= $row['category'] == $v['name'] ? 'selected' : '' ?>><?= $v['name'] ?></option>
                                <?php endforeach; ?>

                            </select>


                        </label>
                    </div>


                    <div class="form-group">
                        <label><span class="redstars">** </span>顏色
                            <select class="form-control" name="color" value="<?= htmlentities($row['color']) ?>">
                                <?php foreach ($chair_colors as $k => $v) : ?>
                                    <option value="<?= $v['name'] ?>" <?= $row['color'] == $v['name'] ? 'selected' : '' ?>><?= $v['name'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </label>
                    </div>




                    <div class="form-group">
                        <label><span class="redstars">** </span>椅身材質
                            <select class="form-control" name="chair_body">

                                <?php foreach ($chair_bodys as $k => $v) : ?>
                                    <option value="<?= $v['name'] ?>" <?= $row['chair_body'] == $v['name'] ? 'selected' : '' ?>><?= $v['name'] ?></option>
                                <?php endforeach; ?>

                                <!-- name 負責 POST 寫在 <select>
                                value 負責讀值寫在<option>
                                value的值＝椅身材質這張表 的 這筆資料 的 name
                                當 這筆資料(value的值) 等於 在 產品主表 的 chairbody欄位時 會被選取

                                因此你的是用sid 設置，所以你的
                                value的值＝椅身材質這張表 的 這筆資料 的 sid
                                當 這筆資料(value的值) 等於 在 產品主表 的 chairbody欄位時 會被選取
                            -->

                            </select>
                        </label>
                    </div>

                    <div class="form-group">
                        <label><span class="redstars">** </span>椅墊材質
                            <select class="form-control" name="chair_seat">
                                <?php foreach ($chair_seats as $k => $v) : ?>
                                    <option value="<?= $v['name'] ?>" <?= $row['chair_seat'] == $v['name'] ? 'selected' : '' ?>><?= $v['name'] ?></option>
                                <?php endforeach; ?>

                            </select>
                        </label>
                    </div>

                    <div class="form-group">
                        <label><span class="redstars">** </span>品牌
                            <select class="form-control" name="designer" value="<?= htmlentities($row['designer']) ?>">
                                <?php foreach ($chair_brands as $k => $v) : ?>
                                    <option value="<?= $v['name'] ?>" <?= $row['designer'] == $v['name'] ? 'selected' : '' ?>><?= $v['name'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </label>
                    </div>


                </div>
            </div>

            <div class="col">



                <div class="form-group">
                    <div>產品圖</div>
                    <button type="button" class="btn btn-warning" onclick="file_input.click()">上傳照片</button>

                    <input type="hidden" id="photo" name="photo" class="form-control" value="<?= htmlentities($row['photo']) ?>">
                    <div>
                        <img src="../uploads/<?= $row['photo'] ?>" alt="" id="myimg" width="400px">
                    </div>


                </div>



                <div class="form-group">
                    <label>Hashtag
                        <textarea class="form-control" style="resize:none" name="hashtag" rows="5"><?= htmlentities($row['hashtag']) ?></textarea>
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>上架日期
                        <input type="date" class="form-control" name="on_shelf_time" value="<?= htmlentities($row['on_shelf_time']) ?>">
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>下架日期
                        <input type="date" class="form-control" name="off_shelf_time" value="<?= htmlentities($row['off_shelf_time']) ?>">
                    </label>
                </div>

                <div class="form-group">
                    <label>最後修改時間
                        <input type="text" class="form-control" name="last_edit_time" value="<?= htmlentities($row['last_edit_time']) ?>" disabled>
                    </label>
                </div>



                <div class="form-group">
                    <input type="submit" value="修改送出" class="btn btn-warning">
                </div>

            </div>
        </form>
        <input type="file" id="file_input" name="myfile" style="display: none">
    </div>

</div>


<?php require __DIR__ . '/../parts/__scripts.php' ?>

<script>
    const $inforbar = document.querySelector('#infobar');

    file_input.addEventListener('change', function(event) {
        console.log(file_input.files)
        const fd = new FormData();
        fd.append('myfile', file_input.files[0]);

        fetch('photo-upload-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                photo.value = obj.filename;
                document.querySelector('#myimg').src = '../uploads/' + obj.filename;
            });
    });

    function checkForm() {
        const fd = new FormData(document.form1);
        fetch('product-edit-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log(obj);

                if (obj.success) {
                    infobar.innerHTML = '修改成功';
                    infobar.className = "alert alert-dark";

                    setTimeout(() => {
                        location.href = '<?= $_SERVER['HTTP_REFERER'] ?? " data-list.php" ?>';
                    }, 2000)

                } else {
                    infobar.innerHTML = obj.error || '資料沒有修改';
                    infobar.className = "alert alert-dark";

                    setTimeout(() => {
                        location.href = '<?= $_SERVER['HTTP_REFERER'] ?? " data-list.php" ?>';
                    }, 2000)
                }
                infobar.style.display = 'block';
            })
    }
</script>


<?php require __DIR__ . '/../parts/__html_foot.php' ?>