import 'package:flutter/material.dart';
import 'post_preview.dart';
import 'user.dart';
import 'group.dart';
import 'post.dart';

void main() => runApp(MainRoute());

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primary = Color.fromARGB(255, 37, 42, 81);
    Color secondary = Color.fromARGB(255, 226, 178, 49);
    Color primaryVariant = Color.fromARGB(255, 80, 82, 126);
    Color onSurface = Colors.grey[600];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
        accentColor: secondary,
        colorScheme: ColorScheme.light(
          primary: primary,
          secondary: secondary,
          background: Colors.white,
          surface: Colors.grey[100],
          onSurface: onSurface,
          primaryVariant: primaryVariant
        ),
        textTheme: TextTheme(
          title: TextStyle(color: primaryVariant, fontSize: 25, ),
          subtitle: TextStyle(color: onSurface, fontSize: 15,),
          body2: TextStyle(color: onSurface, fontSize: 20, ),
          caption: TextStyle(color: onSurface, fontSize: 13,),
          headline: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Row(
          children: <Widget>[

            Container(
              width: 50,
              child: Image.asset('assets/EClogo.png')),
            SizedBox(width: 10,),
            Text('Eötvös Collegium')
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 16,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/ec_test.jpg'), fit: BoxFit.fill)
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Felhasználó', style: Theme.of(context).textTheme.headline,),
              onTap: (){},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.print, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Nyomtatás', style: Theme.of(context).textTheme.headline,),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.wifi, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Internet', style: Theme.of(context).textTheme.headline,),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.local_library, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Terembeosztás', style: Theme.of(context).textTheme.headline,),
              onTap: (){},
              enabled: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.bug_report, color: Colors.red,),
              title: Text('Probléma jelentése', style: Theme.of(context).textTheme.headline,),
              onTap: (){},
              enabled: false,
            )
          ],
        ),
      ),
      body: Center(

          child: ListView( 
            padding: EdgeInsets.all(4),
            children:
            <Widget>[
              InkWell(
                child: PostPreview('Gyertek szinhazba!',
                      'Szinhazasdi',
                      DateTime(2020),
                      User('Samu'),
                      Group('EC/KultBiz')),
                onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PostRoute()));},
              ),
              PostPreview.empty(),
              PostPreview.empty(),
              PostPreview.empty(),
              PostPreview.empty(),
              PostPreview.empty(),
              PostPreview.empty(),

            ],
          )
      )
    );
  }
}
