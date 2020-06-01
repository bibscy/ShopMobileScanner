import 'package:shopmobilescanner/models/user.dart';
import 'package:shopmobilescanner/network/ApiClient.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final ApiClient client;

  AuthRepository({@required this.client}) : assert(client != null);

  Future<User> login(String email, String password) async =>
      client.login(email, password);

}