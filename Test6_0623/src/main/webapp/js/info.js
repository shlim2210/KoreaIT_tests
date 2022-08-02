function sendit(){
    const pwCheck = RegExp(/[a-zA-Z0-9]{4,20}$/);
    const nameCheck = RegExp(/^[가-힣]+$/);
    const hpCheck = RegExp(/^\d{3}-\d{3,4}-\d{4}$/);
    const emailCheck = RegExp(/^[a-zA-Z0-9\.\-]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z0-9]+/);

    if(!pwCheck.test($('#userpw').val())){
        alert('비밀번호를 형식에 맞게 입력하세요');
        $('#userpw').val('');
        $('#userpw').focus();
        return false;
    }

    if($('#userpw').val() != $('#userpw_re').val()){
        alert('비밀번호가 서로 다릅니다');
        $('#userpw').val('');
        $('#userpw_re').val('');
        $('#userpw').focus();
        return false;
    }

    if(!nameCheck.test($('#name').val())){
        alert('이름은 한글로 입력하세요');
        $('#name').val('');
        $('#name').focus();
        return false;
    }
    
    if(!hpCheck.test($('#hp').val())){
        alert('휴대폰 형식에 맞게 입력하세요');
        $('#hp').val('');
        $('#hp').focus();
        return false;
    }

    if(!emailCheck.test($('#email').val())){
        alert('이메일 형식에 맞게 입력하세요');
        $('#email').val('');
        $('#email').focus();
        return false;
    }
    
    let hobbyCheck = false;

    for(let i=0; i<$("[name='hobby']").length; i++){
        if($("input:checkbox[name='hobby']").eq(i).is(":checked") == true){
            hobbyCheck = true;
            break;
        }
    }

    if(!hobbyCheck){
        alert('취미는 한개이상 체크하세요');
        return false;
    }

    return true;
}