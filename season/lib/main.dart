import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:season/classes/entry.dart';
import 'package:season/view/authentication/authentication.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF002868),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Season Organics',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF002868),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFFFDF9B),
          onPrimaryContainer: Color(0xFF251A00),
          secondary: Color(0xFF4C53A5),
          onSecondary: Color(0xFFFCF9),
          secondaryContainer: Color(0xFFDEE0FF),
          onSecondaryContainer: Color(0x000000),
          tertiary: Color(0xFFC00015),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFDAD6),
          onTertiaryContainer: Color(0xFF410002),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410002),
          background: Color(0xFFFFFBFF),
          onBackground: Color(0xFF1E1B16),
          surface: Color(0xFFFFFBFF),
          onSurface: Color(0xFF1E1B16),
          surfaceVariant: Color(0xFFEDE1CF),
          onSurfaceVariant: Color(0xFF4D4639),
          outline: Color(0xFF7F7667),
          onInverseSurface: Color(0xFFF7F0E7),
          inverseSurface: Color(0xFF33302A),
          inversePrimary: Color(0xFFF9BD00),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF785A00),
          outlineVariant: Color(0xFFD0C5B4),
          scrim: Color(0xFF000000),
        ),
      ),
      // home:MyHome(),
      home: Authentication(),
    ),
  );
}
