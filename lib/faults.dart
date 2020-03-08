import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Faults extends StatefulWidget {
  @override
  _FaultsState createState() => _FaultsState();
}

class _FaultsState extends State<Faults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hibák'),),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: EdgeInsets.all(4),
          children: <Widget>[
            ReportFault(),
            FaultHistory(),
          ],
        ),
      ),
    );
  }
}

class ReportFault extends StatefulWidget {
  @override
  _ReportFaultState createState() => _ReportFaultState();
}

class _ReportFaultState extends State<ReportFault> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hiba bejelentése', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Amennyiben valamilyen hibát találsz a Collegium épületében (pl. hiányzó villanykörte), itt be tudod jelenteni, hogy a karbantartó mihamarabb megjavítsa.'),
                  Divider(),
                  Text('Helyszín', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),),
                  TextField(
                    style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),

                  ),
                  SizedBox(height: 10,),
                  Text('Leírás', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary, fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),),
                  TextField(
                    style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),

                  ),
                  SizedBox(height: 10,),
                  FlatButton(
                    child: Text('KÜLDÉS', style: Theme.of(context).textTheme.button,),
                    color: Theme.of(context).buttonColor,
                    onPressed: (){},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FaultHistory extends StatefulWidget {
  @override
  _FaultHistoryState createState() => _FaultHistoryState();
}

class _FaultHistoryState extends State<FaultHistory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Bejelentett hibák', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(

                columns: [
                  DataColumn(label: Text('Létrehozva', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                  DataColumn(label: Text('Helyszín', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                  DataColumn(label: Text('Leírás', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                  DataColumn(label: Text('Állapot', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),))
                ],
                rows: [
                  DataRow(
                      cells: [
                        DataCell(Text('2020.01.12. 19:00', style: Theme.of(context).textTheme.body1)),
                        DataCell(Text('Tornaterem', style: Theme.of(context).textTheme.body1)),

                        DataCell(
                          Container(
                            constraints: BoxConstraints(maxWidth: 400),
                            child: Text('Hosszú Kristóf ágya felett (ablak mellett, jobb oldal) veszélyesen kilóg a falból a konnektor, több centiméterre', style: Theme.of(context).textTheme.body1)
                          ),
                        ),
                        DataCell(Text('Nem látta', style: Theme.of(context).textTheme.body1)),
                      ]
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


