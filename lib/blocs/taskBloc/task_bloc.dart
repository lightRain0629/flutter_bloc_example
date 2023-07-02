import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../modelTask/modelTask.dart';
import '../blocExports.dart';

part 'task_event.dart';
part 'task_state.dart';

// I want to use HydratedBloc but u got some error with

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<TaskEvent>((event, emit) {
      on<AddTask>(_onAddTask);
      on<UpdateTask>(_onUpdateTask);
      on<RemoveTask>(_onRemoveTask);
      on<DeleteTask>(_onDeleteTask);
    });
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(allTasks: List.from(state.allTasks)..add(event.task),
    removedTasks: state.removedTasks));
    
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);

    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));

    emit(TaskState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(allTasks: List.from(state.allTasks)..remove(event.task),
    removedTasks: List.from(state.removedTasks)..add(event.task.copyWith(isDeleted: true))
    ));
  }
  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(allTasks: state.allTasks, removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }
  
  // @override
  // TaskState? fromJson(Map<String, dynamic> json) {
  //   return TaskState.fromMap(json);

  // }
  
  // @override
  // Map<String, dynamic>? toJson(TaskState state) {
  //   return state.toMap();
  // }
}
