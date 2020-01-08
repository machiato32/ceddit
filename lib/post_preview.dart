import 'package:flutter/material.dart';
import 'main.dart';

class PostPreview extends StatelessWidget {

  String post, title;
  DateTime timeOfPost;
  User 

  PostPreview()

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0.1*SizeConfig.blockSizeHorizontal, color: Colors.grey)
    );
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 2*SizeConfig.blockSizeHorizontal, right: 2*SizeConfig.blockSizeHorizontal, top: 0.8*SizeConfig.blockSizeVertical, bottom: 1*SizeConfig.blockSizeVertical),
          decoration: boxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.image, size: 3.5*SizeConfig.blockSizeVertical, color: Colors.amber[600],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 0.2*SizeConfig.blockSizeVertical,),
                      Text('EC/Csoport123'),
                      Text('Saci posztolt x órája')
                    ],
                  )
                ],
              ),
              Divider(color: Colors.grey,),
              Text('Lorem ipsum', style: TextStyle(color: Colors.black, fontSize: 6*SizeConfig.blockSizeHorizontal, fontWeight: FontWeight.bold), ),
              SizedBox(height: 1.2*SizeConfig.blockSizeVertical,),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet arcu sed dolor luctus efficitur. Donec id elementum turpis. Fusce dignissim tellus eget neque efficitur, in blandit arcu ultrices. Curabitur lectus metus, tristique sit amet sapien vitae, accumsan porttitor tellus.',
                style: TextStyle(color: Colors.grey[700], fontSize: 4*SizeConfig.blockSizeHorizontal),),

            ],
          ),
        ),
        Container(
          decoration: boxDecoration,
          padding: EdgeInsets.only(top: 0.8 *SizeConfig.blockSizeVertical, bottom: 0.8*SizeConfig.blockSizeVertical, left: 0.5*SizeConfig.blockSizeHorizontal, right: 0.5*SizeConfig.blockSizeHorizontal),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => {},
                child: Icon(Icons.favorite, color: Colors.redAccent,),
              )
            ],
          ),
        ),
        SizedBox(height: SizeConfig.blockSizeVertical,)
      ],
    );
  }
}

