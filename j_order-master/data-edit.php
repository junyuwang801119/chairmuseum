<?php

$page_title = "編輯資料";
$page_name = "data-edit";
require __DIR__ . '/../parts/__connect_db.php';

$sid = isset($_GET['sid']) ? intval($_GET['sid']) : 0;
if (empty($sid)) {
    header('Location: data-list.php');
    exit;
}

$sql = "SELECT * FROM J_cart_order where sid=$sid";
$row = $pdo->query($sql)->fetch();
if (empty($row)) {
    header('Location: data_list.php');
    exit;
}
?>


<?php include __DIR__ . '/../parts/__html_head.php'; ?>

<?php

$q_sql = "SELECT * FROM `J_cart_qualify` ORDER BY sid ASC";
$cate_qualify = $pdo->query($q_sql)->fetchAll();

$os_sql = "SELECT * FROM `J_cart_order_status` ORDER BY sid ASC";
$cate_order_status = $pdo->query($os_sql)->fetchAll();

$ds_sql = "SELECT * FROM `J_cart_delivery_status` ORDER BY sid ASC";
$cate_delivery_status = $pdo->query($ds_sql)->fetchAll();

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
                            <label for="qualify">qualify</label>
                            <input type="text" class="form-control" id="qualify" name="qualify">
                        </div> -->
                        <div class="form-group">
                            <label for="qualify">qualify</label>
                            <select class="form-control" id="qualify" name="qualify" value="<?= htmlentities($row['qualify']) ?>">
                                <?php foreach ($cate_qualify as $key => $v) : ?>

                                    <option value="<?= $v['sid'] ?>" <?= ($row['qualify'] == $key + 1) ? 'selected' : "" ?>>
                                        <?= $v['qualify'] ?>
                                    </option>

                                <?php endforeach; ?>
                            </select>
                        </div>
                        <!-- <div class="form-group">
                            <label for="order_status">order_status</label>
                            <input type="text" class="form-control" id="order_status" name="order_status">
                        </div> -->
                        <div class="form-group">
                            <label for="order_status">order_status</label>
                            <select class="form-control" id="order_status" name="order_status" value="<?= htmlentities($row['order_status']) ?>">
                                <?php foreach ($cate_order_status as $k => $v) : ?>


                                    <option value="<?= $v['sid'] ?>" <?= ($row['order_status'] == $k + 1) ? 'selected' : "" ?>>
                                        <?= $v['order_status'] ?>
                                    </option>

                                <?php endforeach; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="delivery_status">delivery_status</label>
                            <select class="form-control" id="delivery_status" name="delivery_status" value="<?= htmlentities($row['delivery_status']) ?>">
                                <?php foreach ($cate_delivery_status as $k => $v) : ?>

                                    <option value="<?= $v['sid'] ?>" <?= ($row['delivery_status'] == $k + 1) ? 'selected' : "" ?>>
                                        <?= $v['delivery_status'] ?>
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

        fetch('data-edit-api.php', {

                method: 'POST',
                body: fd
            })
            .then(r => r.json())
            .then(obj => {
                console.log(obj);
                if (obj.success) {

                    setTimeout(() => {
                        location.href = 'data_list.php';
                    })

                } else {
                    submitBtn.style.display = 'block';
                }
            });
        return false;
    }
</script>
<?php include __DIR__ . '/../parts/__html_foot.php'; ?>