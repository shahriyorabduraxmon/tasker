import 'package:flutter_bloc/flutter_bloc.dart';
import '../task_state/task_state.dart';

class TaskCubit extends Cubit<TaskState>{
  TaskCubit() : super(TaskInitial());

  adminEmit(state){
    emit(state);
  }
}