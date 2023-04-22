import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/task_model/task_model.dart';
import '../main_view_state/main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewInitial());

  int bottomNavigationIndex = 0;

  List<TaskModel> taskLists = [];

  List<TaskModel> taskPersonalLists = [];

  List<TaskModel> taskWorkLists = [];

  List<TaskModel> taskMeetingLists = [];

  List<TaskModel> taskShoppingLists = [];

  List<TaskModel> taskPartyLists = [];

  List<TaskModel> taskStudyLists = [];

  changeMainViewIndex(int index) {
    bottomNavigationIndex = index;
    emit(MainViewInitial());
  }

  changeState(state) {
    emit(state);
  }
}