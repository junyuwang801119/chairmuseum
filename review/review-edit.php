<?php require __DIR__ . '/../parts/__connect_db.php';
?>

<?php

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: review-insert.php');
    exit;
}

$stars = $pdo->query("SELECT * FROM `w_review_stars`")->fetchAll();

$sql = " SELECT * FROM w_review WHERE sid=$sid";
$row = $pdo->query($sql)->fetch();

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
        width: 500px;
        border: none;
        height: 45px;
        margin-top: 10px;
        height: 45px;

    }

    .form-group textarea {
        width: 500px;
        border: none;
        margin-top: 10px;
    }

    .form-group select {
        width: 500px;
        border: none;
        margin-top: 10px;
        height: 45px;
    }

    .form-group button {
        width: 500px;
        height: 45px;
        margin-bottom: 25px;
        margin-top: 10px;
    }
</style>

<?php require __DIR__ . '/../parts/__navbar.php' ?>



<div class="container">
    <div class="row">
        <h3>填寫評論</h3>
    </div>

    <div class="row">
        <div id="infobar" class="alert alert-success" role="alert" style="display: none ; width:875px">
            A simple success alert—check it out!
        </div>
    </div>
    <div class="row">
        <div class="col">
            <form class="justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>
                <input type="hidden" class="form-control" name="sid" value="<?= $row['sid'] ?>">

                <div class="form-group">
                    <label>購買產品
                        <input type="text" class="form-control" name="buy_product" value="<?= htmlentities($row['buy_product']) ?>">
                    </label>
                </div>

                <div class="form-group">
                    <label>會員姓名
                        <input type="text" class="form-control" name="buy_member" value="<?= htmlentities($row['buy_member']) ?>">
                    </label>
                </div>


                <div class="form-group">
                    <label>評分星星

                        <select class="form-control" name="stars">

                            <?php foreach ($stars as $k => $v) : ?>
                                <option value="<?= $v['name'] ?>" <?= $row['stars'] == $v['name'] ? 'selected' : '' ?>><?= $v['name'] ?></option>
                            <?php endforeach; ?>

                        </select>

                    </label>
                </div>



                <div class="form-group">
                    <label>評論內容
                        <textarea class="form-control" name="review" rows="12" style="resize:none"><?= htmlentities($row['review']) ?></textarea>
                    </label>
                </div>
        </div>

        <div class="col">
            <div class="form-group">
                <div>上傳圖片</div>

                <button type="button" class="btn btn-warning" onclick="file_input.click()">上傳照片</button>

                <input type="hidden" id="photo" name="user_photo" class="form-control" value="<?= htmlentities($row['user_photo']) ?>">
                <div>
                    <img src="../uploads/<?= $row['user_photo'] ?>" alt="" id="myimg" width="500px">
                </div>

            </div>
            <div class="form-group">
                <input type="submit" value="送出評論" class="btn btn-warning">
            </div>


            </form>
        </div>


        <input type="file" id="file_input" name="myfile" style="display: none">
    </div>
</div>


<?php require __DIR__ . '/../parts/__scripts.php' ?>

<script>
    const file_input = document.querySelector('#file_input');
    const photo = document.querySelector('#photo');

    file_input.addEventListener('change', function(event) {
        console.log(file_input.files)
        const fd = new FormData();
        fd.append('myfile', file_input.files[0]);

        fetch('../product/photo-upload-api.php', {
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
        fetch('review-edit-api.php', {
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


<?php require __DIR__ . '/../parts/__html_foot.php'  ?>