class NumberPanelState {
  /// Currently entered password.
  ///
  /// Examples: '748', '2222', '', '9'.
  final String currentPassword;

  const NumberPanelState({required this.currentPassword});

  NumberPanelState copyWith({String? currentPassword}) {
    return NumberPanelState(
      currentPassword: currentPassword ?? this.currentPassword,
    );
  }
}
