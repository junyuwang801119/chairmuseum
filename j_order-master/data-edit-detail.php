<?php

$page_title = "編輯資料";
$page_name = "detail-edit";
require __DIR__ . '/../parts/__connect_db.php';

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: data_list_detail.php');
    exit;
}

$sql = "SELECT * FROM J_order_detail where sid=$sid";
$row = $pdo->query($sql)->fetch();
if (empty($row)) {
    header('Location: data_list_detail.php');
    exit;
}
?>


<?php include __DIR__ . '/../parts/__html_head.php'; ?>

<?php

$ds_sql = "SELECT * FROM `J_detail_status` ORDER BY sid ASC";
$cate_destil_status = $pdo->query($ds_sql)->fetchAll();

?>

<style>
    span.red-stars {
        color: red;
    }

    small.error-msg {
        color: red;
    }
</style>

<?php include __DIR__ . '/../parts/__navbar.php'; ?>


<!-- `sid`, `PO_NO`, `product_name`, `qualify`, `product_status` -->
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">編輯資料</h5>

                    <form name="form1" onsubmit="return checkForm()">
                        <input type="hidden" name="sid" value="<?= $row['sid'] ?>">
                        <div class="form-group">
                            <label for="PO_NO">PO_NO</label>
                            <input type="text" class="form-control" id="PO_NO" name="PO_NO" value="<?= htmlentities($row['PO_NO']) ?>" readonly>
                        </div>
                        <!-- <div class="form-group">
                            <label for="product_name">product_name</label>
                            <select class="form-control" id="product_name" name="product_name" value="<?= htmlentities($row['product_name']) ?>">
                                <?php foreach ($cate_qualify as $key => $v) : ?>

                                    <option value="<?= $v['sid'] ?>" <?= ($row['product_name'] == $key + 1) ? 'selected' : "" ?>>
                                        <?= $v['product_name'] ?>
                                    </option>

                                <?php endforeach; ?>
                            </select>
                        </div> -->

                        <div class="form-group">
                            <label for="product_status">product_status</label>
                            <select class="form-control" id="product_status" name="product_status" value="<?= htmlentities($row['product_status']) ?>">
                                <?php foreach ($cate_destil_status as $key => $v) : ?>

                                    <option value="<?= $v['sid'] ?>" <?= ($row['product_status'] == $key + 1) ? 'selected' : "" ?>>
                                        <?= $v['product_status'] ?>
                                    </option>

                                <?php endforeach; ?>
                            </select>
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
    function checkForm() {
        let isPass = true;

        const fd = new FormData(document.form1);

        fetch('data-edit-detail-api.php', {

                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log(obj);
                if (obj.success) {

                    setTimeout(() => {
                        location.href = '<?= $_SERVER['HTTP_REFERER'] ?? "data-list-detail.php" ?>';
                    }, )

                } else {
                    submitBtn.style.display = 'block';
                }
            });
        return false;
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>