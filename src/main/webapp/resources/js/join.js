function joinChk(){

	if (!document.join.member_id.value) {
        document.join.member_id.focus();
        alert("아이디를 입력하십시요.");
        return false;
    }
    
    var member_id = document.join.member_id.value;
     var regId = /^[a-z0-9_-]{4,15}$/;
    
     if (!regId.test(member_id)) {
        alert("아이디는 4~15자의 영문 소문자, 숫자, '_', '-'를 사용가능합니다");
        document.join.member_id.focus();
        return false;
    }
    
     if (!document.join.password.value) {
        alert("비밀번호를 입력하십시요.");
        document.join.password.focus();
        return false;
    }
    
    var password = document.join.password.value;
    var password_verify = document.join.password_verify.value;
    var regPassword = /^[a-zA-Z0-9!@#$%^&*()_+]{6,16}$/;
    
     if (!regPassword.test(password)) {
        alert("비밀번호는 비밀번호: 6~16자의 영문 대/소문자, 숫자, 특수문자를 사용가능합니다");
        document.join.password.focus();
        return false;
    }
    
    if (password != password_verify) {
        document.join.password_verify.focus();
        alert("비밀번호확인이 비밀번호와 일치 하지 않습니다.");
        return false;
    }
    
     if (!document.join.nickname.value) {
        alert("닉네임을 입력하십시요.");
        document.join.nickname.focus();
        return false;
    }

     if (!document.join.contact.value) {
        alert("연락처를 입력하십시요.");
        document.join.contact.focus();
        return false;
    }
    
    var contact = document.join.contact.value;
    var regContact = /^\d{3}-\d{3,4}-\d{4}$/;
     
     if (!regContact.test(contact)) {
        alert("연락처는 010-1234-5678 형태로 기입해주세요");
        document.join.contact.focus();
        return false;
    }
    
    
     if (!document.join.email.value) {
        alert("이메일을 입력하십시요.");
        document.join.email.focus();
        return false;
    }

	var regEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	var email = document.join.email.value;
	
	if (!regEmail.test(email)) {
        alert("이메일을 올바른 형태로 기입해주세요.");
        document.join.email.focus();
        return false;
    }
	
     if (!document.join.codeInput.value) {
        alert("이메일 인증 후 가입이 가능합니다.");
        document.join.codeInput.focus();
        return false;
    }
    
    
}