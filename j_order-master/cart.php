<?php

$page_title = "購物車";
$page_name = "cart";
require __DIR__ . '/../parts/__connect_db.php';
?>

<?php include __DIR__ . '/../parts/__html_head.php'; ?>


<?php include __DIR__ . '/../parts/__navbar.php'; ?>
<?php

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;

$sql = "SELECT * FROM w_product_mainList where sid=$sid";
$row = $pdo->query($sql)->fetch();
$pn_sql = "SELECT * FROM `w_product_mainList` ORDER BY sid ASC";
$cate_product_name = $pdo->query($pn_sql)->fetchAll();
?>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div id="infobar" class="alert alert-success" role="alert">
                A simple success alert—check it out!
            </div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">購物車</h5>

                    <form name="form1" onsubmit="return checkForm()">
                        <div class="form-group">
                            <label for="product_name">商品</label>
                            <select class="form-control" id="product_status" name="product_status" value="<?= htmlentities($row['product_status']) ?>">
                                <?php foreach ($cate_product_name as $key => $v) : ?>

                                    <option value="<?= $v['sid'] ?>" <?= ($row['product_name'] == $key + 1) ? 'selected' : "" ?>>
                                        <?= $v['product_name'] ?>
                                        <?= $v['product_name'] ?>
                                    </option>

                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="quantity">數量</label>
                            <input type="number" class="form-control" id="quantity" name="quantity">
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
    const r_fields = [$name, $email, $mobile]


    function checkForm() {
        let isPass = true;

        r_fields.forEach(el => {
            el.style.borderColor = "#cccccc";
            el.nextElementSibling.innerHTML = "";
        })

        //TODO : 檢查資料格式

        const fd = new FormData(document.form1);

        fetch('data-insert-api.php', {

                method: 'POST',
                body: fd
            })
            .then(r => r.text())
            .then(str => {
                console.log(str);
            });
        return false;
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>