import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/time_tracking_board_bloc.dart';
import '../models/time_tracking_card_type.dart';
import '../widgets/profile_menu/desktop_profile_menu.dart';
import '../widgets/time_tracking_card/desktop_time_tracking_card.dart';

class DesktopTimeTrackingBoardComposite extends StatelessWidget {
  final TimeTrackingBoardState state;

  const DesktopTimeTrackingBoardComposite({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 360,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DesktopProfileMenu(
                  avatar: const AssetImage(AppImages.jeremy),
                  firstName: 'Jeremy',
                  lastName: 'Robson',
                  selectedPeriodTimeType: state.periodTimeType,
                  onDailyPressed: () {
                    BlocProvider.of<TimeTrackingBoardBloc>(context, listen: false).add(const PressDailyButton());
                  },
                  onMonthlyPressed: () {
                    BlocProvider.of<TimeTrackingBoardBloc>(context, listen: false).add(const PressMonthlyButton());
                  },
                  onWeeklyPressed: () {
                    BlocProvider.of<TimeTrackingBoardBloc>(context, listen: false).add(const PressWeeklyButton());
                  },
                ),
                const SizedBox(width: AppDimensions.padding24),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DesktopTimeTrackingCard(
                          timeTrackingCardType: TimeTrackingCardType.work,
                          currentHours: state.timeFrameFilter?.work.current.toString() ?? '',
                          previousHours: state.timeFrameFilter?.work.previous.toString() ?? '',
                          periodTimeType: state.periodTimeType,
                        ),
                        const SizedBox(width: AppDimensions.padding24),
                        DesktopTimeTrackingCard(
                          timeTrackingCardType: TimeTrackingCardType.play,
                          currentHours: state.timeFrameFilter?.play.current.toString() ?? '',
                          previousHours: state.timeFrameFilter?.play.previous.toString() ?? '',
                          periodTimeType: state.periodTimeType,
                        ),
                        const SizedBox(width: AppDimensions.padding24),
                        DesktopTimeTrackingCard(
                          timeTrackingCardType: TimeTrackingCardType.study,
                          currentHours: state.timeFrameFilter?.study.current.toString() ?? '',
                          previousHours: state.timeFrameFilter?.study.previous.toString() ?? '',
                          periodTimeType: state.periodTimeType,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.padding24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DesktopTimeTrackingCard(
                          timeTrackingCardType: TimeTrackingCardType.exercise,
                          currentHours: state.timeFrameFilter?.exercise.current.toString() ?? '',
                          previousHours: state.timeFrameFilter?.exercise.previous.toString() ?? '',
                          periodTimeType: state.periodTimeType,
                        ),
                        const SizedBox(width: AppDimensions.padding24),
                        DesktopTimeTrackingCard(
                          timeTrackingCardType: TimeTrackingCardType.social,
                          currentHours: state.timeFrameFilter?.social.current.toString() ?? '',
                          previousHours: state.timeFrameFilter?.social.previous.toString() ?? '',
                          periodTimeType: state.periodTimeType,
                        ),
                        const SizedBox(width: AppDimensions.padding24),
                        DesktopTimeTrackingCard(
                          timeTrackingCardType: TimeTrackingCardType.selfCare,
                          currentHours: state.timeFrameFilter?.selfCare.current.toString() ?? '',
                          previousHours: state.timeFrameFilter?.selfCare.previous.toString() ?? '',
                          periodTimeType: state.periodTimeType,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
