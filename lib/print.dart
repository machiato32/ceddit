import 'package:flutter/material.dart';

class Print extends StatefulWidget {
  @override
  _PrintState createState() => _PrintState();
}

class _PrintState extends State<Print> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nyomtatás'),),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: EdgeInsets.all(4),
          children: <Widget>[
            PrintDocument(),
            PrintHistory(),
          ],
        ),
      ),
    );
  }
}

class PrintHistory extends StatefulWidget {
  @override
  _PrintHistoryState createState() => _PrintHistoryState();
}

class _PrintHistoryState extends State<PrintHistory> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nyomtatási előzmények', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Létrehozva', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                  DataColumn(label: Text('Dokumentum', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                  DataColumn(label: Text('Költség', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),)),
                  DataColumn(label: Text('Állapot', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),))
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('2020.01.12. 19:00', style: Theme.of(context).textTheme.body1)),
                      DataCell(Text('sajt.pdf', style: Theme.of(context).textTheme.body1)),
                      DataCell(Text('200 HUF', style: Theme.of(context).textTheme.body1)),
                      DataCell(Text('Elfogadva', style: Theme.of(context).textTheme.body1)),
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



class PrintDocument extends StatefulWidget {
  @override
  _PrintDocumentState createState() => _PrintDocumentState();

}

class _PrintDocumentState extends State<PrintDocument> {
  bool _twoSided=true;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Dokumentum nyomtatása', style: Theme.of(context).textTheme.title,),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Rendelkezésre álló összeg: 0 HUF', style: Theme.of(context).textTheme.body1,),
                  Text('Ezen felül ingyenesen nyomtatható 0 oldal', style: Theme.of(context).textTheme.body1,)
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Csak .pdf fájl nyomtatható.', style: Theme.of(context).textTheme.body1,),
                  FlatButton(
                    child: Text('DOKUMENTUM NYOMTATÁSA', style: Theme.of(context).textTheme.button,),
                    color: Theme.of(context).buttonColor,
                    onPressed: (){},
                  ),
                  SizedBox(height: 5,),
                  Text('Példányszám', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2),),
                  TextField(
                    style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 5,),
                  SwitchListTile(
                    value: _twoSided,
                    title: Text('Kétoldalas nyomtatás', style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2)),
                    activeColor: Theme.of(context).colorScheme.secondary,
                    onChanged: (bool newValue){
                      setState(() {
                        _twoSided=newValue;
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('NYOMTATÁS', style: Theme.of(context).textTheme.button,),
                    color: Theme.of(context).buttonColor,
                    onPressed: (){},
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

