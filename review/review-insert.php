<?php require __DIR__ . '/../parts/__connect_db.php';
 ?>

<?php

$stars = $pdo->query("SELECT * FROM `w_review_stars`")->fetchAll();

?>

<?php require __DIR__ . '/../parts/__navbar.php' ?>

<style>
    .form-group input {
        width: 400px;

    }

    .form-group textarea {
        width: 400px;

    }

    .form-group select {
        width: 400px;

    }
</style>

<?php require __DIR__ . '/../parts/__nav.php' ?>

<!-- INSERT INTO `w_review`(`sid`, `buy_what_product`, `stars`, `member`, `review`, `user_post_time`, `user_lastedit_time`, `owner_post_time`, `owner_lastedit_time`, `user_photo`) 

VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8],[value-9],[value-10]) -->

<div class="container">
    <div class="row">
        <h3>新增評論</h3>
    </div>

    <div class="row">
        <div id="infobar" class="alert alert-success" role="alert" style="display: none ; width:875px">
            A simple success alert—check it out!
        </div>
    </div>
    <div class="row">

        <form class="justify-content-center" name="form1" onsubmit="checkForm(); return false;" novalidate>

            <div class="form-group">
                <label>購買產品
                    <input type="text" class="form-control" name="buy_product" disabled>
                </label>
            </div>

            <div class="form-group">
                <label>會員姓名
                    <input type="text" class="form-control" name="buy_member" disabled>
                </label>
            </div>


            <div class="form-group">
                <label>評分星星

                    <select class="form-control" name="stars">

                        <?php foreach ($stars as $k => $v) : ?>
                            <option><?= $v['name'] ?></option>
                        <?php endforeach; ?>

                    </select>

                </label>
            </div>



            <div class="form-group">
                <label>評論內容
                    <textarea class="form-control" name="review" rows="10" style="resize:none"></textarea>
                </label>
            </div>

            <div class="form-group">
                <div>上傳圖片</div>

                <button type="button" class="btn btn-warning" onclick="file_input.click()">上傳照片</button>

                <input type="hidden" id="photo" name="user_photo" class="form-control">
                <div>
                    <img src="../uploads/<?= $row['user_photo'] ?>" alt="" id="myimg" width="400px">
                </div>

            </div>
            <div class="form-group">
                <input type="submit" value="送出評論" class="btn btn-warning">
            </div>


        </form>

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
        fetch('review-insert-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log(obj);
                if (obj.success) {
                    infobar.innerHTML = '修改成功';
                    infobar.className = "alert alert-dark";

                    // setTimeout(() => {
                    //     location.href = '<?= $_SERVER['HTTP_REFERER'] ?? " data-list.php" ?>';
                    // }, 2000)

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