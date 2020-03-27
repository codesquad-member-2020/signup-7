import { $ } from "/js/common/util.js";
// 타겟
export const TARGET = {
    userId: $("#id-message"),
password: $("#password-message"),
passwordCheck: $("#password-check-message"),
birth: $("#birth-message")
}
// 정규식 패턴
export const REGEX_PATTERN = {
    userId: /^[a-z0-9-_]{5,20}$/,
    password: {
        length: /.{8,16}$/,
        upper: /^(?=.*[A-Z])/,
        number: /^(?=.*[0-9])/,
        symbol: /^(?=.*[!@#$%^*+=-])/
    }
}
// 메시지가 들어가는 태그의 클래스 이름
export const REGEX_CLASS = {
    success: "success",
error: "error"
}
// 유효성 메시지
export const REGEX_MESSAGE = {
    userId: {
        error: "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.",
duplication: {
    success: "사용 가능한 아이디입니다.",
    error: "이미 사용 중인 아이디입니다."
}
},
password: {
    success: "안전한 비밀번호입니다.",
    error: {
        length: "8자 이상 16자 이하로 입력해주세요.",
        upper: "영문 대문자를 최소 1자 이상 포함해주세요.",
        number: "숫자를 최소 1자 이상 포함해주세요.",
        symbol: "특수문자를 최소 1자 이상 포함해주세요."
    }
},
passwordCheck: {
    success: "비밀번호가 일치합니다.",
    error: "비밀번호가 일치하지 않습니다."
},
birth: {
    error: {
        year: "태어난 년도 4자리를 정확하게 입력하세요."
    }
}
}