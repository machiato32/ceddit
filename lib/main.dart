import 'package:flutter/material.dart';
import 'post_preview.dart';
import 'user.dart';
import 'group.dart';
import 'post.dart';
import 'internet.dart';
import 'print.dart';

void main() => runApp(MainRoute());

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primary = Color.fromARGB(255, 37, 42, 81);
    Color secondary = Color.fromARGB(255, 226, 178, 49);
    Color primaryVariant = Color.fromARGB(255, 80, 82, 126);
    Color onSurface = Colors.grey[600];
    Color surface = Colors.grey[50];
    return MaterialApp(
      title: 'Urán',
      theme: ThemeData(
        primaryColor: primary,
        accentColor: secondary,
        colorScheme: ColorScheme.light(
            primary: primary,
            secondary: secondary,
            background: Colors.white,
            surface: surface,
            onSurface: onSurface,
            primaryVariant: primaryVariant),
        textTheme: TextTheme(
          title: TextStyle(
              color: primaryVariant, fontSize: 25, fontWeight: FontWeight.bold),
          subtitle: TextStyle(
            color: onSurface,
            fontSize: 16,
          ),
          body2: TextStyle(
            color: onSurface,
            fontSize: 20,
          ),
          caption: TextStyle(
            color: onSurface,
            fontSize: 13,
          ),
          headline: TextStyle(
              color: primary, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        cardTheme: CardTheme(
          color: surface,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: secondary)),
          elevation: 1,
        ),
      ),
      home: MyHomePage(title: ''),
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
            style: TextStyle(letterSpacing: 3, fontSize: 25),
          ),
        ),
        drawer: Drawer(
          elevation: 16,
          child: ListView(
            padding: const EdgeInsets.all(0.0),
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Felhasználó',
                  style: Theme.of(context).textTheme.headline,
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.print,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Nyomtatás',
                  style: Theme.of(context).textTheme.headline,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Print()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.wifi,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Internet',
                  style: Theme.of(context).textTheme.headline,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Internet()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_library,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Terembeosztás',
                  style: Theme.of(context).textTheme.headline,
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
                  style: Theme.of(context).textTheme.headline,
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
              child: PostPreview('Gyertek szinhazba!', 'Szinhazasdi',
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
