import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgotask/view/widgets/PetFriendlyWidget.dart';
import 'package:hotelsgotask/view/widgets/applyButton.dart';
import 'package:hotelsgotask/view/widgets/roomsWidget.dart';

import 'cubit/app_cubit.dart';

void showModalSheet(context, AppCubit cubit) {
  showModalBottomSheet(
    useSafeArea: true,
    backgroundColor: Colors.grey[200],
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 500),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) => BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Center(
                      child: Text(
                        'Rooms And Guests',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),


                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Rooms'),
                      Row(
                        children: [
                          Center(
                            child: InkWell(
                              onTap: () {
                                cubit.decrementRooms();
                              },
                              child: Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  border:
                                      Border.all(color: Colors.blue, width: 1),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            cubit.rooms.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                cubit.incrementRooms();
                              },
                              child: Container(
                                width: 50.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  border:
                                      Border.all(color: Colors.blue, width: 1),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: cubit.roomsList.length,
                  itemBuilder: (context, index) => RoomsWidget(
                    index: index,
                    rooms: cubit.roomsList[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PetFriendlyWidget(),
              const ApplyButton(),
            ],
          ),
        );
      },
    ),

  );
}
