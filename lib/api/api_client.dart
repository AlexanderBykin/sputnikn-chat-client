import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sputnikn_chat_client/api/model/map_string_dynamic.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio) => _ApiClient(dio);

  static const _headerUser = 'X-SPUTNIKN-USER';

  @GET('/media/{mediaId}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> download(
    @Header(_headerUser) String userId,
    @Path('mediaId') String contentId,
  );

  @POST('/media')
  @MultiPart()
  Future<HttpResponse<MapStringDynamic>> upload(
    @Header(_headerUser) String userId,
    @Part() List<MultipartFile> mediaFiles,
  );
}
