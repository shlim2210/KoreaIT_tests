
function sendit(){
    const userid = document.getElementById('userid');
    const userpw = document.getElementById('userpw');
    const username = document.getElementById('username');
    const nickname = document.getElementById('nickname');
    const email = document.getElementById('email');
    const gender = document.getElementById('gender');
    const userphone = document.getElementById('userphone');
    const zipcode = document.getElementById('sample6_postcode');

    // 아이디에 영문자, 숫자, _가 포함되어야 할 경우
    const expIdText = /^(?=.*[A-Za-z])(?=.*\d)(?=.*_).{3,16}$/;
    // 아이디에 영문자, 숫자, _만 포함되어야 할 경우 
    // const expIdText = /^(?=.*[A-Za-z])(?=.*\d)(?=.*_)[A-Za-z0-9\_]{3,16}$/;  
    const expPwText = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*]).{3,16}$/;
    const expNameText = /^[가-힣]+$/;
    const expNickText = /^[a-zA-Z0-9가-힣]+$/;
    const kExpNickText = /[가-힣]/;
    const eExpNickText = /[A-Za-z]/;
    const expEmailText = /^[A-Za-z0-9\-\.]+@[A-Za-z0-9\-\.]+\.[A-Za-z]+$/;
    const expHpText = /^\d{3}\d{3,4}\d{4}$/;


    // 1. 아이디 3자이상 ~ 16자 이하로 체크
    if(userid.value.length < 3 || userid.value.length > 16){
        alert("1. 아이디는 3자 이상 16자 이하로 입력하세요");
        userid.focus();
        return false;
    }

    // 2. 아이디가 영문자, 숫자, _를 포함해야한다
    if(!expIdText.test(userid.value)){
        alert("2. 아이디는 영문자, 숫자와 _를 포함하여 입력하세요");
        userid.focus();
        return false;
    }

    // 3. 패스워드 3자이상 ~ 16자 이하로 체크
    if(userpw.value.length < 3 || userpw.value.length > 16){
        alert("3. 패스워드는 3자 이상 16자 이하로 입력하세요");
        userpw.focus();
        return false;
    }

    // 4. 비밀번호에 대문자, 소문자, 특수문자, 숫자가 1개이상 포함해야 한다
    if(!expPwText.test(userpw.value)){
        alert(`4. 비밀번호는 대문자, 소문자, 특수문자, 숫자를 1개 이상 포함하여 입력하세요. 특수문자는 !@#$%^&*만 사용 가능합니다.`);
        userpw.focus();
        return false;
    }

    // 5. 패스워드와 패스워드 확인에 입력한 값이 같아야 한다
    if(userpw.value != userpw_re.value){
        alert("5. 비밀번호와 비밀번호 확인의 값이 다릅니다.");
        userpw_re.focus();
        return false;
    }

    // 6. 이름 (한글만 사용해야 한다.)
    if(!expNameText.test(username.value)){
        alert("6. 이름은 한글만 입력 가능 합니다.");
        username.focus();
        return false;
    }

    // 별명에 입력한 값을 한글자씩 확인하여 한글과 영문자의 글자수 세기
    let arr = nickname.value.split("");
    let kcnt = 0;
    let ecnt = 0;
    for(let i=0;i<arr.length;i++){
        if(kExpNickText.test(arr[i])){
            kcnt++;
        }else if(eExpNickText.test(arr[i])){
            ecnt++;
    }
}

    //!!!7. 별명 (공백없이 한글, 영문, 숫자만 입력 가능하며 한글2자, 영문자 4자이상이여야 한다)
    if((!expNickText.test(nickname.value))||kcnt<2||ecnt<4){
        alert("7. 별명은 공백없이 한글, 영문, 숫자만 입력 가능하며 한글2자, 영문자4자 이상이어야 합니다.");
        nickname.focus();
        return false;
    }


    // 8. 이메일(이메일 형식에 맞게 입력해야한다.)
    if(!expEmailText.test(email.value)){
        alert("이메일 형식을 확인하세요");
        email.focus();
        return false;
    }

    // 9. 성별 (반드시 선택)
    if(gender.value=="unselected"){
        alert("성별을 선택해 주세요");
        gender.focus();
        return false;
    }

    // 10. 휴대폰 번호 (-없이 숫자만 입력)
    if(!expHpText.test(userphone.value)){
        alert("휴대폰 번호 형식을 확인하세요(-없이 숫자만 입력해서 작성)");
        userphone.focus();
        return false;
    }

    // 11. 주소
    if(zipcode.value==""){
        alert("우편번호를 입력하세요");
        zipfind.focus();
        return false;
    }

    alert(`${userid.value}님, 회원가입을 완료하였습니다!`)
    return true;
}


//서명란 ==> canvas
const canvas = document.getElementById("canvas");

let context = canvas.getContext("2d");
let start_background_color ="white";
context.fillStyle = start_background_color;
context.fillRect(0,0,canvas.width, canvas.height);

let draw_color ="black";
let draw_width = "5";
let is_drawing = false;

canvas.addEventListener("mousedown",start, false); 
canvas.addEventListener("mousemove",draw, false);
canvas.addEventListener("mouseup",stop, false); 
canvas.addEventListener("mouseout",stop, false); 

function start(event){
    is_drawing = true;
    context.beginPath();
    context.moveTo(event.offsetX, event.offsetY); 
    event.preventDefault(); 
}

function draw(event){
    if(is_drawing){
        context.lineTo(event.offsetX, event.offsetY);
        context.strokeStyle = draw_color; 
        context.lineWidth =draw_width; 
        context.lineCap ="round";  
        context.lineJoin ="round"; 
        context.stroke();
    }
}

function stop(event){
    if (is_drawing){
        context.stroke();
        context.closePath(); 
        is_drawing =false;
    }
    event.preventDefault();
}


//자기소개 ==> 텍스트 에디터 연결
ClassicEditor.create( document.querySelector( '#editor' ) ).catch( error => {console.error( error );} );


// 주소찾기 다음 API
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}