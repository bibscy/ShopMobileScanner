import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class Login extends AuthEvent {
  final String email;
  final String password;

  Login({@required this.password, this.email})
      : assert(email != null, password != null),
        super([email, password]);

  @override
  String toString() => 'Login{email: $email, password: $password}';
}