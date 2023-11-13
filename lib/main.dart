
import 'package:ev2go/presentation/screens/authentication/welcome_screen.dart';
import 'package:ev2go/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/retry.dart';
import 'package:http/http.dart' as http;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]
  );

  //this code is not needed
   final client = RetryClient(http.Client());
  try {
    var pro = await client.read(Uri.https(
          "goelectra-394508.el.r.appspot.com"));
          Fluttertoast.showToast(msg: pro,toastLength: Toast.LENGTH_SHORT);
  }catch(e){
    // print("error"+e.toString());
    Fluttertoast.showToast(msg: e.toString(),toastLength: Toast.LENGTH_SHORT);
  }
   finally {
    client.close(); 
  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context ) {

    return ScreenUtilInit(
      designSize: const Size(432,936),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(_ , child) => MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.welcome,
      onGenerateRoute: _appRouter.onGenerateRoute,
      //home:MainPage()
      ),
    );
  }
}

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   SharedPreferences? sharedPreferences;
//   var stringResponse;

//   @override

//   void initState(){
//     super.initState();
//     loginStatus();
//   }

//   loginStatus() async{
//     sharedPreferences = await SharedPreferences.getInstance();
//     if(sharedPreferences?.getString("uid")==null){
//       Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.LOGIN, (route) => false);
//     }else{
//       Navigator.of(context).pushNamedAndRemoveUntil(HomePage.HOME, (route) => false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }