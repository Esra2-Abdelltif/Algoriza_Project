import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_algoriza/core/util/Bloc/cubit.dart';
import 'package:flutter_project_algoriza/core/util/Bloc/states.dart';
import 'package:flutter_project_algoriza/core/util/style/colors.dart';
import 'package:flutter_project_algoriza/core/util/widgets/custromTextForm.dart';
import 'package:flutter_project_algoriza/core/util/widgets/myDivider.dart';
import 'package:flutter_project_algoriza/features/login_screen/presentation/widget/myTextFormField.dart';
import 'package:flutter_project_algoriza/features/login_screen/presentation/widget/userItem.dart';

class UserWidget extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  TextEditingController UserController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Column(
            children: [
              MyTextField(
                controller: AppBloc.get(context).UserNameController,
                hintText: "UserName",
                textInputType: TextInputType.text,
                isPass: true,
                suffixIcon: TextButton(
                    onPressed: () {
                      AppBloc.get(context).InsertUserDate();
                    },
                    child: Text(AppBloc.get(context).SelectedUser.isEmpty
                        ? 'Save'
                        : 'Update')),
              ),
              AppBloc.get(context).UsersList.isEmpty
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Image(
                            image: AssetImage('assets/images/no-data.png'),
                          ),



                        ],
                      ),
                    )
                  : Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          AppBloc.get(context).GetUserDate();
                        },
                        child: ListView.builder(
                            itemBuilder: (context, index) => UserItem(
                                item: AppBloc.get(context).UsersList[index]),
                            itemCount: AppBloc.get(context).UsersList.length),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
