<?php
$page_title = '新增文章列表';
$page_name = 'title_data_list_insert';
require __DIR__ . '/../parts/__connect_db.php';

$c_sql = "SELECT * FROM a_title_category WHERE sid";

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

    .pagination>li>a {
        background-color: white;
        color: darkgray;
    }

    .pagination>li>a:focus,
    .pagination>li>a:hover,
    .pagination>li>span:focus,
    .pagination>li>span:hover {
        color: #5a5a5a;
        background-color: #eee;
        border-color: #ddd;
    }

    .pagination>.active>a {
        color: white;
        background-color: #C77334 !Important;
        border: solid 1px #ddd !Important;
    }

    .pagination>.active>a:hover {
        background-color: #C77334 !Important;
        border: solid 1px #5A4181;
    }
</style>

<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container">
    <div class="row">
        <h3>新增文章列表</h3>
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
                    <label for="title"><span class="red-stars">**</span>1. 文章名稱</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                    <small class="form-text error-msg">必填</small>
                </div>

                <div class="form-group">
                    <label for="images"><span class="red-stars">**</span>2. 圖片</label><br>
                    <button type="button" class="btn btn-warning" onclick="file_input.click()">上傳主題照</button>
                    <small class="form-text error-msg">請上傳一張主要宣傳圖片</small>
                    <input type="hidden" id="images" name="images" value="<?= $row['images'] ?>" required>
                    <img src="./../uploads/<?= $row['images'] ?>" alt="" id="myimg" width="400px">


                </div>

                <div class="form-group">
                    <label for="introduction"><span class="red-stars">**</span>3. 介紹</label>
                    <textarea class="form-control" id="introduction" name="introduction" cols="30" rows="3" required></textarea>
                    <small class="form-text error-msg">例如:文章簡介、新穎內容等</small>
                </div>

            </div>
            <div class="col">

                <div class="form-group">
                    <label for="title_sid"><span class="red-stars">**</span>4. 活動種類</label>
                    <select class="form-control" id="title_sid" name="title_sid" data-val="<?= $row['title_sid'] ?>">
                        <?php foreach ($cates as $c) : ?>
                            <option value="<?= $c['sid'] ?>"><?= $c['title_name'] ?></option>
                        <?php endforeach; ?>
                    </select>
                    <small class="form-text error-msg">必選</small>
                </div>

                <div class="form-group">
                    <label for="created_at"><span class="red-stars">**</span>5. 文章發佈日期</label>
                    <input type="date" class="form-control" id="created_at" name="created_at" required>
                    <small class="form-text error-msg">必填</small>
                </div>





                <div class="form-group">
                    <button type="submit" class="h123 btn btn-primary">上架</button>
                </div>
            </div>
        </form>
        <input type="file" id="file_input" style="display: none">

    </div>

</div>


<?php include __DIR__ . '/../parts/__scripts.php'; ?>
<script>
    const $name = document.querySelector('#title');
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

        submitBtn.style.display = 'none';

        if ($name.value.length < 2) {
            isPass = false;
            $name.style.borderColor = 'red';
            $name.nextElementSibling.innerHTML = '請填寫適當的文章名稱';
        }



        if (isPass) {
            const fd = new FormData(document.form1);
            fetch('title_data_list_insert_api.php', {
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
                            location.href = 'title_data_list.php';
                        }, 3000)
                        submitBtn.style.display = 'block';
                    } else {
                        infobar.innerHTML = obj.error || '新增失敗';
                        infobar.className = "alert alert-danger";
                        // if(infobar.classList.contains('alert-success')){
                        //     infobar.classList.replace('alert-success', 'alert-danger')
                        // }
                        setTimeout(() => {
                            location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "title_data_list.php" ?>';
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