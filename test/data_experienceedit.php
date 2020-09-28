<?php
$page_title = '編輯體驗資料';
$page_name = 'data_experienceedit';
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: data_list.php');
    exit;
}

$sql = " SELECT * FROM a_experience_mainlist WHERE sid=$sid";
$row = $pdo->query($sql)->fetch();
if (empty($row)) {
    header('Location: data_list.php');
    exit;
}

$c_sql = "SELECT * FROM a_experience_category WHERE sid";

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
</style>

<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">
    <div class="row">
        <h3>編輯體驗資料</h3>
    </div>

    <div class="row">
        <div id="infobar" class="alert alert-success" role="alert" style="display: none; width:875px">
            A simple success alert—check it out!
        </div>
    </div>

    <div class="row">
        <form class="d-flex justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>
            <input type="hidden" name="sid" value="<?= $row['sid'] ?>">
            <div class="col">

                <div class="form-group">
                    <label for="activitie_name"><span class="red-stars">**</span>1. 活動名稱</label>
                    <input type="text" class="form-control" id="activitie_name" name="activitie_name" required value="<?= htmlentities($row['activitie_name']) ?>">
                    <small class="form-text error-msg">必填</small>
                </div>
                <div class="form-group">
                    <label for="activitie_id"><span class="red-stars">**</span>2. 活動代碼</label>
                    <input type="text" class="form-control" id="activitie_id" name="activitie_id" value="<?= htmlentities($row['activitie_id']) ?>">
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="address"><span class="red-stars">**</span>3. 地址</label>
                    <input type="text" class="form-control" id="address" name="address" value="<?= htmlentities($row['address']) ?>">
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="teacher"><span class="red-stars">**</span>4. 師資</label>
                    <input type="text" class="form-control" id="teacher" name="teacher" value="<?= htmlentities($row['teacher']) ?>">
                    <small class="form-text error-msg">必填</small>
                </div>
                <div class="form-group">
                    <label for="start_date"><span class="red-stars">**</span>5. 體驗開始日期</label>
                    <input type="date" class="form-control" id="start_date" name="start_date" value="<?= htmlentities($row['start_date']) ?>">
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="end_date"><span class="red-stars">**</span>6. 體驗結束日期</label>
                    <input type="date" class="form-control" id="end_date" name="end_date" value="<?= htmlentities($row['end_date']) ?>">
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="origina_price"><span class="red-stars">**</span>7. 原價</label>
                    <input type="text" class="form-control" id="origina_price" name="origina_price" value="<?= htmlentities($row['origina_price']) ?>">
                    <small class="form-text error-msg">免費請填 "0" </small>
                </div>

                <div class="form-group">
                    <label for="sale_price"><span class="red-stars">**</span>8. 特價</label>
                    <input type="text" class="form-control" id="sale_price" name="sale_price" value="<?= htmlentities($row['sale_price']) ?>">
                    <small class="form-text error-msg">免費請填 "0" </small>
                </div>

            </div>

            <div class="col">
                <div class="form-group" style="display: none">
                    <label for="registered_people">已報名人數</label>
                    <input type="text" class="form-control" id="registered_people" name="registered_people" value="<?= htmlentities($row['registered_people']) ?>">
                </div>

                <div class="form-group">
                    <label for="low_people"><span class="red-stars">**</span>9. 最低開班人數</label>
                    <input type="text" class="form-control" id="low_people" name="low_people" value="<?= htmlentities($row['low_people']) ?>">
                    <small class="form-text error-msg">沒有限制人數請填 "0" </small>
                </div>

                <div class="form-group">
                    <label for="total_people"><span class="red-stars">**</span>10. 截止人數</label>
                    <input type="text" class="form-control" id="total_people" name="total_people" value="<?= htmlentities($row['total_people']) ?>">
                    <small class="form-text error-msg">沒有限制人數請填 "0" </small>
                </div>

                <div class="form-group">
                    <label for="category_sid"><span class="red-stars">**</span>11. 活動種類</label>
                    <select class="form-control" id="category_sid" name="category_sid" data-val="<?= $row['category_sid'] ?>">
                        <?php foreach ($cates as $c) : ?>
                            <option value="<?= $c['sid'] ?>"><?= $c['name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                    <small class="form-text error-msg">必選</small>
                </div>

                <div class="form-group" style="display: none">
                    <label for="following">追蹤</label>
                    <input type="text" class="form-control" id="following" name="following" value="<?= htmlentities($row['following']) ?>">
                </div>
                <div class="form-group" style="display: none">
                    <label for="visible">上架</label>
                    <input type="text" class="form-control" id="visible" name="visible" value="<?= htmlentities($row['visible']) ?>">
                </div>


                <div class="form-group">
                    <label for="images"><span class="red-stars">**</span>12. 圖片</label><br>
                    <button type="button" class="btn btn-warning" onclick="file_input.click()">更換主題照</button>
                    <small class="form-text error-msg">請上傳一張主要宣傳圖片</small>
                    <input type="hidden" id="images" name="images" value="<?= $row['images'] ?>">
                    <img src="./../uploads/<?= $row['images'] ?>" alt="" id="myimg" width="400px">
                    <br>

                </div>

                <div class="form-group">
                    <label for="introduction"><span class="red-stars">**</span>13. 介紹</label>
                    <textarea class="form-control" id="introduction" name="introduction" cols="30" rows="3"><?= htmlentities($row['introduction']) ?></textarea>
                    <small class="form-text error-msg">例如:活動簡介、活動流程等</small>
                </div>

                <div class="form-group">
                    <button type="submit" class="h123 btn btn-primary">上架</button>
                </div>
        </form>
        <input type="file" id="file_input" style="display: none">

    </div>


</div>


<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    const $name = document.querySelector('#activitie_name');
    const infobar = document.querySelector('#infobar');
    const submitBtn = document.querySelector('button[type=submit]');
    const $category_sid = document.querySelector('#category_sid');
    let val = $category_sid.getAttribute('data-val');


    const file_input = document.querySelector('#file_input');
    const images = document.querySelector('#images');

    file_input.addEventListener('change', function(event) {
        console.log(file_input.files)
        const fd = new FormData();
        fd.append('myfile', file_input.files[0]);

        fetch('a_upload_single_api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                images.value = obj.filename;
                document.querySelector('#myimg').src = './../uploads/' + obj.filename;
            });
    });


    function checkForm() {
        let isPass = true;

        submitBtn.style.display = 'none';

        if ($name.value.length < 2) {
            isPass = false;
            $name.style.borderColor = 'red';
            $name.nextElementSibling.innerHTML = '請填寫適當的體驗名稱';
        }


        if (isPass) {
            const fd = new FormData(document.form1);
            fetch('data_experienceedit_api.php', {
                    method: 'POST',
                    body: fd
                })
                .then(r => r.json())
                .then(obj => {
                    console.log(obj);
                    if (obj.success) {
                        infobar.innerHTML = '修改成功';
                        infobar.className = "alert alert-success";
                        // if(infobar.classList.contains('alert-danger')){
                        //     infobar.classList.replace('alert-danger', 'alert-success')
                        // }
                        setTimeout(() => {
                            location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "data_list.php" ?>';
                        }, 3000)
                        submitBtn.style.display = 'block';
                    } else {
                        infobar.innerHTML = obj.error || '資料沒有修改';
                        infobar.className = "alert alert-danger";
                        // if(infobar.classList.contains('alert-success')){
                        //     infobar.classList.replace('alert-success', 'alert-danger')
                        // }
                        setTimeout(() => {
                            location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "data_list.php" ?>';
                        }, 3000)
                        submitBtn.style.display = 'block';
                    }
                    infobar.style.display = 'block';
                });

        } else {
            submitBtn.style.display = 'block';
        }
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>