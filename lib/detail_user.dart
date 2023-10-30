import 'package:flutter/material.dart';
import 'package:praktikum5/users_model.dart';

class DetailUser extends StatelessWidget {
  final Data user;

  DetailUser(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "User Detail",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 50, right: 50),
          child: Card(
            child: SizedBox(
              height: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(height: 30,),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(user.avatar ?? ""),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${user.firstName ?? ""} ${user.lastName ?? ""}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Email: ${user.email ?? ""}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}