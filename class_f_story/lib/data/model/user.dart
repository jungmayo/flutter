// 게시글 주인이 누구 인가? 모델링 --> User
// 인증 여부 --> SessionUser 로 진행할 예정
class User {
  int? id;
  String? username;
  String? imgUrl;

  //네임드 컨스트럭터
  User.fromMap(Map<String, dynamic> map)
      : this.id = map["id"],
        this.username = map["username"],
        this.imgUrl = map["imgUrl"];
}
