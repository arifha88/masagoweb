import 'dart:async';

class Validators {
  static String passwords = "";

  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isNotEmpty) {
      sink.add(username);
    } else {
      sink.addError("Data must be not empty");
    }
  });

  final validateOtp =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length >= 6) {
      sink.add(data);
    } else {
      sink.addError("OTP must be at least 4 characters");
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
      passwords = password;
    } else {
      sink.addError("Password must be at least 4 characters");
    }
  });

  final validateConfirmPassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (cPassword, sink) {
    if (cPassword.length > 3 && cPassword == passwords) {
      sink.add(cPassword);
    } else if (cPassword != passwords) {
      sink.addError("Confirm password not match");
    } else {
      sink.addError("Password must be at least 4 characters");
    }
  });

  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isNotEmpty) {
      sink.add(name);
    } else {
      sink.addError("Name must be not empty");
    }
  });

  final validateCode =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isNotEmpty) {
      sink.add(name);
    } else {
      sink.addError("Code must be not empty");
    }
  });

  final validatePhoneNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
    if (data.length > 1) {
      sink.add(data);
    } else {
      sink.addError("Phone number must be not empty");
    }
  });
}
