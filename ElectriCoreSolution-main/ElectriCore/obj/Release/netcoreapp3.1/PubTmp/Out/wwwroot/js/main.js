﻿var DisableView = function () {
    $('form').find("input[type='text'],input[type='password'],textarea,input[type='checkbox'],input[type='radio'],select").not('.hideShowPass').each(function () {
        $(this).attr("disabled", "disabled");
    });
    $('form').removeAttr("action");
}
var EnableDisableArea = function (area, object_type) {
    var main_context = $('form');
    if (area != "") {
        main_context = $(area);
    }
    if (object_type == "Disable") {
        main_context.find("submit,button,input[type='checkbox'],input[type='radio'],select").each(function () {
            $(this).attr("disabled", "disabled");
        });
        main_context.find("input[type='text'],input[type='password'],textarea").each(function () {
            $(this).attr("readonly", "readonly");
        });
        main_context.find("a").each(function () {
            $(this).addClass("disabled");
        });
    } else {
        main_context.find("input[type='text'],input[type='password'],textarea").each(function () {
            $(this).removeAttr("readonly");
        });
        main_context.find("a").each(function () {
            $(this).removeClass("disabled");
        });
        main_context.find("submit,button,input[type='checkbox'],input[type='radio'],select").each(function () {
            $(this).removeAttr("disabled");
        });
    }
}
//var formLoader = "#Loader";
onFormSubmitBegin = function () {
    EnableDisableArea("", "Disable");
}
onFormSubmitComplete = function () {

}
onFormFailure = function (response) {
    EnableDisableArea("", "Enable");
    toastr.error(response.message, "Error", {
        timeOut: "5000"
    });
}
onFormSuccess = function (response) {
    var responseTypeArray = response.type.split('-');
    if (response.success == true) {
        className = "text-success";
    } else {
        className = "text-danger";
    }
    $.each(responseTypeArray, function (key, value) {
        if (value == "M") {
            toastr.success(response.message, "Success", {
                timeOut: "5000"
            });
        } else if (value == "R") {
            $('form')[0].reset();
            $(".hidea-area").hide();
            if ($(".select2-zero").length > 0) {
                $(".select2-zero").select2("val", "0");
                $(".select2-zero").trigger('change.select2');
            } else if ($(".select2-hidden-accessible").length > 0) {
                $(".select2-hidden-accessible").select2("val", "");
                $(".select2-hidden-accessible").trigger('change.select2');
            }
        } else if (value == "T") {
            window.location = response.targetURL;
        } else if (value == "TD") {
            setTimeout(function () {
                window.location = response.targetURL;
            }, 2000);
        } else if (value == "RL") {
            window.location.reload();
        } else if (value == "RLD") {
            setTimeout(function () {
                window.location.reload();
            }, 2000);
        } else if (value == "D") {
            toastr.success(response.message, "Success", {
                timeOut: "5000"
            });
        } else if (value == "MN") {
            var active = $('.nav-tabs-setup li.active');
            if (response.success == true) {
                if (response.fieldName != "Exit") {
                    var nextActive = active.next().removeClass('disabled').addClass('active');
                    nextTab(nextActive);
                    toastr.success(response.message, "Success", {
                        timeOut: "5000"
                    });
                } else {
                    toastr.success(response.message, "Success", {
                        timeOut: "5000"
                    });
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                }
                $('.nav-tabs-setup li[aria-expanded="false"]').addClass('active');
            } else {
                $('#btnSubmit').show();
                toastr.error(response.message, "Error", {
                    timeOut: "5000"
                });
            }
        }
    });
    EnableDisableArea("", "Enable");
}
jQuery(function ($) {
    $(".CnicFormat").mask("99999-9999999-9");
    $(".number").mask("999-999-9999");
    $("#date").mask("99/99/9999");
    $(".ContactNoFormat").mask("9999-9999999");
    $("#ext").mask("(999) 999-9999? Ext.99999");
    $("#mobile").mask("+99 999 999 999");
    $("#percent").mask("99%");
    $("#productkey").mask("a*-999-a999");
    $("#orderno").mask("PO: aaa-999-***");
    $("#date2").mask("99/99/9999", { autoclear: false });
    $("#date3").mask("99/99/9999", {
        autoclear: false,
        completed: function () {
            alert("Completed!");
        }
    });
    $("#mobile2").mask("+1 999 999 999");
});
$(function () {
    $('select').select2({ width: '100%', placeholder: "Select an Option", allowClear: true });
    $('.select2-search__field').focus();
});
$(document).on('select2:open', () => {
    document.querySelector('.select2-search__field').focus();
});
function USDConvertPKR(USDRate, USDAmount) {
    let PKR = parseFloat(parseFloat(USDRate) * parseFloat(USDAmount)).toFixed(2);
    return isNaN(PKR) ? 0 : PKR;
}
$('#AmountUsd').keyup(function () {
    let PKR = USDConvertPKR($('#UsdRate').val(), $('#AmountUsd').val());
    $('#AmountPkr').val(PKR);
    $('#ConversionAmount').val(PKR);
});
$('#UsdRate').keyup(function () {
    if ($(this).val() > 0) {
        $('#AmountUsd').attr('readonly', false);
    }
    else {
        $('#AmountUsd').attr('readonly', true);
    }
    if ($('#AmountUsd').val() > 0) {
        let PKR = USDConvertPKR($('#UsdRate').val(), $('#AmountUsd').val());
        $('#AmountPkr').val(PKR);
        $('#ConversionAmount').val(PKR);
    }
});
function ShowPassword(elem, cur) {
    if (elem.attr("type") === "password") {
        $(cur).find("i").toggleClass("fa-eye-slash fa-eye");
        elem.attr("type", "text");
    }
    else {
        $(cur).find("i").toggleClass("fa-eye fa-eye-slash");
        elem.attr("type", "password");
    }
}