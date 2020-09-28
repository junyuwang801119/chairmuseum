<?php
$page_title = '編輯資料';
$page_name = 'blog_data_edit';
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';
$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: blog_data_list.php');
    exit;
}

$sql = " SELECT * FROM blog WHERE sid=$sid";
$row = $pdo->query($sql)->fetch();
if (empty($row)) {
    header('Location: blog_data_list.php');
    exit;
}


?>
<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    span.red-stars {
        color: red;
    }

    small.error-msg {
        color: red;
    }
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div id="infobar" class="alert alert-success" role="alert" style="display: none">
                A simple success alert—check it out!
            </div>

            <!-- <?=
                        var_dump($row);
                    ?> -->
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">編輯資料</h5>

                    <form name="form1" onsubmit="checkForm(); return false;" novalidate>
                        <input type="hidden" name="sid" value="<?= $row['sid'] ?>">


                        <div class="form-group">
                            <label for="picture"></label>
                            <img id="myimg" style="margin-right: 10px;" src="../uploads/<?= htmlentities($row['picture']) ?>" height="100" alt="Image preview...">
                            <button type="button" class="btn btn-warning" onclick="file_input.click()">更換頭貼</button>
                            <input value="<?= htmlentities($row['picture']) ?>" hidden type="text" id="picture" name="picture">
                            <small class="form-text error-msg"></small>
                        </div>
                        <input style="display: none;" type="file" id="file_input">


                        <div class="form-group">
                            <label for="theme"><span class="red-stars"></span>theme</label>
                            <select class="form-control" id="theme" name="theme" required>
                                <option value="1" <?= $row['theme'] == 1 ? 'selected="selected"' : ''; ?>>椅子始源</option>
                                <option value="2" <?= $row['theme'] == 2 ? 'selected="selected"' : ''; ?>>流行趨勢</option>
                                <option value="3" <?= $row['theme'] == 3 ? 'selected="selected"' : ''; ?>>廠商合作</option>
                            </select>
                            <small class="form-text error-msg"></small>
                        </div>

                        <div class="form-group">
                            <label for="text"><span class="red-stars">*</span>text</label>
                            <textarea class="form-control" name="text" id="text" cols="30" rows="3"><?= htmlentities($row['text']) ?></textarea>
                            <small class="form-text error-msg"></small>
                        </div>

                        <!-- <div class="form-group">
                            <label for="picture"><span class="red-stars">*</span>picture</label>
                            <input type="picture" class="form-control" id="picture" name="picture" required value="<?= htmlentities($row['picture']) ?>">
                            <small class="form-text error-msg"></small>
                        </div> -->
                        <!-- <div class="form-group">
                            <label for="password"><span class="red-stars">*</span>password</label>
                            <input type="password" class="form-control" id="password" name="password"                              value="<?= htmlentities($row['password']) ?>">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="mobile"><span class="red-stars">*</span> mobile</label>
                            <input type="tel" class="form-control" id="mobile" name="mobile"
                                   value="<?= htmlentities($row['mobile']) ?>"
                                   pattern="09\d{2}-?\d{3}-?\d{3}">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="birthday">birthday</label>
                            <input type="date" class="form-control" id="birthday" name="birthday"
                                   value="<?= htmlentities($row['birthday']) ?>">
                        </div>
                        <div class="form-group">
                            <label for="address">address</label>
                            <textarea class="form-control" name="address" id="address" cols="30"
                                      rows="3"
                            ><?= htmlentities($row['address']) ?></textarea>
                        </div> -->

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>

        </div>
    </div>






</div>
<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    // const email_pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    // const mobile_pattern = /^09\d{2}-?\d{3}-?\d{3}$/;
    const $text = document.querySelector('#text');
    const $picture = document.querySelector('#picture');

    // const $browsing_product = document.querySelector('#browsing_product');
    // const $mobile = document.querySelector('#mobile');
    const r_fields = [$picture];
    const infobar = document.querySelector('#infobar');
    const submitBtn = document.querySelector('button[type=submit]');

    function checkForm() {
        let isPass = true;

        r_fields.forEach(el => {
            el.style.borderColor = '#CCCCCC';

            if (el.nextElementSibling) {
                el.nextElementSibling.innerHTML = '';

            } else {
                console.log(124)
            }
        });
        submitBtn.style.display = 'none';
        // TODO: 檢查資料格式
        // if ($user.value.length < 2) {
        //     isPass = false;
        //     $user.style.borderColor = 'red';
        //     $user.nextElementSibling.innerHTML = '請填寫正確的姓名';
        // }

        if (!$text.value) {
            isPass = false;
            $text.style.borderColor = 'red';

            if ($text && $text.nextElementSibling) {
                $text.nextElementSibling.innerHTML = '此欄未填';
            } else {
                console.log(2222222, $text)
            }
        }

        if (!$picture.value) {
            isPass = false;
            $picture.style.borderColor = 'red';

            if ($picture && $picture.nextElementSibling) {
                $picture.nextElementSibling.innerHTML = '此欄未填';
            } else {
                console.log(222)
            }
        }



        // if (!$password.value) {
        //     isPass = false;
        //     $password.style.borderColor = 'red';
        //     $password.nextElementSibling.innerHTML = '請輸入密碼';

        //     submitBtn.style.display = 'inline-block';
        // }

        // if(! mobile_pattern.test($mobile.value)) {
        //     isPass = false;
        //     $mobile.style.borderColor = 'red';
        //     $mobile.nextElementSibling.innerHTML = '請填寫正確的手機號碼';
        // }

        try {
            if (isPass) {
                const fd = new FormData(document.form1);

                fetch('blog_edit_api.php', {
                        method: 'POST',
                        body: fd
                    })
                    .then(r => {

                        let response

                        try {
                            response = r.json()
                        } catch (error) {
                            console.log(error)
                        }



                        return response
                    })
                    .then(obj => {
                        console.log(obj);
                        if (obj.success) {
                            infobar.innerHTML = '修改成功';
                            infobar.className = "alert alert-success";

                            setTimeout(() => {
                                location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "blog_data_list.php" ?>';
                            }, 1000)

                        } else {
                            infobar.innerHTML = obj.error || '資料沒有修改';
                            infobar.className = "alert alert-danger";
                            submitBtn.style.display = 'block';
                        }
                        infobar.style.display = 'block';
                    });

            } else {
                submitBtn.style.display = 'block';
            }
        } catch (error) {
            console.log('error: ', error)
        }
    }




    // 處理圖片上傳 更換圖片等等
    const file_input = document.querySelector('#file_input');
    const picture = document.querySelector('#picture');

    file_input.addEventListener('change', function(event) {
        console.log(file_input.files)
        const fd = new FormData();
        fd.append('myfile', file_input.files[0]);

        fetch('../members/upload_api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                picture.value = obj.filename;
                document.querySelector('#myimg').src = './../uploads/' + obj.filename;
            });
    });
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>



<!-- 
﻿
blog_edit.php?sid=1&…ncoln_PNG31.png:262 Uncaught TypeError: Cannot set property 'innerHTML' of null
    at checkForm (blog_edit.php?sid=1&…ncoln_PNG31.png:262)
    at HTMLFormElement.onsubmit (blog_edit.php?sid=1&…ncoln_PNG31.png:158)
﻿
​ -->