class Apartment {
  final String buildingName;
  final List<Resident> residents;

  Apartment(this.buildingName) : residents = [];

  void residentAdd(Resident res) {
    residents.add(res);
  }

  void displayApartmentInfo() {
    print('건물이름은 : ${buildingName}');
    for (var res in residents) {
      print('그 건물의 투숙객 이름은 : ${res.name}');
      // res.resName();
    }
  }
}

class Resident {
  final String name;
  Resident(this.name);

  // void resName() {
  //   print('그 건물의 투숙객의 이름 : ${name}');
  // }
}

void main() {
  Apartment apt1 = Apartment('그린빌딩');
  Apartment apt2 = Apartment('노랑빌딩');
  Resident res1 = Resident('정지현');
  Resident res2 = Resident('정마요');
  apt1.residentAdd(res1);
  apt1.residentAdd(res2);
  apt1.displayApartmentInfo();
}
