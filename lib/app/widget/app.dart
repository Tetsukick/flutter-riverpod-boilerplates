import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/colors.gen.dart';
import 'package:flutter_boilerplate/shared/constants/text_style_constants.dart';
import 'package:flutter_boilerplate/shared/route/app_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final ezContext = EasyLocalization.of(context)!;
    final primarySwatch = MaterialColor(ColorName.primaryColor.value, const {
      50: ColorName.primaryColor,
      100: ColorName.primaryColor,
      200: ColorName.primaryColor,
      300: ColorName.primaryColor,
      400: ColorName.primaryColor,
      500: ColorName.primaryColor,
      600: ColorName.primaryColor,
      700: ColorName.primaryColor,
      800: ColorName.primaryColor,
      900: ColorName.primaryColor,
    });
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: ColorName.red),
    );

    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: ColorName.primaryColor,
        primarySwatch: primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: ColorName.primaryColor,
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: ColorName.bgGray200,
          filled: true,
          border: border,
          focusedErrorBorder: errorBorder,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: errorBorder,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primarySwatch,
          accentColor: ColorName.primaryColor,
          backgroundColor: ColorName.bgWhite,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith((_) {
              return TextStyleConstants.titleLargeBoldPrimaryInter;
            }),
          ),
        ),
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: ColorName.primaryColor);
            }
            return const TextStyle(color: ColorName.gray700);
          }),
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: ColorName.primaryColor);
            }
            return const IconThemeData(color: ColorName.gray700);
          }),
        ),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        ezContext.delegate,
      ],
      supportedLocales: ezContext.supportedLocales,
      locale: ezContext.locale,
      routerConfig: router,
    );
  }

// @override
// Widget build(BuildContext context,WidgetRef ref) {
//   final goRouter = ref.watch(goRouterProvider);
//
//   return MaterialApp.router(
//     builder: (context, child) => ResponsiveWrapper.builder(
//         child,
//         maxWidth: 1200,
//         minWidth: 480,
//         defaultScale: true,
//         breakpoints: [
//           const ResponsiveBreakpoint.resize(480, name: MOBILE),
//           const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//           const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//           const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
//           const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
//         ],
//         background: Container(color: const Color(0xFFF5F5F5)),),
//
//     theme: ThemeData(
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//       colorScheme: ColorScheme.fromSwatch(
//         accentColor: const Color(0xFF13B9FF),
//       ),
//     ),
//     routerConfig: goRouter,
//   );
// }
//
// @override
// Widget build(BuildContext context,WidgetRef ref) {
//   return MaterialApp(
//     builder: (context, child) => ResponsiveWrapper.builder(
//         child,
//         maxWidth: 1200,
//         minWidth: 480,
//         defaultScale: true,
//         breakpoints: [
//           const ResponsiveBreakpoint.resize(480, name: MOBILE),
//                     const ResponsiveBreakpoint.autoScale(800, name: TABLET),
//                     const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//                     const ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
//                     const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
//         ],
//         background: Container(color: Color(0xFFF5F5F5))),
//    home: HomePage(),
//   );
// }
}
