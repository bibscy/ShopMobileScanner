import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shopmobilescanner/models/user.dart';
import 'package:shopmobilescanner/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthSate> {
 final AuthRepository repository;

 AuthBloc({@required this.repository}) : assert(repository != null);

// @override
  AuthSate get initialState => AuthEmpty();

  @override
  Stream<AuthSate> mapEventToState(AuthEvent event) async* {
    if (event is Login) {
      yield* _mapLogin(event);
    }
  }

  Stream<AuthSate> _mapLogin(
      AuthEvent event) async* {
    yield AuthLoading();
    try {
      final User user = await repository
          .login((event as Login).email, (event as Login).password);
      yield AuthLoaded(user: user);
    }  on DioError catch(e) {
      print(e);
      yield AuthError(error: e.message);
    }
  }
}
