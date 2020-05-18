

import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';


void main() => runApp(MyApp());

/// The main widget.
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

/// The main widget state.
class _MyAppState extends State<MyApp> {
  /// Whether dark mode is enabled.
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nothing App',
      theme: _AppTheme.of(isDarkModeEnabled).themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(title: Text('Day / night switcher example')),
        body: SizedBox.expand(
          child: Stack(
            children: [
              Positioned(
                top: 25,
                right: 5,
                width: 50,
                height: 50,
                child: DayNightSwitcher(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nothing',
                      style: new TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
              ),Positioned(
                bottom: 5,
                left: 5,
               
                child: Text(
                  '© DeeUsman',style: new TextStyle(
                        fontSize: 12.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Called when the state (day / night) has changed.
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }
}

/// A basic app theme class.
class _AppTheme {
  /// The primary color.
  final Color primaryColor;

  /// The scaffold background color.
  final Color scaffoldBackgroundColor;

  /// The text color.
  final Color textColor;

  /// Creates a new app theme instance.
  const _AppTheme({
    @required this.primaryColor,
    this.scaffoldBackgroundColor,
    this.textColor,
  });

  /// Creates a Flutter theme data.
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: TextTheme(
          body1: TextStyle(color: textColor),
        ),
      );

  /// Returns the corresponding app theme.
  static _AppTheme of(bool isDarkModeEnabled) =>
      isDarkModeEnabled ? _DarkAppTheme() : _LightAppTheme();
}

/// The light app theme.
class _LightAppTheme extends _AppTheme {
  /// Creates a new light app theme instance.
  _LightAppTheme() : super(primaryColor: Colors.blue);
}

/// The dark app theme.
class _DarkAppTheme extends _AppTheme {
  /// Creates a new dark app theme instance.
  _DarkAppTheme()
      : super(
          primaryColor: const Color(0xFF253341),
          scaffoldBackgroundColor: const Color(0xFF15202B),
          textColor: Colors.white70,
        );
}
