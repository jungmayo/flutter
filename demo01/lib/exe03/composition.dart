class Room {
  final int roomNumber;
  Room(this.roomNumber);
}

class House {
  final Room room;
  final String address;

  House(int roomNumber, this.address) : room = Room(roomNumber);

  void disPlayHouseInfo() {
    room.roomNumber;
    print('방번호는 ${room.roomNumber} 이고, 주소는 ${address}이다');
  }
}

void main() {
  House house = House(22, '방주소');
  house.disPlayHouseInfo();
}
