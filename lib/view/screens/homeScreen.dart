import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgotask/view/widgets/NationaltyWidget.dart';
import '../../controller/cubit/app_cubit.dart';
import '../widgets/DatePickerWidget.dart';
import '../widgets/roomsAndGuestWidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? value;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Search For A Hotel'),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.25,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/imgs/background.webp',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 3.6,
                            left: MediaQuery.of(context).size.width / 30,
                            // right: MediaQuery.of(context).size.width/30,
                            child: Container(
                              height: 40.0,
                              width: 200,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: ClipPath(
                                clipper: DiagonalClipper(),
                                child: Container(
                                  color: Colors.blue,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        textAlign: TextAlign.left,
                                        'Hotel Search',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2.6,
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.orange,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Find hotels ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: MediaQuery.of(context).size.height / 3,
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.blue,
                                    Color(0xff1476bd),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height / 15,
                                      decoration: const BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              borderSide: BorderSide(color: Colors.blue,width: 1),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              borderSide: BorderSide(color: Colors.blue,width: 1),
                                            ),
                                            hintText: 'Select City',

                                          ),

                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const DatePickerWidget(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const NationaltyWidget(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const RoomsAndGuestWidget(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ));
      },
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height + 100);
    path.lineTo(size.width - 100, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
