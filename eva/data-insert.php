<?php
$page_title = '新增募資提案';
$page_name = 'data-insert';
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';


if (!empty($_FILES)) {
    header('Content-Type: text/plain');
    var_dump($_FILES);
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


    }

    .form-group textarea {
        width: 400px;

        margin-top: 10px;
    }

    .form-group select {
        width: 400px;

        margin-top: 10px;
        /* height: 45px; */
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
    <div class="row">
        <h4>新增提案</h4>
    </div>

    <div class="row">
        <div id="infobar" class="alert alert-success" role="alert" style="display: none; ">
            A simple success alert—check it out!
        </div>
    </div>

    <div class="row">
        <form class="d-flex justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>

            <div class="col">
                <div class="form-group">
                    <label for="e_proname"><span class="red-stars">**</span> 提案名稱</label>
                    <input type="text" class="form-control" id="e_proname" name="e_proname" required>
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="e_cate"><span class="red-stars">**</span>分類</label><br>
                    <select class="custom-select" id="e_cate" name="e_cate" required>
                        <option selected>請選擇</option>
                        <option value="9">bar stool </option>
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
                    <label for="images"><span class="red-stars">**</span>圖片上傳</label><br>
                    <button type="button" class="btn btn-info" onclick="file_input.click()">上傳</button>
                    <small class="form-text error-msg"></small>
                    <input type="hidden" id="e_pic" name="e_pic" value="<?= $row['e_pic'] ?>" required>
                    <img src="/fund_project/parts/e_img/<?= $row['e_pic'] ?>" alt="" id="e_pic_img" width="400px">
                </div>





            </div>

            <div class="col">
                <div class="form-group">
                    <label for="e_prointro"><span class="red-stars">**</span>提案介紹</label>
                    <!-- <input type="text" class="form-control" id="email" name="email"> -->
                    <textarea class="form-control" id="e_prointro" name="e_prointro" cols='30' rows='7' required></textarea>
                </div>

                <div class="form-group">
                    <label for="price"><span class="red-stars">**</span>底價</label>
                    <input type="price" class="form-control" id="price" name="e_lowprice" required>
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="price"><span class="red-stars">**</span>目標金額 </label>
                    <input type="text" class="form-control" id="price" name="e_goal" required>
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <label for="time"><span class="red-stars">**</span>開始時間</label>
                    <input type="datetime" class="form-control" id="time" name="e_start_time" placeholder="2020-09-16 13:00:00" required>
                    <small class="form-text ">例：2020-09-13 13:00:00</small>
                </div>

                <div class="form-group">
                    <label for="time"><span class="red-stars">**</span>結束時間</label>
                    <input type="datetime" class="form-control" id="time" name="e_end_time" placeholder="2020-09-16 13:00:00" required>
                    <small class="form-text ">例：2020-09-13 13:00:00</small>
                </div>

                <div class="form-group">
                    <label for="time"><span class="red-stars">**</span>產品實踐時間 </label>
                    <input type="date" class="form-control" id="time" name="e_realize_time">
                    <small class="form-text error-msg"></small>
                </div>







                <div class="form-group">
                    <button type="submit" class="btn btn-warning btn-lg">確認提交</button>
                </div>
                <input type="file" id="file_input" style="display: none">


        </form>

    </div>


</div>


<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    const $e_proname = document.querySelector('#e_proname');
    const $e_prointro = document.querySelector('#e_prointro');
    const r_fields = [$e_proname, $e_prointro];
    const infobar = document.querySelector('#infobar');
    const submitBtn = document.querySelector('button[type=submit]');

    function checkForm() {
        let isPass = true;

        // r_fields.forEach(el => {
        //     el.style.borderColor = '#CCCCCC';
        //     el.nextElementSibling.innerHTML = '';
        // });
        // // submitBtn.style.display = 'none';


        // if ($e_proname.value.length < 2) {
        //     isPass = false;
        //     $e_proname.style.borderColor = '#ca3d27';
        //     $e_proname.nextElementSibling.innerHTML = '提案名稱不得少於2個字';
        // }

        // if ($e_prointro.value.length < 10) {
        //     isPass = false;
        //     $e_prointro.style.borderColor = '#ca3d27';
        //     $e_prointro.nextElementSibling.innerHTML = '提案介紹不得少於10個字';
        // }




        if (isPass) {
            const fd = new FormData(document.form1);
            fetch('data-insert_api.php', {
                    method: 'POST',
                    body: fd

                })
                .then(r => r.json())
                .then(obj => {
                    console.log(obj);
                    if (obj.success) {
                        infobar.innerHTML = '新增成功~';
                        infobar.className = "alert alert-info";
                        setTimeout(() => {
                            location.href = 'datalist2_delete.php';
                        }, 1000)

                    } else {
                        infobar.innerHTML = obj.error || '資料無新增@@';
                        infobar.className = "alert alert-danger";
                        submitBtn.style.display = 'block';
                    }
                    infobar.style.display = 'block';
                });
        } else {
            submitBtn.style.display = 'block';
        }

    }
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
</script>

<?php include __DIR__ . '/../parts/__html_foot.php'; ?>