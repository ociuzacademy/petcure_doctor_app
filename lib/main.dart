import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_doctor_app/modules/home_module/view/home_page.dart';
import 'package:petcure_doctor_app/modules/login_module/view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  late final StatefulWidget initialWidget;

  final bool isLoggedIn = await AuthStorageFunctions.getLoginStatus();
  if (isLoggedIn) {
    initialWidget = const HomePage();
  } else {
    initialWidget = const LoginPage();
  }
  runApp(MyApp(initialWidget: initialWidget));
}

class MyApp extends StatelessWidget {
  final Widget initialWidget;
  const MyApp({super.key, required this.initialWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => DoctorProfileCubit()),
        BlocProvider(create: (context) => UpdateProfileBloc()),
        BlocProvider(create: (context) => TodayBookingsCubit()),
        BlocProvider(create: (context) => AppointmentDetailsCubit()),
        BlocProvider(create: (context) => CompleteAppointmentBloc()),
        BlocProvider(create: (context) => TreatmentHistoryCubit()),
        BlocProvider(create: (context) => TreatmentDetailsCubit()),
      ],
      child: MaterialApp(
        title: 'Petcure Doctor App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: initialWidget,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
