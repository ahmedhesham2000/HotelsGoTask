import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelsgotask/model/child.dart';
import 'package:hotelsgotask/model/rooms.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()) {
    roomsList.add(Rooms(count: rooms, adults: adults, children: []));
  }
  static AppCubit get(context) => BlocProvider.of(context);

  List<Rooms> roomsList = [];
  int rooms = 1;
  int adults = 1;
  int children = 0;
  bool isPetSwitched = false;
  PickerDateRange? dateRange ;
  void incrementRooms() {
    roomsList.add(Rooms(count: rooms++, adults: 1, children: []));
    adults++;
    emit(IncrementRooms());
  }
  void decrementRooms() {
    if (rooms > 1) {
      adults=adults-roomsList.last.adults;
      children=children-roomsList.last.children.length;
      roomsList.removeLast();
      rooms--;
      emit(DecrementRooms());
    }
  }
  void incrementAdults(int index) {
if(roomsList[index].adults < 4){
      roomsList[index].adults++;
      adults++;
      emit(IncrementAdults());
}
  }
  void decrementAdults(int index) {
    if (roomsList[index].adults > 1) {
      roomsList[index].adults--;
      adults--;
      emit(DecrementAdults());
    }
  }
  void incrementChildren(int index) {
    if(roomsList[index].children.length < 4){
      children++;
      roomsList[index].children.add(Child(age: 1));

      emit(IncrementChildren());
    }
  }
  void decrementChildren(int index) {
     if (roomsList[index].children.isNotEmpty) {
        children--;
        roomsList[index].children.removeLast();
        emit(DecrementChildren());
      }
  }
  void changePetSwitch(bool value) {
    isPetSwitched = value;
    emit(ChangePetSwitch());
  }
}
