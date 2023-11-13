import 'package:flutter/material.dart';
import 'package:hotelsgotask/controller/cubit/app_cubit.dart';
import 'package:hotelsgotask/model/rooms.dart';

class RoomsWidget extends StatelessWidget {
  int index;
  Rooms rooms;
  RoomsWidget({super.key,required this.index,required this.rooms});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: 20, right: 20),
      child: Container(
        padding:
        const EdgeInsets.all(8),
        decoration:
        const BoxDecoration(
          borderRadius:
          BorderRadius.all(
              Radius.circular(
                  10)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment
              .start,
          children: [
            Text('Room ${index+1}'),
            Row(

              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                const Text('Adults'),
                Row(
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          cubit.decrementAdults(
                              index);
                        },
                        child: Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius
                                .all(Radius
                                .circular(
                                20)),
                            border: Border.all(
                                color: rooms.adults > 1
                                    ? Colors
                                    .blue
                                    : Colors
                                    .grey,
                                width: 1),
                          ),
                          child: Icon(
                            Icons
                                .remove,
                            color: rooms.adults > 1
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      rooms.adults
                          .toString(),
                      style:
                      const TextStyle(
                        color: Colors
                            .black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          cubit.incrementAdults(
                              index);
                        },
                        child: Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius
                                .all(Radius
                                .circular(
                                20)),
                            border: Border.all(
                                color: rooms.adults < 4
                                    ? Colors
                                    .blue
                                    : Colors
                                    .grey,
                                width: 1),
                          ),
                          child: Icon(
                            Icons
                                .add,
                            color: rooms.adults < 4
                                ? Colors
                                .blue
                                : Colors
                                .grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .spaceBetween,
              children: [
                const Text(
                    'Children'),
                Row(
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          cubit.decrementChildren(
                              index);
                        },
                        child: Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius
                                .all(Radius
                                .circular(
                                20)),
                            border: Border.all(
                                color: rooms.children.isNotEmpty
                                    ? Colors
                                    .blue
                                    : Colors
                                    .grey,
                                width: 1),
                          ),
                          child:  Icon(
                            Icons
                                .remove,
                            color: rooms.children.isNotEmpty
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),


                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      rooms.children
                          .length.toString(),
                      style:
                      const TextStyle(
                        color: Colors
                            .black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          cubit.incrementChildren(
                              index);
                        },
                        child: Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius
                                .all(Radius
                                .circular(
                                20)),
                            border: Border.all(
                                color: rooms.children.length < 4
                                    ? Colors
                                    .blue
                                    : Colors
                                    .grey,
                                width: 1),
                          ),
                          child:  Icon(
                            Icons
                                .add,
                            color: rooms.children.length < 4
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            ...List.from(
              rooms
                  .children
                  .map(
                      (e) =>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Age Child ${rooms.children.indexOf(e)+1}'),
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value){
                                      if  (value.isNotEmpty) {
                                        int? age = int.tryParse(value);

                                        if (age != null && age >= 1 && age <= 11) {
                                          // Set the valid age
                                          rooms.children[rooms.children.indexOf(e)].age = age;
                                        } else {
                                          // Set value to null for invalid age
                                          rooms.children[rooms.children.indexOf(e)].age = 0;

                                          // Show a SnackBar for invalid input
                                          final snackBar = SnackBar(content: Text('Age must be between 1 and 11'),        behavior: SnackBarBehavior.floating,
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar,);
                                        }
                                      } else {
                                        // Set value to null for empty input
                                        rooms.children[rooms.children.indexOf(e)].age = 0;
                                        final snackBar = SnackBar(content: Text('Age must be between 1 and 11'),        behavior: SnackBarBehavior.floating,
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Age',

                                    ),
                                  ),
                                ),
                                Text('Years',style: TextStyle(color: Colors.grey,fontSize: 14),)
                              ],
                            ),
                          )
                        ],
                      )),
            ),


          ],
        ),
      ),
    );
  }
}
