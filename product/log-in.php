<?php
$page_title = '登入';
$page_name = 'login';
require __DIR__ . '/../parts/__connect_db.php';
?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>

<style>
    body {
        background-color: #EFF0F0;
    }

    .form1 {
        justify-content: center;

    }


    .form-group {
        margin: 20px;
    }

    .form-group input {
        width: 400px;
        border: none;
        height: 45px;
        margin-top: 10px;
        height: 45px;

    }


    img {
        width: 400px;
        margin-top: 50px;
    }

    form button {
        width: 400px;
        height: 45px;
        margin-bottom: 25px;
        margin-top: 10px;
    }
</style>

<?php include __DIR__ . '/../parts/__navbar.php'; ?>

<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <form method="post" name="form1" onsubmit="checkForm(); return false;">
                <div class="form-group">
                    <label for="account">Account</label>
                    <input type="text" class="form-control" id="account" name="account">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-warning">登入</button>
                </div>

            </form>
        </div>

        <div class="row">
            <img src="../images/chair.jpg">
        </div>
    </div>
</div>

<?php include __DIR__ . '/../parts/__scripts.php'; ?>

<script>
    function checkForm() {
        const fd = new FormData(document.form1);
        fetch('log-in-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log(obj);
                if (obj.success) {
                    alert('登入成功');
                    location.href = 'product-list.php';
                } else {
                    alert('登入失敗');
                }
            });
    }
</script>

<?php include __DIR__ . '/../parts/__html_foot.php'; ?>