import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state_notifier.dart';
import 'post_preview.dart';
import 'user.dart';
import 'group.dart';
import 'post.dart';
import 'internet.dart';
import 'print.dart';
import 'faults.dart';
import 'settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool themeMode=false;
  if(!preferences.containsKey('themeMode')){
    preferences.setBool('themeMode', true);
    themeMode=true;
  }else{
    themeMode=preferences.getBool('themeMode');
  }
  runApp(
      ChangeNotifierProvider<AppStateNotifier>(
        create: (context) => AppStateNotifier(),
        child: MainRoute(themeMode: themeMode,)
      )
  );
}

class MainRoute extends StatefulWidget {
  final bool themeMode;
  const MainRoute({@required this.themeMode});
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  bool _first=true;
  @override
  Widget build(BuildContext context) {
    Color primary = Color.fromARGB(255, 37, 42, 81);
    Color secondary = Color.fromARGB(255, 226, 178, 49);
    Color secondaryDark = Color.fromARGB(255, 223, 156, 40);
    Color primaryDark = Colors.white;
    Color primaryVariant = Color.fromARGB(255, 0, 0, 41);
//    Color primary = Colors.red;
//    Color secondary = Colors.redAccent;
    Color onSurface = Colors.grey[500];
    Color surface = Colors.white;
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child){
          if(_first) {
            appState.updateThemeNoNotify(widget.themeMode);
            _first=false;
          }
          return MaterialApp(
            title: 'Urán',
//          locale: snapshot.data,
            themeMode: appState.themeMode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: primary,
              accentColor: secondaryDark,
              colorScheme: ColorScheme.dark(
                primary: primary,
                secondary: secondaryDark,
                background: Colors.grey[100],
                surface: surface,
                onSurface: onSurface,
                primaryVariant: primaryDark,
//            primaryVariant: primaryVariant
              ),
              textTheme: TextTheme(
                  title: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: primaryDark,
                    letterSpacing: 0,
                  ),
                  subtitle: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0,
                  ),
                  body1: TextStyle(
                    color: onSurface,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.5,
                    fontSize: 16,
                  ),
                  overline: TextStyle(
                      color: onSurface,
                      fontSize: 10,
                      letterSpacing: 1.5
                  ),
//          headline: TextStyle(
//            color: primaryVariant,
//            fontSize: 20,
//            fontWeight: FontWeight.normal,
//            letterSpacing: 0.15
//          ),
                  button: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.25,
                  )
              ),
              cardTheme: CardTheme(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
//          margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                elevation: 5,
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: Theme.of(context).colorScheme.secondary,
              ),
              buttonColor: secondaryDark,
            ),
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: primary,
              accentColor: secondary,
              colorScheme: ColorScheme.light(
                primary: primary,
                secondary: secondary,
                background: Colors.grey[100],
                surface: surface,
                onSurface: onSurface,
                primaryVariant: primary,
//            primaryVariant: primaryVariant
              ),
              textTheme: TextTheme(
                  title: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: primary,
                    letterSpacing: 0,
                  ),
                  subtitle: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0,
                  ),
                  body1: TextStyle(
                    color: onSurface,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.5,
                    fontSize: 16,
                  ),
                  overline: TextStyle(
                      color: onSurface,
                      fontSize: 10,
                      letterSpacing: 1.5
                  ),
//          headline: TextStyle(
//            color: primaryVariant,
//            fontSize: 20,
//            fontWeight: FontWeight.normal,
//            letterSpacing: 0.15
//          ),
                  button: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.25,
                  )
              ),
              cardTheme: CardTheme(
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
//          margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
                elevation: 1,
              ),
              buttonTheme: ButtonThemeData(
                buttonColor: Theme.of(context).colorScheme.secondary,
              ),
              buttonColor: secondary,
            ),
            home: MyHomePage(title: ''),
          );
        }
    );




  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'URÁN',
            style: TextStyle(letterSpacing: 0.25, fontSize: 24),
          ),
        ),
        drawer: Drawer(
          elevation: 16,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              DrawerHeader(
                child: SizedBox(height: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    image: DecorationImage(
                        image: AssetImage('assets/uran_cover.png'))),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(
                  'Felhasználó',
                  style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.print,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(
                  'Nyomtatás',
                  style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Print()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.wifi,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(
                  'Internet',
                  style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Internet()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.build,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                title: Text(
                  'Hibák',
                  style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Faults()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_library,
                  color: Colors.grey[300],
                ),
                title: Text(
                  'Terembeosztás',
                  style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold, color: Colors.grey[300]),
                ),
                onTap: () {},
                enabled: false,
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.bug_report,
                  color: Colors.red,
                ),
                title: Text(
                  'Probléma jelentése',
                  style: Theme.of(context).textTheme.body1.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
                enabled: false,
              )
            ],
          ),
        ),
        body: Center(
            child: ListView(
          padding: EdgeInsets.all(4),
          children: <Widget>[
            InkWell(
              child: PostPreview('Gyertek szinházba!', 'Szinházasdi',
                  DateTime(2020), User('Samu'), Group('EC/KultBiz')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostRoute()));
              },
            ),
            PostPreview.empty(),
            PostPreview.empty(),
            PostPreview.empty(),
            PostPreview.empty(),
            PostPreview.empty(),
            PostPreview.empty(),
          ],
        )));
  }
}
