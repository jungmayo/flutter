// import 'package:class_f_story/data/model/post.dart';
//
// class PostList {
//   bool? isFirst;
//   bool? isLast;
//   int? pageNumber;
//   int? size;
//   int? totalPage;
//   List<Post>? posts;
//
//   // 기본 생성자 - (map['isFirst'])
//   PostList({
//     required this.isFirst,
//     required this.isLast,
//     required this.pageNumber,
//     required this.size,
//     required this.totalPage,
//     required this.posts,
//   });
//
//   // // 네임드 생성
//   // PostList.fromMap(Map<String, dynamic> map)
//   //     : isFirst = map["isFirst"],
//   //       isLast = map["isLast"],
//   //       pageNumber = map["pageNumber"],
//   //       size = map["size"],
//   //       totalPage = map["totalPage"],
//   //       posts = map["posts"] != null
//   //           ? List<Post>.from(map["posts"].map((post) => Post.fromMap(post)))
//   //           : [];
//
// //네임드 생성자
//   PostList.fromMap(Map<String, dynamic> map)
//       : isFirst = map["isFirst"] ?? false,
//         isLast = map["isLast"] ?? false,
//         pageNumber = map["pageNumber"] ?? 0,
//         size = map["size"] ?? 10,
//         totalPage = map["totalPage"] ?? 1,
//         posts = (map["posts"] as List<dynamic>? ?? []) // 이 한줄이 List가 됨 , List로 다운캐스팅
//             .map((e) => Post.fromMap(e))
//             .toList();
// // }
//
// //팩토리 생성자를 사용해보자.
// //   factory PostList.fromMap(Map<String, dynamic> map) {
// //     // if(map['posts'] == null) {
// //     //   return ;
// //     // }
// //     // 아래 코드에 try catch를 걸어줘야 한다면 팩토리 생성자를 사용할 수 있다. + if문 등 바디를 사용하고 싶을 때
// //     return PostList(
// //         isFirst: map["isFirst"] ?? false,
// //         isLast: map["isLast"] ?? false,
// //         pageNumber: map["pageNumber"] ?? 0,
// //         size: map["size"] ?? 10,
// //         totalPage: map["totalPage"] ?? 1,
// //         posts: (map["posts"] as List<dynamic> ?? [])
// //             .map((e) => Post.fromMap(e))
// //             .toList()); //e는 리스트 안의 내부의 오브젝트 하나하나를 의미
// //   }
//
//
//   // 깊은 복사 (객체 변경 시 활용)
//   PostList copyWith({
//     bool? isFirst,
//     bool? isLast,
//     int? pageNumber,
//     int? size,
//     int? totalPage,
//     List<Post>? posts,
//   }) {
//     return PostList(
//       isFirst: isFirst ?? this.isFirst,
//       isLast: isLast ?? this.isLast,
//       pageNumber: pageNumber ?? this.pageNumber,
//       size: size ?? this.size,
//       totalPage: totalPage ?? this.totalPage,
//       posts: posts ?? List<Post>.from(this.posts), // 리스트 깊은 복사
//     );
//   }
// }

import 'package:class_f_story/data/model/post.dart';

class PostList {
  bool isFirst;
  bool isLast;
  int pageNumber;
  int size;
  int totalPage;
  List<Post> posts;

  // 기본 생성자
  PostList({
    required this.isFirst,
    required this.isLast,
    required this.pageNumber,
    required this.size,
    required this.totalPage,
    required this.posts,
  });

  // 네임드 생성자
  PostList.fromMap(Map<String, dynamic> map)
      : isFirst = map["isFirst"] ?? false,
        isLast = map["isLast"] ?? false,
        pageNumber = map["pageNumber"] ?? 0,
        size = map["size"] ?? 10,
        totalPage = map["totalPage"] ?? 1,
        posts = (map["posts"] as List<dynamic>? ?? [])
            .map((e) => Post.fromMap(e))
            .toList();
}

// // 깊은 복사 (객체 변경 시 활용)
// PostList copyWith({
//   bool? isFirst,
//   bool? isLast,
//   int? pageNumber,
//   int? size,
//   int? totalPage,
//   List<Post>? posts,
// }) {
//   return PostList(
//     isFirst: isFirst ?? this.isFirst,
//     isLast: isLast ?? this.isLast,
//     pageNumber: pageNumber ?? this.pageNumber,
//     size: size ?? this.size,
//     totalPage: totalPage ?? this.totalPage,
//     posts: posts ?? List<Post>.from(this.posts), // 리스트 깊은 복사
//   );
// }
// }
