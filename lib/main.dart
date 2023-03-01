import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seller_ecomerce/const/seller_const.dart';
import 'package:seller_ecomerce/view/home/seller_home.dart';
import 'package:seller_ecomerce/view/seller_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLoggedin = false;
  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        print('User is currently signed out!');
        setState(() {
          isLoggedin = false;
        });
      } else {
        print('User is signed in!');
        setState(() {
          isLoggedin = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      )),
      home: isLoggedin ? const SellerHomeScreen() : const SellerAppLogin(),
    );
  }
}
