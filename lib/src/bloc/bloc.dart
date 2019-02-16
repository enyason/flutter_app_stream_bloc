import 'dart:async';
import 'package:rxdart/rxdart.dart';

class Bloc {
  StreamController<String> emailController =
      StreamController<String>.broadcast();

  StreamController<String> passController =
      StreamController<String>.broadcast();

  var passTransformer = StreamTransformer<String, String>.fromHandlers(
      handleData: (String value, EventSink<String> sink) {
    print(value.length);

    if (value.length > 4) {
      sink.add(value);
    } else {
      sink.addError("password too short");
    }
  });

  var emailTransformer = StreamTransformer<String, String>.fromHandlers(
      handleData: (String value, EventSink<String> sink) {
    print(value.length);
    if (value.contains("@")) {
      sink.add(value);
    } else {
      sink.addError("invalid email");
    }
  });

  Stream<String> emailStream() {
    return emailController.stream.transform(emailTransformer);
  }

  Stream<String> passStream() {
    return passController.stream.transform(passTransformer);
  }

  Stream<bool> submitStream() {
    return Observable.combineLatest2(emailStream(), passStream(), (e, p) {
      print("email is $e and pass word is $p");
      return true;
    });
  }

  dispose() {
    emailController.close();
    passController.close();
  }
}

final Bloc bloc = Bloc();
