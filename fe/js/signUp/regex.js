import { $ } from "../common/util.js";
import { REGEX_PATTERN, REGEX_CLASS, REGEX_MESSAGE } from "./regexUtil.js";

// 이벤트
export function eventHandler() {
    $('#id').addEventListener("blur", idRegexCheck);
    $('#password').addEventListener("blur", passwordRegex);
    $('#password_check').addEventListener("blur", passwordRecheck);
    $('#year').addEventListener("blur", yearCheck);
}

// 아이디 유효성 검사
function idRegexCheck(event) {
    const target = $('#id-message');
    const idRegex = new RegExp(REGEX_PATTERN.userId);
    if (idRegex.test(event.target.value)) {
        idDuplicationCheck(target, event.target.value);
    } else {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.userId.error;
    }
}

// 아이디 중복 검사
async function idDuplicationCheck(target, userId) {
    const options = {
        method: 'GET'
    };
    const response = await fetch(`https://heroku-test-signup.herokuapp.com/validate/id?userId=${userId}`, options);
    const result = await response.json();
    if (result.status === "OK") {
        target.className = REGEX_CLASS.success;
        target.innerText = REGEX_MESSAGE.userId.duplication.success;
    } else {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.userId.duplication.error;
    }
}

// 비밀번호 유효성 검사
function passwordRegex(event) {
    const options = {
        password: event.target.value,
        lengthRegex: new RegExp(REGEX_PATTERN.password.length),
        upperRegex: new RegExp(REGEX_PATTERN.password.upper),
        numberRegex: new RegExp(REGEX_PATTERN.password.number),
        symbolRegex: new RegExp(REGEX_PATTERN.password.symbol)
    }
    passwordRegexCheck(options);
}

// 비밀번호 유효성 검사
function passwordRegexCheck(options) {
    const target = $('#password-message');
    target.className = REGEX_CLASS.error;
    if (!options.lengthRegex.test(options.password)) {
        target.innerText = REGEX_MESSAGE.password.error.length;
    } else if (!options.upperRegex.test(options.password)) {
        target.innerText = REGEX_MESSAGE.password.error.upper;
    } else if (!options.numberRegex.test(options.password)) {
        target.innerText = REGEX_MESSAGE.password.error.number;
    } else if (!options.symbolRegex.test(options.password)) {
        target.innerText = REGEX_MESSAGE.password.error.symbol;
    } else {
        target.className = REGEX_CLASS.success;
        target.innerText = REGEX_MESSAGE.password.success;
    }
}

// 비밀번호 재확인 유효성 검사
function passwordRecheck(event) {
    const password = $('#password').value;
    const passwordCheck = event.target.value;
    const target = $('#password-check-message');
    if (password === passwordCheck) {
        target.className = REGEX_CLASS.success;
        target.innerText = REGEX_MESSAGE.password_check.success;
    } else {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.password_check.error;
    }
}

// 생년월일: 월 유효성 검사
function yearCheck() {
    const today = new Data();
    console.log(today);

}

// function isChild(birthDate) {
//     var today = new Date();
//     var yyyy = today.getFullYear();
//     var mm = today.getMonth() < 9 ? "0" + (today.getMonth() + 1) : (today.getMonth() + 1); // getMonth()
//     var dd = today.getDate() < 10 ? "0" + today.getDate() : today.getDate();

//     return parseInt(yyyy + mm + dd) - parseInt(birthDate) - 140000 < 0;
// }

