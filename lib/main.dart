import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yara/controller/networkcontroller.dart';
import 'package:yara/pages/about.dart';
import 'package:yara/pages/bankdetails.dart';
import 'package:yara/pages/changepasswd.dart';
import 'package:yara/pages/changepassword/cubit/changepassword_cubit.dart';
import 'package:yara/pages/contactus.dart';
import 'package:yara/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:yara/pages/homepage.dart';
import 'package:yara/pages/kycupdate.dart';
import 'package:yara/pages/language.dart';
import 'package:yara/pages/login.dart';
import 'package:yara/pages/login/cubit/login_cubit.dart';
import 'package:yara/pages/profile.dart';
import 'package:yara/pages/signup/cubit/signup_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NetworkController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  void isSession(context) async {
    final pref = await SharedPreferences.getInstance();
    final isloggedIn = pref.getBool("isUserLoggedIn");

    if (isloggedIn != null) {
      setState(() {
        isUserLoggedIn = true;
      });
    } else {
      setState(() {
        isUserLoggedIn = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isSession(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<SignupCubit>(
          create: (BuildContext context) => SignupCubit(),
        ),
        BlocProvider<DashboardCubit>(
          create: (BuildContext context) => DashboardCubit(),
        ),
        BlocProvider<ChangepasswordCubit>(
          create: (BuildContext context) => ChangepasswordCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade50),
        ),
        home: isUserLoggedIn ? HomePage() : Login(),
        routes: {
          "/profile": (context) => Profile(),
          "/changePasswd": (context) => ChnagePassword(),
          "/kycupdate": (context) => KYCUpdate(),
          "/bankdetails": (context) => Bankdetails(),
          "/contact": (context) => ContactUs(),
          "/about": (context) => AboutUs(),
          "/changelang": (context) => ChangeLanguage(),
        },
      ),
    );
  }
}
