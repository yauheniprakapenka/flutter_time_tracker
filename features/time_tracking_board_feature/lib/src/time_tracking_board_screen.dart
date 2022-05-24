import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'bloc/time_tracking_board_bloc.dart';
import 'composites/desktop_time_tracking_board_composite.dart';
import 'composites/mobile_time_tracking_board_composite.dart';

class TimeTrackingBoardScreen extends StatelessWidget {
  const TimeTrackingBoardScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeTrackingBoardBloc>(
      create: (_) {
        return TimeTrackingBoardBloc(
          timeFrameRepository: serviceLocator.get<TimeFrameRepository>(),
        )..add(const LoadTimeFrames());
      },
      child: const _TimeTrackingBoardScreen(),
    );
  }
}

class _TimeTrackingBoardScreen extends StatelessWidget {
  const _TimeTrackingBoardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.veryDarkBlue,
        ),
      ),
      backgroundColor: AppColors.veryDarkBlue,
      body: BlocBuilder<TimeTrackingBoardBloc, TimeTrackingBoardState>(
        builder: (_, state) {
          if (state.isLoading) {
            return const AppProgressIndicator();
          }

          return AdaptiveScreen(
            mobile: MobileTimeTrackingBoardComposite(state: state),
            desktop: DesktopTimeTrackingBoardComposite(state: state),
          );
        },
      ),
    );
  }
}
