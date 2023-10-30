import 'package:flutter/material.dart';
import 'package:praktikum5/api_data_source.dart';
import 'package:praktikum5/users_model.dart';
import 'package:praktikum5/detail_user.dart';

class HalamanUsers extends StatelessWidget {
  const HalamanUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('ADA ERROR');
          }
          if (snapshot.hasData) {
            UsersModel users = UsersModel.fromJson(snapshot.data!);
            return ListView.builder(
              itemCount: users.data!.length,
              itemBuilder: (context, index) {
                var user = users.data![index];

                return ListTile(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailUser(user), // Mengganti dengan DetailUser(user)
                      ),
                    );
                  },

                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(user.avatar!),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text('${user.email}'),
                );
                // bisa pakai !, tanda ? berfungsi untuk jaga2 kalau datanya nul maka akan diganti nama

              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}