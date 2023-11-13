import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgotask/controller/cubit/app_cubit.dart';

class PetFriendlyWidget extends StatelessWidget {
  const PetFriendlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height /
                    12,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    const Column(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pet Friendly',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Only show stays that allow pets',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CupertinoSwitch(
                      value: cubit.isPetSwitched,
                      onChanged: (value) {
                        cubit.changePetSwitch(
                            value);
                        // setState(() {
                        //   isSwitched = value;
                        // });
                      },
                    ),
                  ],
                )
            ),
          ),
        );
      },
    );
  }
}
