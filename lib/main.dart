import 'package:assessment_app/src/config.dart';
import 'package:flutter/services.dart';
import 'package:assessment_app/src/screens.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.kWhite,
      builder: (context, child) {
        return Navigator(
          onGenerateRoute: (settings) {
            return PageRouteBuilder(pageBuilder: (context, _, __) => const OnboardingScreen());
          },
        );
      }
    );
  }
}
