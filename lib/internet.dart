import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Internet extends StatefulWidget {

  @override
  _InternetState createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Internet'),),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: EdgeInsets.all(4),
          children: <Widget>[
            InternetAccess(),
            WifiPass(),
            RegisteredDevices(),
          ],
        ),
      ),
    );
  }
}

class RegisteredDevices extends StatefulWidget {
  @override
  _RegisteredDevicesState createState() => _RegisteredDevicesState();
}

class _RegisteredDevicesState extends State<RegisteredDevices> {
  @override
  Widget build(BuildContext context) {
    return Card(
//      color: Theme.of(context).colorScheme.surface,
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Theme.of(context).colorScheme.secondary)),
//      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Regisztrált eszközeid', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text('A vezetékes internet használatához előbb regisztrálnod kell az eszközödet. Egy bizonyos számú eszközt automatikusan tudsz engedélyezni. Ha ennél többre lenne szükséged, akkor a regisztrálás után az adminisztrátoroknak el kell fogadniuk azt, ehhez a megjegyzés mezőbe tudsz indoklást írni.\n\nAutomatikusan engedélyezett eszközök: 3 db', style: Theme.of(context).textTheme.body1,),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('MAC-cím', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),),
                  TextField(
                    style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 0.2),
                    decoration: InputDecoration(
                      hintText: '00:00:00:00:00:00'
                    ),
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp('[a-zA-Z0-9:]'))
                    ]
                  ),
                  SizedBox(height: 10,),
                  Text('Megjegyzés', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),),
                  TextField(
                      style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 0.2),
                  ),
                  SizedBox(height: 10,),
                  FlatButton(
                    child: Text('ESZKÖZ HOZZÁADÁSA', style: Theme.of(context).textTheme.button,),
                    color: Theme.of(context).buttonColor,
                    onPressed: (){},
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Eddig regisztrált eszközök', style: Theme.of(context).textTheme.title.copyWith(fontSize: 21),),
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('MAC-cím', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                              DataColumn(label: Text('Megjegyzés', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                              DataColumn(label: Text('Állapot', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),))
                            ],
                            rows: [
                              DataRow(

                                cells: [
                                  DataCell(Text('3C:18:A0:99:EC:86', style: Theme.of(context).textTheme.body1)),
                                  DataCell(Text('Migrated from Uran 1.1', style: Theme.of(context).textTheme.body1)),
                                  DataCell(Text('Elfogadott', style: Theme.of(context).textTheme.body1))
                                ],
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 10,),
                        FlatButton(
                          child: Text('KIJELÖLT SOROK TÖRLÉSE', style: Theme.of(context).textTheme.button,),
                          color: Theme.of(context).buttonColor,
                          onPressed: (){},
                        )
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ],

        ),
      ),

    );
  }
}


class WifiPass extends StatefulWidget {
  @override
  _WifiPassState createState() => _WifiPassState();
}

class _WifiPassState extends State<WifiPass> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('WiFi jelszó', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text('Az ejc_wifi hálózatra a lenti adatokkal jelentkezhetsz be. Lehetőséged van a jelszavadat egy másik véletlenszerű jelszóra megváltoztatni, ezt a rendszergazdák bizonyos időnként meg is fogják tenni, amiről előre értesítenek.', style: Theme.of(context).textTheme.body1,),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Felhasználónév: xyz', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children:<Widget>[
                      Text('Jelszó: ', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2)),
                      SizedBox(width: 10,),
                      FlatButton(
                        child: Text('MUTASD', style: Theme.of(context).textTheme.button,),
                        color: Theme.of(context).buttonColor,
                        onPressed: (){},
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Új jelszó', style: Theme.of(context).textTheme.title.copyWith(fontSize: 21),),
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Text('Ha új jelszót igényelsz, mindenhol újra be kell jelentkezned!', style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold ,color: Colors.red)),
                        SizedBox(height: 8),
                        FlatButton(
                          child: Text('ÚJ JELSZÓ GENERÁLÁSA', style: Theme.of(context).textTheme.button,),
                          color: Theme.of(context).buttonColor,
                          onPressed: (){},
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class InternetAccess extends StatefulWidget {
  @override
  _InternetAccessState createState() => _InternetAccessState();
}

class _InternetAccessState extends State<InternetAccess> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Internetelérés', style: Theme.of(context).textTheme.title, ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Az internetelérésed ', style: Theme.of(context).textTheme.body1,),
                  Text('aktív', style: Theme.of(context).textTheme.body1.merge(TextStyle(color: Colors.green))),
                  Text(' 2020-03-30 05:00:00-ig', style: Theme.of(context).textTheme.body1)

                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

