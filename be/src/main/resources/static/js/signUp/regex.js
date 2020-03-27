import { $ } from "/js/common/util.js";
import { TARGET, REGEX_PATTERN, REGEX_CLASS, REGEX_MESSAGE } from "/js/signUp/regexUtil.js";


export function allEventListener() {
    $('#id').addEventListener("blur", idRegexCheck);
    $('#password').addEventListener("blur", passwordRegex);
    $('#password_check').addEventListener("blur", passwordRecheck);
    $('#year').addEventListener("blur", yearCheck);
}

function idRegexCheck(event) {
    const target = TARGET.userId;
    const userId = event.target.value;
    const idRegex = new RegExp(REGEX_PATTERN.userId);
    if (idRegex.test(userId)) {
        idDuplicationCheck(target, userId);
    } else {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.userId.error;
    }
}

async function idDuplicationCheck(target, userId) {
    const options = {
        method: "GET"
};
    const response = await fetch('https://heroku-test-signup.herokuapp.com/validate/id?userId=${userId}', options);
    const result = await response.json();
    idDuplicationResult(target, result);
}
function idDuplicationResult(target, result) {
    if (result.status === "OK") {
        target.className = REGEX_CLASS.success;
        target.innerText = REGEX_MESSAGE.userId.duplication.success;
    } else {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.userId.duplication.error;
    }
}

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

function passwordRegexCheck(options) {
    const target = TARGET.password;
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
function passwordRecheck(event) {
    const password = $("#password").value;
    const passwordCheck = event.target.value;
    const target = TARGET.passwordCheck;
    if (password === passwordCheck) {
        target.className = REGEX_CLASS.success;
        target.innerText = REGEX_MESSAGE.passwordCheck.success;
    } else {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.passwordCheck.error;
    }
}

function yearCheck(event) {
    const userYear = event.target.value;
    const thisYear = new Date().getFullYear();
    const age = (thisYear - userYear) + 1;
    const target = TARGET.birth;
    if (!(age >= 15 && age <= 99)) {
        target.className = REGEX_CLASS.error;
        target.innerText = REGEX_MESSAGE.birth.error.year;
    } else {
        target.innerText = ""; 
    }
}