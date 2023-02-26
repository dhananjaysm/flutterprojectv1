import 'package:flutter/services.dart';
import 'package:mileazofltr/logic/cubits/login_cubit/login_cubit.dart';
import 'package:mileazofltr/routes/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:mileazofltr/services/authentication.dart';
import 'package:mileazofltr/utils/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final preferences = await SharedPreferences.getInstance();
  final authenticationRepository = AuthenticationRepositoryImpl(
      httpClient: http.Client(),
      baseUrl: 'https://reqres.in/api',
      preferences: preferences);
  Bloc.observer = const AppBlocObserver();
  runApp(ProviderScope(
      child: MyApp(
    authenticationRepository: authenticationRepository,
  )));
}

/// {@template app_bloc_observer}
/// Custom [BlocObserver] that observes all bloc and cubit state changes.
/// {@endtemplate}
class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends ConsumerStatefulWidget {
  final AuthenticationRepository _authenticationRepository;
  const MyApp({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.white, // status bar color
    //     statusBarIconBrightness: Brightness.dark));
    final router = ref.watch(goRouterProvider); //gives instance for gorouter
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(
          authenticationRepository: widget._authenticationRepository),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'mileazofltr',
        theme: theme(),
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
