abstract class TimeTrackingBoardEvent {
  const TimeTrackingBoardEvent();
}

class PressDailyButton implements TimeTrackingBoardEvent {
  const PressDailyButton();
}

class PressWeeklyButton implements TimeTrackingBoardEvent {
  const PressWeeklyButton();
}

class PressMonthlyButton implements TimeTrackingBoardEvent {
  const PressMonthlyButton();
}

class LoadTimeFrames implements TimeTrackingBoardEvent {
  const LoadTimeFrames();
} 
