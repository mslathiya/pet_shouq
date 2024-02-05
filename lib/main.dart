import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/config.dart';
import 'controller/controllers.dart';
import 'firebase_options.dart';
import 'helper/helpers.dart';
import 'theme/theme.dart';

late final FirebaseApp app;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await init();
  String type = await Get.find<AuthController>().getLoginType();
  runApp(MyApp(
    loginType: type,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.loginType});

  final String loginType;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String routeName = widget.loginType == ""
        ? intro
        : widget.loginType == "pet_parent"
            ? parentDashboard
            : vetDashboard;
    return ScreenUtilInit(
      designSize: const Size(375, 790),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(
          () => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            popGesture: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            getPages: generateRoute,
            translations: AppStrings(),
            locale: const Locale('en', "US"),
            fallbackLocale: const Locale('en', "US"),
            supportedLocales: const [
              Locale('en'),
            ],
            localizationsDelegates: const [
              ApplicationLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocaleLanguage in supportedLocales) {
                if (supportedLocaleLanguage.languageCode ==
                        locale?.languageCode &&
                    supportedLocaleLanguage.countryCode ==
                        locale?.countryCode) {
                  return supportedLocaleLanguage;
                }
              }
              return supportedLocales.first;
            },
            // initialRoute: controller.isLoggedIn ? vetDashboard : login,
            initialRoute:
                Get.find<AuthController>().isLoggedIn.value ? routeName : intro,
          ),
        );
      },
    );
  }
}
