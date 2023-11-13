import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgotask/controller/cubit/app_cubit.dart';
import 'package:hotelsgotask/view/widgets/PetFriendlyWidget.dart';
import 'package:hotelsgotask/view/widgets/roomsWidget.dart';

import '../../controller/modalSheet.dart';

class RoomsAndGuestWidget extends StatelessWidget {
  const RoomsAndGuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showModalSheet(context, cubit);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 15,

            // height: MediaQuery.of(context).size.height / 15,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cubit.rooms} Rooms, ${cubit.adults} Adults, ${cubit.children} Children',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
