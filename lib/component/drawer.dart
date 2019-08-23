import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 64,
                  height: 64,
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://picsum.photos/72"))),
                ),
                Text(
                  "Sandra Wilson",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  "sandrawilson@mail.com",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black38),
                )
              ]),
        ),
        ListTile(
          title: Row(children: <Widget>[
            Text('Cashier')
          ]),
          onTap: () {
            Navigator.of(context).pushNamed('Cashier');
          },
        ),
        ListTile(
          title: Text('Printer'),
          onTap: () {
            Navigator.of(context).pushNamed('Printer');
          },
        )
      ],
    ));
  }
}
