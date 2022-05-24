import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/time_tracking_board_bloc.dart';
import '../models/time_tracking_card_type.dart';
import '../widgets/profile_menu/mobile_profile_menu.dart';
import '../widgets/time_tracking_card/mobile_time_tracking_card.dart';

class MobileTimeTrackingBoardComposite extends StatelessWidget {
  final TimeTrackingBoardState state;

  const MobileTimeTrackingBoardComposite({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.padding24,
        right: AppDimensions.padding24,
        top: AppDimensions.padding24,
      ),
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 330),
            child: Column(
              children: [
                MobileProfileMenu(
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
                    ;
                  },
                ),
                const SizedBox(height: AppDimensions.padding24),
                MobileTimeTrackingCard(
                  timeTrackingCardType: TimeTrackingCardType.work,
                  currentHours: state.timeFrameFilter?.work.current.toString() ?? '',
                  previousHours: state.timeFrameFilter?.work.previous.toString() ?? '',
                  periodTimeType: state.periodTimeType,
                ),
                const SizedBox(height: AppDimensions.padding24),
                MobileTimeTrackingCard(
                  timeTrackingCardType: TimeTrackingCardType.play,
                  currentHours: state.timeFrameFilter?.play.current.toString() ?? '',
                  previousHours: state.timeFrameFilter?.play.previous.toString() ?? '',
                  periodTimeType: state.periodTimeType,
                ),
                const SizedBox(height: AppDimensions.padding24),
                MobileTimeTrackingCard(
                  timeTrackingCardType: TimeTrackingCardType.study,
                  currentHours: state.timeFrameFilter?.study.current.toString() ?? '',
                  previousHours: state.timeFrameFilter?.study.previous.toString() ?? '',
                  periodTimeType: state.periodTimeType,
                ),
                const SizedBox(height: AppDimensions.padding24),
                MobileTimeTrackingCard(
                  timeTrackingCardType: TimeTrackingCardType.exercise,
                  currentHours: state.timeFrameFilter?.exercise.current.toString() ?? '',
                  previousHours: state.timeFrameFilter?.exercise.previous.toString() ?? '',
                  periodTimeType: state.periodTimeType,
                ),
                const SizedBox(height: AppDimensions.padding24),
                MobileTimeTrackingCard(
                  timeTrackingCardType: TimeTrackingCardType.social,
                  currentHours: state.timeFrameFilter?.social.current.toString() ?? '',
                  previousHours: state.timeFrameFilter?.social.previous.toString() ?? '',
                  periodTimeType: state.periodTimeType,
                ),
                const SizedBox(height: AppDimensions.padding24),
                MobileTimeTrackingCard(
                  timeTrackingCardType: TimeTrackingCardType.selfCare,
                  currentHours: state.timeFrameFilter?.selfCare.current.toString() ?? '',
                  previousHours: state.timeFrameFilter?.selfCare.previous.toString() ?? '',
                  periodTimeType: state.periodTimeType,
                ),
                const SizedBox(height: AppDimensions.padding24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
