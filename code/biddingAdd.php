<?php
$page_title = 'Bidding add';
$page_name = 'Bidding add';
require __DIR__ . '/../parts/__connect_db.php';
require __DIR__ . '/../parts/__admin-required.php';

?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>
<style>
    span.red-stars {
        color: red;
    }

    small.error-msg {
        color: red;
    }

    .edit {
        font-size: 2rem;
    }
</style>
<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<div class="container d-flex justify-content-center">
    <div class="row">
        <div class="col">
            <div id="infobar" class="alert alert-success" role="alert" style="display: none">
                A simple success alert—check it out!
            </div>
            <div class="card" style="width: 40rem;">
                <div class="card-body">
                    <h5 class="card-title d-flex justify-content-center edit">新增產品</h5>
                    <form name="form1" onsubmit="checkForm(); return false;" novalidate>
                        <div class="form-group">
                            <button type="button" class="btn btn-info" onclick="file_input.click()">上傳產品圖</button>
                            <input type="hidden" id="pics" name=" pics">
                            <img src="" alt="" id="myimg" width="250px">
                            <br>
                            <input type="file" id="file_input" style="display: none">
                        </div>
                        
                        <div class="form-group">
                            <label for="productName"><span class="red-stars">**</span> Product Name</label>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                            <small class="form-text error-msg"></small>
                        </div>

                        <div class="form-group">
                            <label for="startingDate"> Starting date</label>
                            <input type="date" class="form-control" id="startingDate" name="startingDate">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="startingTime"> Starting time</label>
                            <input type="time" class="form-control" id="startingTime" name="startingTime">

                        </div>
                        <div class="form-group">
                            <label for="bidDate">Bid date</label>
                            <input type="date" class="form-control" id="bidDate" name="bidDate">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="bidTime">Bid time</label>
                            <input type="time" class="form-control" id="bidTime" name="bidTime">
                        </div>
                        <div class="form-group">
                            <label for="startedPrice"><span class="red-stars">**</span> Started price</label>
                            <input type="number" class="form-control" id="startedPrice" name="startedPrice">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="bidPrice"><span class="red-stars">**</span> Bid price</label>
                            <input type="number" class="form-control" id="bidPrice" name="bidPrice">
                            <small class="form-text error-msg"></small>
                        </div>
                        <div class="form-group">
                            <label for="soldPrice"><span class="red-stars">**</span> Min sold price</label>
                            <input type="number" class="form-control" id="soldPrice" name="soldPrice">
                            <small class="form-text error-msg"></small>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<?php include __DIR__ . '/../parts/__scripts.php'; ?>

<script>
    const file_input = document.querySelector('#file_input');
    const pics = document.querySelector('#pics');

    file_input.addEventListener('change', function(event) {
        console.log(file_input.files)
        const fd = new FormData();
        fd.append('myfile', file_input.files[0]);

        fetch('upload-single-api.php', {
                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                pics.value = obj.filename;
                document.querySelector('#myimg').src = '../uploads/' + obj.filename;
            });
    });
    const productName_pattern = /[a-zA-Z]/;
    const startedPrice_p = /\d/;
    const bidPrice_p = /\d/;
    const soldPrice_p = /\d/;

    const $productName = document.querySelector('#productName')
    const $startedPrice = document.querySelector('#startedPrice')
    const $bidPrice = document.querySelector('#bidPrice')
    const $soldPrice = document.querySelector('#soldPrice')
    const r = [$productName, $startedPrice, $bidPrice, $soldPrice]
    const infobar = document.querySelector('#infobar')
    const submitBtn = document.querySelector('button[type=submit]');

    const checkForm = () => {
        let isPass = true

        r.forEach((el) => {
            el.style.borderColor = '#cccccc';
            el.nextElementSibling.innerHTML = '';
        });
        submitBtn.style.display = 'none';

        if (!productName_pattern.test($productName.value)) {
            isPass = false;
            $productName.style.borderColor = 'red';
            $productName.nextElementSibling.innerHTML = 'Please input your product name correctly';
        };

        if (!startedPrice_p.test($startedPrice.value)) {
            isPass = false;
            $startedPrice.style.borderColor = 'red';
            $startedPrice.nextElementSibling.innerHTML = 'Please input your price correctly';
        };
        if (!bidPrice_p.test($bidPrice.value)) {
            isPass = false;
            $bidPrice.style.borderColor = 'red';
            $bidPrice.nextElementSibling.innerHTML = 'Please input your price correctly';
        };
        if (!soldPrice_p.test($soldPrice.value)) {
            isPass = false;
            $soldPrice.style.borderColor = 'red';
            $soldPrice.nextElementSibling.innerHTML = 'Please input your price correctly';
        };
        if (isPass) {
            const fd = new FormData(document.form1);

            fetch('biddingAddAPI.php', {
                    method: 'POST',
                    body: fd
                })
                .then(r => r.json())
                .then(obj => {
                    console.log(obj);
                    if (obj.success) {
                        infobar.innerHTML = '新增成功';
                        infobar.className = "alert alert-success";
                        // if (infobar.classList.contains('alert-danger')) {
                        //     infobar.classList.replace('alert-danger', 'alert-success')};
                        setTimeout(() => {
                            location.href = 'biddingList.php';
                        }, 3000);

                    } else {
                        infobar.innerHTML = obj.error || '新增失敗';
                        infobar.className = "alert alert-danger";
                        // if (infobar.classList.contains('alert-success')) {
                        //     infobar.classList.replace('alert-success', 'alert-danger')}
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