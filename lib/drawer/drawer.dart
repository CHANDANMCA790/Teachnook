import 'package:flutter/material.dart';

Widget appDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      children: [
        // DrawerHeader(
        //   child: Image.asset('assets/images/logo.png'),
        //   decoration: BoxDecoration(
        //       color: Colors.lightBlue
        //   ),
        // ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile()));
          },
          title: Text('Profile'),
          leading: Icon(
            Icons.account_circle_outlined,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Rate this app'),
          leading: Icon(
            Icons.star,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Share this app'),
          leading: Icon(
            Icons.share,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Fruits list'),
          leading: Icon(
            Icons.list_alt_outlined,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Carts'),
          leading: Icon(
            Icons.shopping_cart,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Purchase'),
          leading: Icon(
            Icons.credit_card_outlined,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Setting'),
          leading: Icon(
            Icons.settings,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) => MyAbout()));
          },
          title: Text('About'),
          leading: Icon(
            Icons.info_outline,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Spacer(),
        ListTile(
          trailing: Icon(
              Icons.arrow_circle_right_outlined
          ),
          title: Text('Logout'),
          leading: Icon(
            Icons.logout,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}