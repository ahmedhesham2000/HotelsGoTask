import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgotask/controller/cubit/app_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDialog(
              barrierDismissible: true,
              context: context,

              builder: (BuildContext context) => AlertDialog(
                // shadowColor: Colors.blue,
                backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
                title: const Text('Select Date'),
                content: SizedBox(
                  width: 400,
                  height: 400,
                  child: SfDateRangePicker(
                    view: DateRangePickerView.month,
                    selectionColor: Colors.blue,
                    todayHighlightColor: Colors.blue,
                    endRangeSelectionColor: Colors.blue,
                    startRangeSelectionColor: Colors.blue,
                    rangeSelectionColor: Colors.blue[50],
                    selectionMode: DateRangePickerSelectionMode.range,
                    extendableRangeSelectionDirection:
                        ExtendableRangeSelectionDirection.forward,
                    minDate: DateTime.now(),
                    onSubmit: (value) {
                      value;
                      if(value ==null){
                        const snackBar = SnackBar(
                          content: Text('Please Select Date'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }else{
                        cubit.dateRange = value as PickerDateRange;
                        cubit.emit(ChangeDateRange());
                        Navigator.pop(context);
                      }

                    },
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    showActionButtons: true,
                  ),
                ),
              ),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 15,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:  BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                 ),
                 borderRadius: const BorderRadius.all(Radius.circular(10))
                ),
                child: Center(
                  child: cubit.dateRange == null
                      ? const Text(
                          'Select Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${cubit.dateRange!.startDate.toString().substring(0, 10)} ==> ${cubit.dateRange!.endDate.toString().substring(0, 10)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.dateRange = null;
                                cubit.emit(ChangeDateRange());
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
