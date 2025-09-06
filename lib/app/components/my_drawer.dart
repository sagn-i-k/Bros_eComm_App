import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Icon(Icons.message,size: 40,color: Colors.white,),),
              SizedBox(height: 30,),
              Padding(
                  padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home,color: Colors.white,),
                  onTap: (){},
                ),
              ),

              Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.settings,color: Colors.white,),
              onTap: (){},

              )),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 25),
              child: ListTile(
                title: Text("L 0 G O U T"),
                leading: Icon(Icons.logout,color: Colors.white,),
                onTap: (){},

              )),
        ],
      ),
    );
  }
}
