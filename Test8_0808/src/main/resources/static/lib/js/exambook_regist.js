$(function(){
    let category = document.getElementById("category").getAttribute("value");
    $(document).on('click', '#sendit', function(){
        const expBkPrice = RegExp(/^[0-9]+$/);


        if(!$('#bkTitle').val()){
            alert('도서 제목을 입력하세요');
            $('#bkTitle').focus();
            return false;
        }

        if(!$('#bkSummary').val()) {
            alert('도서소개를 입력하세요');
            $('#bkSummary').focus();
            return false;
        }

        if(!$('#bkPrice').val()){
            alert('도서가격을 입력하세요');
            $('#bkPrice').focus();
            return false;
        }

        if(!expBkPrice.test($('#bkPrice').val())){
            alert('가격은 자연수만 입력 가능합니다');
            $('#bkPrice').focus();
            return false;
        }

        let jsonData = {
            transaction_time: new Date(),
            resultCode:"ok",
            description:"ok",
            data:{
                bkTitle: $('#bkTitle').val(),
                bkSummary: $('#bkSummary').val(),
                bkPrice: $('#bkPrice').val()
            }
        }

        $.post({
            url: '/api/'+category,
            data: JSON.stringify(jsonData),
            dataType: 'json',
            contentType: 'application/json',
            success: function(){
                alert('등록성공!');
                location.href='/'+category+'/list';
            },
            error: function(){
                alert('등록실패!');
                location.reload();
            }
        });
    });
});
