import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators {
  final _emailC = BehaviorSubject<String>();
  final _passwordC = BehaviorSubject<String>();

  get changeEmail => _emailC.sink.add;
  get changePassword => _passwordC.sink.add;
  get email => _emailC.stream.transform(validateEmail);
  get password => _passwordC.stream.transform(validatePassword);
  get submitValid =>
      Rx.combineLatest2(email, password, (email, password) => true);

  submit() {
    final finalEmail = _emailC.value;
    final finalPassword = _passwordC.value;

    print('Email entered $finalEmail');
    print('Password entered $finalPassword');
  }

  dispose() {
    _emailC.close();
    _passwordC.close();
  }
}
