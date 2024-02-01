import 'package:dio/dio.dart';
import 'package:youtube_play/const/api.dart';

// enum QueryParameters {
//   channelId, key, part, order, maxResults
// }

class YoutubeRepository {
  static Future<void> getVideo() async {
    // Dio.get 요청하여 데이터 가져오기
    final response = await Dio().get(
      // note: path 데이터를 보낼 경로는 youtube... 이며 lib/const/api.dart 의 YOUTUBE_API_BASE_URL 가져온다
      YOUTUBE_API_BASE_URL,
      queryParameters: {
        'channelId': CF_CHANNEL_ID,
        'key': API_KEY,
        'part': 'snippet',
        'order': 'viewCount',
        'maxResults': 5,
        // QueryParameters.channelId.toString(): CF_CHANNEL_ID,
        // QueryParameters.key.toString(): API_KEY,
        // QueryParameters.part.toString(): 'snippet',
        // QueryParameters.order.toString(): 'viewCount',
        // QueryParameters.maxResults.toString(): 5,
      },
    );

    print(response);
    // return response;
  }
}
