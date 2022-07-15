import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/core/util/Bloc/cubit.dart';
import 'package:flutter_project_algoriza/core/util/style/colors.dart';
import 'package:flutter_project_algoriza/features/User/presention/widgets/user_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
        title: Text('Users',),
        actions: [
          IconButton(
            color: defultColor,
              onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Delete All Items',style: TextStyle(color: Colors.white, fontSize: 18)),
                  content: const Text('Do You sure ?',  style: TextStyle(color: Colors.white, fontSize: 18)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel',  style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    TextButton(
                      onPressed: () {
                        AppBloc.get(context).deleteAll(db:AppBloc.get(context).database);
                       Navigator.pop(context);
                      },
                      child: const Text('OK',  style: TextStyle(color:Colors.white, fontSize: 18)),
                    ),
                  ],
                  elevation: 24,
                  backgroundColor: defultColor,
                  // shape: CircleBorder(),
                ),
              );

        }, icon: Icon(Icons.delete))],

      ),
      body: UserWidget(),
    );
  }
}
