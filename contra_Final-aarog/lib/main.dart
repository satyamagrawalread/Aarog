import 'package:contra_care/account_pages/login1.dart';
import 'package:contra_care/account_pages/signup1.dart';
import 'package:contra_care/features/reminders/screens/add_new_medicine/add_new_medicine.dart';
import 'package:contra_care/provider/locale_provider.dart';
import 'package:contra_care/views/adminpanel.dart';
import 'package:contra_care/views/brandsinfo.dart';
import 'package:contra_care/views/home2.dart';
import 'package:contra_care/views/onboarding%20screen/onboard_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:contra_care/features/reminders/screens/home/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getInt('loggedin');
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.05),
      statusBarColor: Colors.black.withOpacity(0.05),
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          locale: provider.locale,
          home: Onboarding(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            "Login": (BuildContext context) => Login(),
            "SignUp": (BuildContext context) => SignUp(),
            "start": (BuildContext context) => Onboarding(),
            "home": (BuildContext context) => HomePage(),
            "pills": (BuildContext context) => PillsBrands(),
            "adminpanel": (BuildContext context) => AdminPanel(),
            "reminder": (BuildContext context) => Home(),
            "/add_new_medicine": (BuildContext context) => AddNewMedicine(),
          },
        );
      });
}