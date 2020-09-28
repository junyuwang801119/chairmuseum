<?php

$page_title = '新增產品';
$page_name = 'data-insert';

require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';
?>

<?php

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
        height: 45px;

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
            <li class="breadcrumb-item active" aria-current="page">新增產品</li>
        </ol>
    </div>
    <div class="row">
        <h3>新增產品</h3>
    </div>

    <div class="row">
        <div id="infobar" class="alert alert-success" role="alert" style="display: none ; width:875px">
            A simple success alert—check it out!
        </div>
    </div>

    <div class="row">

        <form class="d-flex justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>

            <div class="col">

                <div class="form-group">
                    <label><span class="redstars">** </span>產品編號
                        <input type="text" class="form-control" name="product_no">
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>產品名稱
                        <input type="text" class="form-control" name="product_name">
                    </label>
                </div>

                <div class="form-group">
                    <label>產品描述
                        <textarea class="form-control" name="description" rows="10" style="resize:none"></textarea>
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>產品價格
                        <input type="text" class="form-control" name="price" value="5000">
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>產品類別

                        <select class="form-control" name="category">

                            <?php foreach ($cates as $k => $v) : ?>
                                <option><?= $v['name'] ?></option>
                            <?php endforeach; ?>

                        </select>

                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>顏色
                        <select class="form-control" name="color">
                            <?php foreach ($chair_colors as $k => $v) : ?>
                                <option><?= $v['name'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>椅身材質
                        <select class="form-control" name="chair_body">
                            <?php foreach ($chair_bodys as $k => $v) : ?>
                                <option><?= $v['name'] ?></option>
                            <?php endforeach; ?>

                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>椅墊材質
                        <select class="form-control" name="chair_seat">
                            <?php foreach ($chair_seats as $k => $v) : ?>
                                <option><?= $v['name'] ?></option>
                            <?php endforeach; ?>

                        </select>
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>品牌
                        <select class="form-control" name="designer">

                            <?php foreach ($chair_brands as $k => $v) : ?>
                                <option><?= $v['name'] ?></option>
                            <?php endforeach; ?>

                        </select>
                    </label>
                </div>


            </div>

            <div class="col">

                <div class="form-group">
                    <div>產品圖</div>

                    <button type="button" class="btn btn-warning" onclick="file_input.click()">上傳照片</button>

                    <input type="hidden" id="photo" name="photo" class="form-control">
                    <div>
                        <img src="../uploads/<?= $row['photo'] ?>" alt="" id="myimg" width="400px">
                    </div>

                </div>




                <div class="form-group">
                    <label>Hashtag
                        <textarea class="form-control" name="hashtag" rows="5" style="resize:none">#丹麥椅</textarea>
                    </label>
                </div>






                <div class="form-group">
                    <label><span class="redstars">** </span>上架日期
                        <input type="date" class="form-control" name="on_shelf_time">
                    </label>
                </div>

                <div class="form-group">
                    <label><span class="redstars">** </span>下架日期
                        <input type="date" class="form-control" name="off_shelf_time">
                    </label>
                </div>

                <div class="form-group">
                    <input type="submit" value="上架" class="btn btn-warning">
                </div>


            </div>

        </form>

        <input type="file" id="file_input" name="myfile" style="display: none">
    </div>

</div>


<?php require __DIR__ . '/../parts/__scripts.php'; ?>

<script>
    // formData.append('欄位名稱', fileField.files[0]);
    // fileField.files[0] : 欄位的值，files為element屬性 FileList 
    // console.log()   FileList 似array
    // 什麼是FormData()?? creates a new FormData object.
    // 將輸入資料變成key:value的object方式傳送

    const file_input = document.querySelector('#file_input');
    const photo = document.querySelector('#photo');

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
        fetch('product-insert-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log(obj);
                if (obj.success) {
                    infobar.innerHTML = '新增成功';
                    infobar.className = "alert alert-dark";

                    setTimeout(() => {
                        location.href = 'product-list.php';
                    }, 2000)

                } else {
                    infobar.innerHTML = obj.error || '新增失敗';
                    infobar.className = "alert alert-dark";
                    submitBtn.style.display = 'block';

                    setTimeout(() => {
                        location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "data-list.php" ?>';
                    }, 2000)
                }
                infobar.style.display = 'block';
            })

    }
</script>

<?php require __DIR__ . '/../parts/__html_foot.php'; ?>