import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmobilescanner/blocs/auth/auth.dart';
import 'package:shopmobilescanner/repositories/auth_repository.dart';
import 'package:shopmobilescanner/screens/scan_screen.dart';
import 'package:shopmobilescanner/screens/splash/splash_screen.dart';
import 'blocs/app_bloc_delegate.dart';
import 'screens/login_screen.dart';
import 'network/ApiClient.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static final AuthRepository _authRepository = AuthRepository(
    client: ApiClient(
      dio: Dio(BaseOptions(
        baseUrl: ApiClient.baseUrl,
        connectTimeout: ApiClient.connectTimeout,
        receiveTimeout: ApiClient.receiveTimeout,
        sendTimeout: ApiClient.sendTimeout,
        responseType: ResponseType.plain,
      ))
        ..interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true)),
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop scanner',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: LoginScreen(),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => BlocProvider<AuthBloc>(
          builder: (context) =>
              AuthBloc(repository: _authRepository),
          child: LoginScreen(),
        )
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}