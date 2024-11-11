class Validations {
  // Validations().int;
  static final Validations _singleton = new Validations._internal();
  Validations._internal();
  static Validations get instance => _singleton;

  get email => (val, isRequired, label) {
        // debugPrint("val" + val);
        // final emailRegExp = RegExp(r"[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        final emailRegExp = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+$");
        return isRequired == true && val == ""
            ? label + " is required."
            : emailRegExp.hasMatch(val) && val != null
                ? null
                : "Invalid format of " + label.toString().toLowerCase() + ".";
      };

  get isValidName => (val, isRequired, label) {
        final nameRegExp = new RegExp(r"^[^-\s][a-zA-Z0-9_\s-]+$");
        // return nameRegExp.hasMatch(val);
        return isRequired == true && val == ''
            ? label + " is required."
            : nameRegExp.hasMatch(val) && val != null
                ? null
                : "Invalid format of " + label.toString().toLowerCase() + ".";
      };

  get password => (val, isRequired, label) {
        // debugPrint("val" + val);

        final passwordRegExp = RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
        // return passwordRegExp.hasMatch(val);

        return isRequired == true && val == ''
            ? label + " is required."
            : passwordRegExp.hasMatch(val) && val != null
                ? null
                : "Minimum eight characters. at least one letter,one number and one special character.";
      };

  get confirmPassword => (val1, val2) {
        return val1.toString() == val2.text.toString()
            ? null
            : 'Password Mismatch';
      };

  get number => (val, isRequired, label) {
        final passwordRegExp = RegExp(r"^[0-9]{5,13}$");
        // return passwordRegExp.hasMatch(val);
        return isRequired == true && val == ''
            ? label + " is required."
            : passwordRegExp.hasMatch(val) && val != null
                ? null
                : "Invalid format of " + label.toString().toLowerCase() + ".";
      };
}
