import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_new_notification_state.dart';

class AddNewNotificationCubit extends Cubit<AddNewNotificationState> {
  AddNewNotificationCubit() : super(AddNewNotificationInitial());
}
