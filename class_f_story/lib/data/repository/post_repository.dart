import 'package:class_f_story/_core/utils/my_http.dart';
import 'package:dio/dio.dart';

class PostRepository {
  const PostRepository(); //cosnt 새로 안만들고 기존 객체 가져옴

  // 게시글 목록을 조회 object
  //findAll
  // - [page] : 조회할 페이지 번호 (기본값 0)
  // - return : 서버로부터 받은 게시글 목록(Map 형태)
  // dio 헤더에 토큰이 저장되어 있는 상태
  Future<Map<String, dynamic>> findAll({int page = 0}) async {
    // 다트에서 List --> 표기법 []
    // 다트에서 Map --> 표기법 {}
    Response response =
        await dio.get('/api/post', queryParameters: {'page': page});

    // Http 전체 응답 메세지에서 바디 부분만 추출해서 뷰 모델로 리턴 시키자.

    // response.headers // header
    // Map 구조로 다운캐스팅을 하고 뷰 모델로 던져줄 예정

    Map<String, dynamic> responseBody = response.data; // body
    return responseBody;
  }

  // 게시글 상세 조회
  // findById
  // id는 필수값이기때문에 required를 따로 적어준다.
  Future<Map<String, dynamic>> findById({required int id}) async {
    Response response = await dio.get('/api/post/${id}');
    Map<String, dynamic> responseBody = response.data; // body
    return responseBody;
  }

  // 게시글 삭제
  // delete
  Future<Map<String, dynamic>> delete({required int id}) async {
    Response response = await dio.delete('/api/post/${id}');
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 생성
  // save
  Future<Map<String, dynamic>> save(Map<String, dynamic> reqData) async {
    Response response = await dio.post('/api/post', data: reqData);
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 수정
  // update
  Future<Map<String, dynamic>> update(
      int id, Map<String, dynamic> reqData) async {
    Response response = await dio.put('/api/post/${id}', data: reqData);
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }
}

// API 응답( response.data)는 기본적으로 dynamic 타입
// dio 패키지를 사용해 서버에서 데이터를 받아오면 response.data의 타입이 dynamic이다.
// 즉 response.data가 JSON 객체인지 확실하지 않기 때문에 Map<String,dynamic>으로 형을 변환하여 JSON 객체라는 것을 명확히 해준다.
// 상위 타입인 dynamic을 하위타입인 Map<String,dynamic>으로 변환하는 것.
