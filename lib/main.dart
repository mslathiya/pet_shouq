import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shouq/controller/controllers.dart';

import 'config/config.dart';
import 'firebase_options.dart';
import 'helper/helpers.dart';
import 'theme/theme.dart';

late final FirebaseApp app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _routing();
    super.initState();
  }

  void _routing() async {
    await Get.find<SplashController>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 790),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetBuilder<SplashController>(
          builder: (controller) {
            return controller.isLoading
                ? const SizedBox()
                : GetMaterialApp(
                    debugShowCheckedModeBanner: false,
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
                    initialRoute: login,
                  );
          },
        );
      },
    );
  }
}
