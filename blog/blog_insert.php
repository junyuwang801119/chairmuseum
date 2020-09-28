<?php
$page_title = '新增資料';
$page_name = 'blog_insert';
require __DIR__ . '/../parts/__connect_db.php';

// 判斷是否登入,如未登入將轉導
// require __DIR__. '/0831_admin_required.php';
// $type = array(
//     1 => '椅子始源',
//     2 => '流行趨勢',
//     3 => '廠商合作',
// )
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
    <!-- <h2>insert</h2> -->

    <div class="row">
        <div class="col-lg-6">
            <div id="infobar" class="alert alert-success" role="alert" style="display: none">
                A simple success alert—check it out!
            </div>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">新增資料</h5>

                    <form name="form1" onsubmit="checkForm(); return false;" novalidate>


                        <!-- <div class="form-group">
                            <label for="picture"></label>
                            <img id="myimg" style="margin-right: 10px;" src="../uploads/<?= htmlentities($row['picture']) ?>" height="100" alt="Image preview...">
                            <button type="button" class="btn btn-warning" onclick="file_input.click()">更換頭貼</button>
                            <input value="<?= htmlentities($row['picture']) ?>" hidden type="text" id="picture" name="picture">
                            <small class="form-text error-msg"></small>
                        </div>
                        <input style="display: none;" type="file" id="file_input"> -->


                        <div class="form-group">
                            <label for="theme"><span class="red-stars"></span>theme</label>
                            <select class="form-control" id="theme" name="theme" required>
                                <option value="1">椅子始源</option>
                                <option value="2">流行趨勢</option>
                                <option value="3">廠商合作</option>
                                <!-- <h5 class="card-title">主題:<?= $type[$r['theme']] ?></h5> -->
                            </select>
                            <small class="form-text error-msg"></small>
                        </div>

                        <div class="form-group">
                            <label for="text"><span class="red-stars">*</span>text</label>
                            <textarea class="form-control" name="text" id="text" cols="30" rows="3"></textarea>
                            <small class="form-text error-msg"></small>
                        </div>





                        <!-- <div class="form-group">
                            <label for="name"><span class="red-stars">*</span>name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="email"><span class="red-stars">*</span>email</label>
                            <input type="email" class="form-control" id="email" name="email">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="password"><span class="red-stars">*</span>password</label>
                            <input type="password" class="form-control" id="password" name="password">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="mobile"><span class="red-stars">*</span>mobile</label>
                            <input type="tel" class="form-control" id="mobile" name="mobile" pattern="09\d{2}-?\d{3}-?\d{3}">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="birthday">birthday</label>
                            <input type="date" class="form-control" id="birthday" name="birthday">
                        </div>
                        <div class="form-group">
                            <label for="address">address</label>
                            <textarea class="form-control" name="address" id="address" cols="30" rows="3"></textarea>
                            <small class="form-text error-msg"></small>
                        </div> -->

                        <div class="form-group">
                            <label for="picture""></label>
                            <img style=" margin-right: 10px;" src="../uploads/images.png" height="100" alt="Image preview...">
                                <input type="file" id="upload_image">
                                <input hidden type="text" id="picture" name="picture">
                                <small class="form-text error-msg"></small>
                                <!-- 這是 DOM level 1 的寫法
                            用 DOM lv3 的寫法(addEventListener)
                            -->
                                <!-- <input type="file" id="avatar" onchange="previewFile()"> -->
                        </div>

                        <!--
                        <form action="" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="exampleFormControlFile1">上傳頭像</label>
                                <input type="file" class="form-control-file" id="myfile" name="myfile" accept="image/*">
                            </div>
                            <input class="btn btn-primary" type="submit" value="上傳">
                        </form> -->





                        <!-- 用 formData append -->
                        <!-- <div style="display: none;" class="form-group">
                            <label for="avatar">address</label>
                            <input type="text" class="form-control" id="avatar" name="avatar">
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
    const email_pattern = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    const mobile_pattern = /^09\d{2}-?\d{3}-?\d{3}$/;

    const $text = document.querySelector('#text');
    // const $email = document.querySelector('#email');
    // const $password = document.querySelector('#password')
    // const $mobile = document.querySelector('#mobile');
    const $picture = document.querySelector('#picture');
    const r_fields = [$text, $picture];

    const infobar = document.querySelector('#infobar');
    const submitBtn = document.querySelector('button[type=submit]');



    function checkForm() {
        let isPass = true;

        r_fields.forEach(el => {
            el.style.borderColor = '#CCCCCC';

            if (el.nextElementSibling) {
                el.nextElementSibling.innerHTML = '';
            }
        });

        submitBtn.style.display = 'none';

        // TODO: 檢查資料格式

        // if ($name.value.length < 2) {
        //     isPass = false;
        //     $name.style.borderColor = 'red';
        //     $name.nextElementSibling.innerHTML = '請填寫正確的姓名';

        //     submitBtn.style.display = 'inline-block';
        // }

        // if (!email_pattern.test($email.value)) {
        //     isPass = false;
        //     $email.style.borderColor = 'red';
        //     $email.nextElementSibling.innerHTML = '請填寫正確格式的電子郵箱';

        //     // submitBtn.style.display = 'inline-block';
        // }

        console.dir($picture)
        // console.dir($password)

        if (!$text.value) {
            isPass = false;
            $text.style.borderColor = 'red';
            $text.nextElementSibling.innerHTML = '此欄未填';

            // submitBtn.style.display = 'inline-block';
        }

        // if (!mobile_pattern.test($mobile.value)) {
        //     isPass = false;
        //     $mobile.style.borderColor = 'red';
        //     $mobile.nextElementSibling.innerHTML = '請填寫正確的手機號碼';

        //     // submitBtn.style.display = 'inline-block';
        // }

        if (!$picture.value) {
            isPass = false;
            $picture.style.borderColor = 'red';
            $picture.nextElementSibling.innerHTML = '請上傳頭像';
        }
        // if (!$avatar.value) {
        //     isPass = false;
        //     $avatar.style.borderColor = 'red';
        //     $avatar.nextElementSibling.innerHTML = '請上傳頭像';
        // }

        if (isPass) {
            const fd = new FormData(document.form1);


            // // 我們擁有的圖片
            // const imageConfig = [
            //     'uploads/abraham_lincoln_PNG31.png',
            //     'uploads/burger_king_PNG7.png',
            //     'uploads/hillary_clinton_PNG52.png',
            //     'uploads/yuri_gagarin_PNG65810.png'
            // ]

            // // 隨機取一個
            // const randomImage = imageConfig.sort(() => Math.random() - 0.5)[0]

            // 加入到 FormData
            // fd.append('avatar', randomImage);

            // console.log(0, fd, randomImage)

            fetch('blog_insert_api.php', {
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
                            location.href = 'blog_data_list.php';
                        }, 1000)



                        // if (infobar.classList.contains('alert-danger')) {
                        //     infobar.classList.replace('alert-danger', 'alert-success')
                        // }
                    } else {
                        infobar.innerHTML = obj.error || '新增失敗';

                        infobar.className = "alert alert-danger";
                        // if(infobar.classList.contains('alert-success')){
                        //     infobar.classList.replace('alert-success', 'alert-danger')
                        // }
                        submitBtn.style.display = 'block';

                        // if (infobar.classList.contains('alert-success')) {
                        //     infobar.classList.replace('alert-success', 'alert-danger')
                        // }
                    }
                    infobar.style.display = 'block';
                });

        } else {
            submitBtn.style.display = 'block';
        }

        // const fd = new FormData(document.form1);

        // fetch('0826_api.php', {
        //         method: 'POST',
        //         body: fd
        //     })
        //     .then(r => r.text())
        //     .then(str => {
        //         console.log(str);
        //     });

        //return false;


    }


    const picture = document.querySelector('#upload_image');

    picture.addEventListener('change', function(event) {

        // 生成瀏覽圖片
        previewFile()

        const fd = new FormData();
        fd.append('myfile', picture.files[0]);

        fetch('../members/upload_api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                // avatar.value = obj.filename;

                console.log(obj.filename, '  obj.filename  ')
                document.querySelector('#picture').value = obj.filename;
            })
    });


    function previewFile() {
        const preview = document.querySelector('img');
        const file = document.querySelector('input[type=file]').files[0];
        const reader = new FileReader();

        reader.addEventListener("load", function(event) {
            // convert image file to base64 string
            preview.src = reader.result;
        }, false);

        if (file) {
            reader.readAsDataURL(file);
        }
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>