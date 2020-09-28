<?php
$page_title = '新增木工創客地點資料表';
$page_name = 'wood_experienceinsert';
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';


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
        <h3>新增木工創客地點資料表</h3>
    </div>

    <div class="row">
        <div id="infobar" class="alert alert-success" role="alert" style="display: none; width:875px">
            A simple success alert—check it out!
        </div>
    </div>

    <div class="row">
        <form class="d-flex justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>

            <div class="col">
                <div class="form-group">
                    <label for="organizer"><span class="red-stars">**</span>1. 組織名稱</label>
                    <input type="text" class="form-control" id="organizer" name="organizer" required>
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="address"><span class="red-stars">**</span>2. 地址</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="email"><span class="red-stars">**</span>3. 信箱</label>
                    <input type="email" class="form-control" id="email" name="email">
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="mobile"><span class="red-stars">**</span>4. 手機</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" pattern="09\d{2}-?\d{3}-?\d{3}">
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="open_time"><span class="red-stars">**</span>5. 每日營業開始時間</label>
                    <input type="time" class="form-control" id="open_time" name="open_time" required>
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="close_time"><span class="red-stars">**</span>6. 每日營業結束時間</label>
                    <input type="time" class="form-control" id="close_time" name="close_time" required>
                    <small class="form-text error-msg">必填</small>
                </div>

            </div>

            <div class="col">
                <div class="form-group">
                    <label for="images"><span class="red-stars">**</span>7. 圖片</label><br>
                    <button type="button" class="btn btn-warning" onclick="file_input.click()">上傳地點照</button>
                    <small class="form-text error-msg">請上傳一張主要地點圖片</small>
                    <input type="hidden" id="images" name="images" value="<?= $row['images'] ?>" required>
                    <img src="./../uploads/<?= $row['images'] ?>" alt="" id="myimg" width="400px">


                </div>
                <div class="form-group">
                    <label for="introduction"><span class="red-stars">**</span>8. 介紹</label>
                    <textarea class="form-control" id="introduction" name="introduction" cols="30" rows="3" required></textarea>
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
    const email_pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    const mobile_pattern = /^09\d{2}-?\d{3}-?\d{3}$/;
    const $name = document.querySelector('#organizer');
    const $email = document.querySelector('#email');
    const $mobile = document.querySelector('#mobile');
    const r_fields = [$name, $email, $mobile];
    const infobar = document.querySelector('#infobar');
    const submitBtn = document.querySelector('button[type=submit]');



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

        r_fields.forEach(el => {
            el.style.borderColor = '#CCCCCC';
            el.nextElementSibling.innerHTML = '';
        });

        submitBtn.style.display = 'none';

        if ($name.value.length < 2) {
            isPass = false;
            $name.style.borderColor = 'red';
            $name.nextElementSibling.innerHTML = '請填寫適當的地點名稱';
        }

        if (!email_pattern.test($email.value)) {
            isPass = false;
            $email.style.borderColor = 'red';
            $email.nextElementSibling.innerHTML = '請填寫正確格式的電子郵箱';
        }

        if (!mobile_pattern.test($mobile.value)) {
            isPass = false;
            $mobile.style.borderColor = 'red';
            $mobile.nextElementSibling.innerHTML = '請填寫正確的手機號碼';
        }


        if (isPass) {
            const fd = new FormData(document.form1);
            fetch('wood_experienceinsert_api.php', {
                    method: 'POST',
                    body: fd
                })
                .then(r => r.json())
                .then(obj => {
                    console.log(obj);
                    if (obj.success) {
                        infobar.innerHTML = '新增成功';
                        infobar.className = "alert alert-success";
                        // if(infobar.classList.contains('alert-danger')){
                        //     infobar.classList.replace('alert-danger', 'alert-success')
                        // }
                        setTimeout(() => {
                            location.href = 'wood_list.php';
                        }, 3000)
                        submitBtn.style.display = 'block';
                    } else {
                        infobar.innerHTML = obj.error || '新增失敗';
                        infobar.className = "alert alert-danger";
                        // if(infobar.classList.contains('alert-success')){
                        //     infobar.classList.replace('alert-success', 'alert-danger')
                        // }
                        setTimeout(() => {
                            location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "wood_list.php" ?>';
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