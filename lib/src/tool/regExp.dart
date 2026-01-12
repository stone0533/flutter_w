class WRegExpStr {
  // 密碼需為 8 位以上，包含英文字母與數字
  static String password = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  // 電郵地址
  static String email = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}
