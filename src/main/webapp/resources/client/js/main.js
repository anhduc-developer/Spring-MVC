(function ($) {
    "use strict";

    /**************** Spinner ****************/
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner(0);

    /**************** Fixed Navbar ****************/
    $(window).scroll(function () {
        if ($(window).width() < 992) {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow');
            } else {
                $('.fixed-top').removeClass('shadow');
            }
        } else {
            if ($(this).scrollTop() > 55) {
                $('.fixed-top').addClass('shadow').css('top', 0);
            } else {
                $('.fixed-top').removeClass('shadow').css('top', 0);
            }
        } 
    });

    /**************** Back to top button ****************/
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });

    /**************** Testimonial carousel ****************/
    $(".testimonial-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{ items:1 },
            576:{ items:1 },
            768:{ items:1 },
            992:{ items:2 },
            1200:{ items:2 }
        }
    });

    /**************** Vegetable carousel ****************/
    $(".vegetable-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        center: false,
        dots: true,
        loop: true,
        margin: 25,
        nav : true,
        navText : [
            '<i class="bi bi-arrow-left"></i>',
            '<i class="bi bi-arrow-right"></i>'
        ],
        responsiveClass: true,
        responsive: {
            0:{ items:1 },
            576:{ items:1 },
            768:{ items:2 },
            992:{ items:3 },
            1200:{ items:4 }
        }
    });

    /**************** Modal Video ****************/
    $(document).ready(function () {
        var $videoSrc;
        $('.btn-play').click(function () {
            $videoSrc = $(this).data("src");
        });

        $('#videoModal').on('shown.bs.modal', function () {
            $("#video").attr('src', $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0");
        });

        $('#videoModal').on('hide.bs.modal', function () {
            $("#video").attr('src', $videoSrc);
        });
    });

    /**************** Giỏ hàng - Product Quantity ****************/
    function formatCurrency(value) {
        return Number(value).toLocaleString('vi-VN');
    }

    function updateCartTotal() {
        let total = 0;
        $("table tbody tr").each(function () {
            const $row = $(this);
            const price = parseFloat($row.find(".price").data("price")) || 0;
            const quantity = parseInt($row.find("input.quantity").val()) || 1;
            const subtotal = price * quantity;

            // Cập nhật subtotal sản phẩm
            $row.find(".total").text(formatCurrency(subtotal) + " đ");

            total += subtotal;
        });

        // Cập nhật tổng giỏ hàng
        $("#cart-total").text(formatCurrency(total) + " đ");
    }

    // Nút + / -
    $(document).on("click", ".btn-increase, .btn-decrease", function () {
        const $row = $(this).closest("tr");
        const $input = $row.find("input.quantity");
        let val = parseInt($input.val()) || 1;

        if ($(this).hasClass("btn-increase")) val++;
        else if ($(this).hasClass("btn-decrease") && val > 1) val--;

        $input.val(val);
        updateCartTotal();
    });

    // Nhập thủ công số lượng
    $(document).on("input", "input.quantity", function () {
        let val = parseInt($(this).val()) || 1;
        if (val < 1) val = 1;
        $(this).val(val);
        updateCartTotal();
    });

    // Cập nhật tổng khi load trang
    $(document).ready(function () {
        updateCartTotal();
    });

})(jQuery);
