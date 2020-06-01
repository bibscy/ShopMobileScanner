import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shopmobilescanner/models/user.dart';

@immutable
abstract class AuthSate extends Equatable {
  AuthSate([List props = const []]) : super(props);
}

class AuthEmpty extends AuthSate {
  @override
  String toString() => 'AuthEmpty{}';
}

class AuthLoading extends AuthSate {
  @override
  String toString() => 'AuthLoading{}';
}

class AuthLoaded extends AuthSate {
  final User user;

  AuthLoaded({@required this.user})
      : assert(user != null),
        super();

  @override
  String toString() => 'AuthLoaded{}';
}

class AuthError extends AuthSate {
  final String error;

  AuthError({@required this.error})
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'AuthError{error: $error}';
}
