(function ($) {
    "use strict";

    // Hàm định dạng số thành kiểu tiền tệ (ví dụ: 10000 → 10,000)
    function formatCurrency(value) {
        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    // Cập nhật tổng tiền từng dòng và tổng toàn bộ giỏ
    function updateCartTotal() {
        let total = 0;
        $(".table tbody tr").each(function () {
            const price = parseFloat($(this).find(".price").data("price"));
            const quantity = parseInt($(this).find(".quantity").val());
            const subtotal = price * quantity;
            $(this).find(".total").text(formatCurrency(subtotal) + "đ");
            total += subtotal;
        });
        $("#cart-total").text(formatCurrency(total) + "đ");
    }

    // Nút tăng giảm số lượng
    $(document).on("click", ".btn-increase", function () {
        const input = $(this).closest(".input-group").find(".quantity");
        input.val(parseInt(input.val()) + 1);
        updateCartTotal();
    });

    $(document).on("click", ".btn-decrease", function () {
        const input = $(this).closest(".input-group").find(".quantity");
        const val = parseInt(input.val());
        if (val > 1) input.val(val - 1);
        updateCartTotal();
    });

    // Khi nhập số lượng thủ công
    $(document).on("input", ".quantity", function () {
        let val = parseInt($(this).val());
        if (isNaN(val) || val < 1) $(this).val(1);
        updateCartTotal();
    });

    // Cập nhật khi load trang
    $(document).ready(function () {
        updateCartTotal();
    });

})(jQuery);
