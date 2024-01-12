part of 'one_time_tab_cubit.dart';

@immutable
class OneTimeTabState {
  const OneTimeTabState({
    required this.list,
  });

  final List<OneTimeNotification> list;

  OneTimeTabState copyWith({
    List<OneTimeNotification>? list,
  }) {
    return OneTimeTabState(
      list: list ?? this.list,
    );
  }
}
