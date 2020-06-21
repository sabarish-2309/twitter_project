import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_api/twitter_api.dart';

class TweetsPage extends StatefulWidget {
  @override
  _TweetsPageState createState() => _TweetsPageState();
}

class _TweetsPageState extends State<TweetsPage> {
  double latitude;
  double longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('feeds'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              getData();
            },
          ),
          Container(
            child: Text(''),
          )
        ],
      ),
    );
  }

  Future<void> getData() async {
    String consumerApiKey = "Sg2ugYXaLB0nAGCFsDecsJ6Dj";
    String consumerApiSecret =
        "yQ6rw4cTw1nme1dP2VfZMGyxb1VPzJe01lItQJQ0SQDD7fgvAI";
    String accessToken = "1274571596636647426-96IyH61deIZHeZdlIAnbx1ia74i0bB";
    String accessTokenSecret = "W1VwJZmf9eRgjyncayY9AK07pNQvMpeT5Bq3AoM26Co6O";

    // Creating the twitterApi Object with the secret and public keys
    // These keys are generated from the twitter developer page
    // Dont share the keys with anyone
    final _twitterOauth = new twitterApi(
        consumerKey: consumerApiKey,
        consumerSecret: consumerApiSecret,
        token: accessToken,
        tokenSecret: accessTokenSecret);
    Future twitterRequest = _twitterOauth.getTwitterRequest(
      "GET",
      "statuses/user_timeline.json",
      options: {
        "user_id": "19025957",
        "screen_name": "TTCnotices",
        "count": "20",
        "trim_user": "true",
        "tweet_mode": "extended", // Used to prevent truncating tweets
      },
    );

    // Wait for the future to finish
    var res = await twitterRequest;

    //print(res.body);

    // Convert the string response into something more useable
    var tweets = json.decode(res.body);
    print(tweets);
  }
}
