class NumberPanelState {
  /// Currently entered passcode.
  ///
  /// Examples: '748', '2222', '', '9'.
  final String currentEnteredPasscode;

  const NumberPanelState({required this.currentEnteredPasscode});

  NumberPanelState copyWith({String? currentEnteredPasscode}) {
    return NumberPanelState(
      currentEnteredPasscode: currentEnteredPasscode ?? this.currentEnteredPasscode,
    );
  }
}
