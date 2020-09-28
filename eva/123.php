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

$sql = " SELECT * FROM e_frecord WHERE sid=$sid";
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
                <!-- <div class="col"> -->
                <div class="form-group">
                    <label for="note"><span class="red-stars"></span>備註</label>
                    <!-- <input type="text" class="form-control" id="email" name="email"> -->
                    <textarea class="form-control" id="note" name="note" cols='30' rows='7'><?= htmlentities($row['note']) ?></textarea>
                    <small class="form-text error-msg"></small>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-warning btn-lg btn-block ">提交</button>
                </div>


                <div class="row">
                    <div id="infobar" class="alert alert-info" role="alert" style="display: none" width:875px>
                        A simple success alert—check it out!
                    </div>
                </div>
        </form>

    </div>

</div>
<br>


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
        if (isPass) {
            const fd = new FormData(document.form1);
            fetch('123_api.php', {
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
                            location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "data-frecord.php" ?>';
                        }, 2000)

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