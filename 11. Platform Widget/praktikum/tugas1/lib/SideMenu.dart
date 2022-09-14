import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 0),
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/picture.jpg'),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Doe John",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                        ),  
                      ),
                      Text(
                        "+62 883 9933 3343",
                        style: TextStyle(
                          color: Colors.white,
                        ),  
                      )
                    ],
                  ),
                ),
                
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/cover.png'))),
          
          ),
          ListTile(
            leading: Icon(Icons.supervisor_account,color: Colors.grey,),
            title: Text("New Group"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.lock,color: Colors.grey,),
            title: Text("New Secret Chat"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.campaign,color: Colors.grey,),
            title: Text("New Channel"),
            onTap: (){},
          ),
          Divider(
            color: Colors.grey,
            height: 2,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.account_box,color: Colors.grey,),
            title: Text("Contacts"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.person_add,color: Colors.grey,),
            title: Text("Invite Friends"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.grey,),
            title: Text("Settings"),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.question_mark,color: Colors.grey,),
            title: Text("Telegram FAQ"),
            onTap: (){},
          )
        ],
      ),
    );
  }
}