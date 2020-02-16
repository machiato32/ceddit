import 'package:flutter/material.dart';
import 'main.dart';
import 'user.dart';
import 'group.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class PostPreview extends StatelessWidget {

  String post, title;
  DateTime timeOfPost;
  User user;
  Group group;


  PostPreview(this.post, this.title, this.timeOfPost, this.user,  this.group);
  PostPreview.empty(){
    this.post='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet arcu sed dolor luctus efficitur. Donec id elementum turpis. Fusce dignissim tellus eget neque efficitur, in blandit arcu ultrices. Curabitur lectus metus, tristique sit amet sapien vitae, accumsan porttitor tellus.';
    this.title='Lorem ipsum';
    this.timeOfPost=DateTime.now();
    this.user= User('Saci');
    this.group= Group('EC/KommBiz');
  }



  @override
  Widget build(BuildContext context) {
    String timeFromNow='';
    if(DateTime.now().difference(timeOfPost).inMinutes<1){
      timeFromNow='Éppen most';
    }else if(DateTime.now().difference(timeOfPost).inHours<1){
      timeFromNow=DateTime.now().difference(timeOfPost).inMinutes.toString()+' perce';
    }else if(DateTime.now().difference(timeOfPost).inHours<24){
      timeFromNow=DateTime.now().difference(timeOfPost).inHours.toString()+' órája';
    }else if(DateTime.now().difference(timeOfPost).inDays<7){
      timeFromNow=DateTime.now().difference(timeOfPost).inDays.toString()+' napja';
    }else{
      timeFromNow=(DateTime.now().difference(timeOfPost).inDays/7).floor().toString()+' hete';
    }

    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2), side: BorderSide(color: Theme.of(context).colorScheme.secondary)),

      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.image, size: 25, color: Colors.amber[600],),
                SizedBox(width: 5,),
                Text(group.name+' - '+timeFromNow, style: Theme.of(context).textTheme.caption,)
              ],
            ),
            Divider(color: Colors.grey,),
            Text(title, style: Theme.of(context).textTheme.title, ),
            SizedBox(height:  8),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Text(post, style: Theme.of(context).textTheme.subtitle,),
            ),
          ],
        ),
      ),
    );
  }



  void buttonPressed(int id) {
    fetchPost(id).then((val) {
      Fluttertoast.showToast(msg: val.body);
    });
  }

  Future<http.Response> fetchPost(int id) {
    return http.get('http://192.168.1.73:50728/user/$id');
  }


}

