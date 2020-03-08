import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state_notifier.dart';


class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beállítások'),),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          padding: EdgeInsets.all(4),
          children: <Widget>[
            ThemePicker(),
          ],
        ),
      ),
    );
  }
}

class ThemePicker extends StatefulWidget {
  @override
  _ThemePickerState createState() => _ThemePickerState();
}

class _ThemePickerState extends State<ThemePicker> {
  bool _lightDarkSwitch = true;
  String _lightDarkSwitchTitle = 'Világos';
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
      _lightDarkSwitch=Provider.of<AppStateNotifier>(context, listen: false).isLight;
      _lightDarkSwitchTitle=(_lightDarkSwitch)?'Világos':'Sötét';
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Téma választása', style: Theme.of(context).textTheme.title,),
            SwitchListTile(
              title: Text(_lightDarkSwitchTitle, style: Theme.of(context).textTheme.body1.copyWith(color: Theme.of(context).colorScheme.primaryVariant,fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.2)),
              value: _lightDarkSwitch,
              activeColor: Theme.of(context).colorScheme.secondary,
              onChanged: (_value){
                setState(() {
                  _lightDarkSwitch=_value;
                  _lightDarkSwitchTitle=(_lightDarkSwitch)?'Világos':'Sötét';
                  Provider.of<AppStateNotifier>(context, listen: false).updateTheme(_lightDarkSwitch);
                  _getPrefs().then((_prefs){
                    _prefs.setBool('themeMode', _lightDarkSwitch);
                  });
                });
              },

            )
          ],
        ),
      ),
    );
  }
}

