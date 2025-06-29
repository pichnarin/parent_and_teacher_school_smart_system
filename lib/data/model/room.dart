class Room {
  final String roomId;
  final String roomName;

  const Room({
    required this.roomId,
    required this.roomName,
  });

  String get getRoomId => roomId;
  String get getRoomName => roomName;

  @override
  String toString() {
    return 'Room(roomId: $roomId, roomName: $roomName)';
  }

}