// 일단 기능 기능 구현 후, js 파일 리팩토링 + 분할 작업 예정

const idInput = document.querySelector('#id');
idInput.addEventListener("blur", idRegExpCheck);

// 아이디 유효성 검사
function idRegExpCheck(event) {
    const idRegExp = new RegExp(/^[a-z0-9-_]{5,20}$/);
    if (idRegExp.test(event.target.value)) {
        idDupCheck(event.target.value);
    } else if (event.target.value === "") {
        document.querySelector('.idRegExp').style.display = 'none';
    } else {
        document.querySelector('.idRegExp').style.display = 'block';
    }
}

// 아이디 중복 검사
// BE와 협의 후 다시 코드 조율
async function idDupCheck(id) {
    const options = {
        method: 'GET',
        // id: id,
        // headers: {
        //     'Content-Type': 'application/json'
        // }
        mode: 'no-cors'
    };
    const response = await fetch("https://heroku-test-signup.herokuapp.com/validate/id", options);
    // const result = response.json;
    console.log(response);
}