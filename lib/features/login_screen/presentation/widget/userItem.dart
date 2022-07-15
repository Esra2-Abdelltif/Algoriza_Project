import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_algoriza/core/util/Bloc/cubit.dart';

class UserItem extends StatelessWidget {
  final Map item;

  const UserItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBloc.get(context).SelecteduserToUpdate(User: item);
      },
      child: Dismissible(
        key: Key(item['id'].toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          color: Colors.red[500],
          child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Delete item',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.delete, color: Colors.white, size: 28),
                ],
              )),
        ),
        onDismissed: (direction) {
          AppBloc.get(context).DeleteItem(id: item['id']);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  child: Text('${item['id']}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  radius: 35,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Text('${item['name']}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
