import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/screen/login_screen.dart';
import 'package:flutter_architecture/utils/resource/string_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/route/route_manager.dart';
import 'config/theme/app_theme.dart';
import 'injection_conatainer.dart' as di;
import 'data/remote/api_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await EasyLocalization.ensureInitialized();


  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), ],
      path:
      'assets/translation', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Sizer(builder: (context, orientation, deviceType)  {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.loginRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: AppStrings.appTitle,
          theme: AppTheme.light,
        );
      }
      );
    // ),
    //);
  }
}

