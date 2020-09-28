<?php
$page_title = '編輯提案';
$page_name = 'data-edit';
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: datalist2_delete.php');
    exit;
}

$sql = " SELECT * FROM e_fund_project WHERE sid=$sid";
$row = $pdo->query($sql)->fetch();
if (empty($row)) {
    header('Location: datalist2_delete.php');
    exit;
}

?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    body {
        background-color: #EFF0F0;
    }

    span.red-stars {
        color: #ca3d27;
    }

    small.error-msg {
        color: #ca3d27;
    }

    .alert {
        margin-top: 30px;
    }

    .card-title {
        margin-top: 30px;
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
        height: 45px;

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
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>

<div class="container">
    <!-- <div class="row "> -->

    <!-- <div id="infobar" class="alert alert-info" role="alert" style="display: none">
                A simple success alert—check it out!
       </div> -->
    <!-- </div> -->
    <!-- <div class="jumbotron jumbotron-fluid" id="infobar" style="display: none">
        <h1 class="display-8">Hello, world!</h1>
        <hr class="my-8">
        </div> -->


    <!-- <img src="..." class="card-img-top" alt="..."> -->

    <div class="row">
        <h4 class="card-title">編輯提案</h4>
    </div>

    <div class="row">
        <form class="d-flex justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>
            <input type="hidden" name="sid" value="<?= $row['sid'] ?>">
            <!-- <div class="form-group">
                    <label for="e_designer_sid">設計師編號</label>
                    <input type="text" class="form-control" id="e_designer_sid" name="e_designer_sid">
                </div>  -->
            <div class="col">
                <div class="form-group">
                    <label for="e_proname"><span class="red-stars">**</span> 提案名稱</label>
                    <input type="text" class="form-control" id="e_proname" name="e_proname" required value="<?= htmlentities($row['e_proname']) ?>">
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="e_cate"><span class="red-stars">**</span>分類</label><br>
                    <select class="custom-select" id="e_cate" name="e_cate" required value="<?= htmlentities($row['e_cate']) ?>">

                        <option value="9" selected>bar stool </option>
                        <option value="1">chairs </option>
                        <option value="2">armchair</option>
                        <option value="3">dining chair</option>
                        <option value="4">lounge chair</option>
                        <option value="5">foot stool </option>
                        <option value="6">bench</option>
                        <option value="7">outdoor chair</option>
                        <option value="8">children / baby</option>
                    </select>
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <span class="red-stars">**</span><br>
                    <input type="file" id="file_input" name="myfile" style="display: none;">
                    <input type="hidden" id="e_pic" name="e_pic" value="<?= $row['e_pic'] ?>" required>
                    <img src="../uploads/<?= $row['e_pic'] ?>" alt="" id="e_pic_img" width="80%" class="d-flex justify-content-center"><br>
                    <button type="button" class="btn btn-info btn-sm btn-block " onclick="file_input.click()">更換產品圖</button>
                </div>
            </div>

            <div class="col">
                <div class="form-group">
                    <label for="e_prointro"><span class="red-stars">**</span>提案介紹</label>
                    <!-- <input type="text" class="form-control" id="email" name="email"> -->
                    <textarea class="form-control" id="e_prointro" name="e_prointro" cols='30' rows='7'><?= htmlentities($row['e_prointro']) ?></textarea>
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="price"><span class="red-stars">**</span>底價</label>
                    <input type="price" class="form-control" id="price" name="e_lowprice" required value="<?= htmlentities($row['e_lowprice']) ?>">
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="price"><span class="red-stars">**</span>目標金額 </label>
                    <input type="text" class="form-control" id="price" name="e_goal" required value="<?= htmlentities($row['e_goal']) ?>">
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="time1"><span class="red-stars">**</span>開始時間</label>
                    <input type="datetime" class="form-control" id="time1" name="e_start_time" required value="<?= htmlentities($row['e_start_time']) ?>">
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="time2"><span class="red-stars">**</span>結束時間</label>
                    <input type="datetime" class="form-control" id="time2" name="e_end_time" required value="<?= htmlentities($row['e_end_time']) ?>">
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="time3"><span class="red-stars">**</span>產品實踐時間</label>
                    <input type="date" class="form-control" id="time3" name="e_realize_time" required value="<?= htmlentities($row['e_realize_time']) ?>">
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-warning btn-lg btn-block ">提交</button>
                </div>


        </form>

    </div>

</div>
<div id="infobar" class="alert alert-info" role="alert" style="display: none">
    A simple success alert—check it out!
</div>

<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    const $e_proname = document.querySelector('#e_proname');
    const $e_prointro = document.querySelector('#e_prointro');
    const r_fields = [$e_proname, $e_prointro];
    const infobar = document.querySelector('#infobar');
    const submitBtn = document.querySelector('button[type=submit]');

    const file_input = document.querySelector('#file_input');
    const e_pic = document.querySelector('#e_pic');

    file_input.addEventListener('change', function(event) {
        console.log(file_input.files)
        const fd = new FormData();
        fd.append('myfile', file_input.files[0]);

        fetch('upload-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log('obj', obj);
                e_pic.value = obj.filename;
                document.querySelector('#e_pic_img').src = '../uploads/' + obj.filename;
            });
    });




    function checkForm() {
        let isPass = true;

        r_fields.forEach(el => {
            el.style.borderColor = '#CCCCCC';
            el.nextElementSibling.innerHTML = '';
        });
        // submitBtn.style.display = 'none';


        if ($e_proname.value.length < 2) {
            isPass = false;
            $e_proname.style.borderColor = '#ca3d27';
            $e_proname.nextElementSibling.innerHTML = '提案名稱不得少於2個字';
        }

        if ($e_prointro.value.length < 10) {
            isPass = false;
            $e_prointro.style.borderColor = '#ca3d27';
            $e_prointro.nextElementSibling.innerHTML = '提案介紹不得少於10個字';
        }




        if (isPass) {
            const fd = new FormData(document.form1);
            fetch('data-edit_api.php', {
                    method: 'POST',
                    body: fd

                })
                .then(r => r.json())
                .then(obj => {
                    console.log(obj);
                    if (obj.success) {
                        infobar.innerHTML = '修改成功~';
                        infobar.className = "alert alert-info";
                        setTimeout(() => {
                            location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "datalist2_delete.php" ?>';
                        }, 3000)

                    } else {
                        infobar.innerHTML = obj.error || '資料無修改@@';
                        infobar.className = "alert alert-danger";
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