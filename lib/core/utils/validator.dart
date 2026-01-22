class Validator {
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Plz, enter name";
    }
    return null;
  }

  static String? validateEmail(String? email) {
    var emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (email == null || email.trim().isEmpty) {
      return "Plz, enter email";
    }
    if (!emailRegEx.hasMatch(email)) {
      return "E-mail bad format";
    }
    return null;
  }

  static String? validatePasswrod(String? password) {
    if (password == null || password.trim().isEmpty) {
      return "Plz, enter password";
      // }
      // if(password.length < 6){
      //   return "Password should be at least 6 chars";
      // }
    }
  }
}
