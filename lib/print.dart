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
                  DataColumn(label: Text('Létrehozva', style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold,),)),
                  DataColumn(label: Text('Dokumentum', style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold,),)),
                  DataColumn(label: Text('Költség', style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold,),)),
                  DataColumn(label: Text('Állapot', style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold,),))
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('2020.01.12. 19:00', style: Theme.of(context).textTheme.subtitle)),
                      DataCell(Text('sajt.pdf', style: Theme.of(context).textTheme.subtitle)),
                      DataCell(Text('200 HUF', style: Theme.of(context).textTheme.subtitle)),
                      DataCell(Text('Elfogadva', style: Theme.of(context).textTheme.subtitle)),
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
                  Text('Rendelkezésre álló összeg: 0 HUF', style: Theme.of(context).textTheme.subtitle,),
                  Text('Ezen felül ingyenesen nyomtatható 0 oldal', style: Theme.of(context).textTheme.subtitle,)
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Csak .pdf fájl nyomtatható.', style: Theme.of(context).textTheme.subtitle,),
                  FlatButton(
                    child: Text('Dokumentum választása', style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),),
                    color: Theme.of(context).colorScheme.primaryVariant,
                    onPressed: (){},
                  ),
                  SizedBox(height: 5,),
                  Text('Példányszám', style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),),
                  TextField(
                    style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 5,),
                  SwitchListTile(
                    value: _twoSided,
                    title: Text('Kétoldalas nyomtatás', style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 18, fontWeight: FontWeight.bold,)),
                    activeColor: Theme.of(context).colorScheme.primaryVariant,
                    onChanged: (bool newValue){
                      setState(() {
                        _twoSided=newValue;
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('Nyomtatás', style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.white),),
                    color: Theme.of(context).colorScheme.primaryVariant,
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

