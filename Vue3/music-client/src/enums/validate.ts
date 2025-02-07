// 登录规则
const validateName = (rule, value, callback) => {
  if (!value) {
    return callback(new Error("用户名不能为空"));
  } else {
    callback();
  }
};

export const validatePassword = (rule, value, callback) => {
  if (value === "") {
    callback(new Error("密码不能为空"));
  } else {
    callback();
  }
};

export const SignInRules = {
  username: [{ validator: validateName, trigger: "blur", min: 3, max: 12, message: "用户名长度需在3到12个字符之间" }],
  password: [{ validator: validatePassword, min: 6, max: 12, message: "密码长度需在6到12个字符之间" }],
};

// 注册规则
export const SignUpRules = {
  username: [
    { required: true, trigger: "blur", min: 3, max: 12, message: "用户名长度需在3到12个字符之间" }
  ],
  password: [
    { required: true, trigger: "blur", min: 6, max: 12, message: "密码长度需在6到12个字符之间" }
  ],
  sex: [{ required: true, message: "请选择性别", trigger: "change" }],
  phoneNum: [{ essage: "请选择日期", trigger: "blur" }],
  email: [
    { message: "请输入邮箱地址", trigger: "blur" },
    {
      type: "email",
      message: "请输入正确的邮箱地址",
      trigger: ["blur", "change"],
    },
  ],
  birth: [{ required: true, type: "date", message: "请选择日期", trigger: "change" }],
  introduction: [{ message: "请输入介绍", trigger: "blur" }],
  location: [{ message: "请输入地区", trigger: "change" }],
};
