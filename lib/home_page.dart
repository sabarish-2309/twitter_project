import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tweets_page.dart';
import 'location.dart';

import 'package:twittertweets/tweets_page.dart';

class MyHomePage extends StatelessWidget {
  String user;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.account_circle,
          size: 35.0,
          color: Colors.grey,
        ),
        title: Text('tweets'),
        actions: <Widget>[],
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'user_id',
            ),
            onSaved: (String value) {
              user = value;
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'password',
            ),
            onSaved: (String value) {
              password = value;
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
          ),
          RaisedButton(
            child: Text('get feeds'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TweetsPage()),
              );
            },
          ),
          SizedBox(
            width: 20.0,
          ),
          RaisedButton(
              child: Text('get location'),
              onPressed: () {
                getLocation();
              })
        ],
      ),
    );
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }
}
