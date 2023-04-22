abstract class TaskState {
  TaskState();
}

class TaskInitial extends TaskState {
  TaskInitial();
}

class TaskLoading extends TaskState {
  TaskLoading();
}

class TaskError extends TaskState {
  String msg;
  TaskError(this.msg);
}