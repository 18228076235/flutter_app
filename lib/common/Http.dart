import 'package:dio/dio.dart';

class HttpUtil {
  static HttpUtil instance;
  Dio dio;
  BaseOptions options;
  CancelToken cancelToken = new CancelToken();
  static HttpUtil getInstance() {
    if (null == instance) instance = new HttpUtil();
    return instance;
  }

  HttpUtil() {
    options = new BaseOptions(
        baseUrl: 'http://127.0.0.1:3000',
        connectTimeout: 10000,
        receiveTimeout: 5000,
        responseType: ResponseType.json);
    dio = new Dio(options);
    //dio.interceptors.add(CookieManager(CookieJar()));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('brefore');
      return options;
    }, onResponse: (Response response) {
      print('响应前');
      return response;
    }, onError: (DioError e) {
      print('错误前');
      return e;
    }));
  }
  // 下载文件
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        print('$count $total');
      });
    } catch (e) {
      formatError(e);
    }
    return response.data;
  }

  // 取消请求
  void cancelRequesets(CancelToken token) {
    token.cancel('cancelled');
  }

  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('get success----${response.statusCode}');
      print('get success----${response.data}');
    } on DioError catch (e) {
      print('get error----$e');
      formatError(e);
    }
    return response.data;
  }

  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      formatError(e);
    }
    return response.data;
  }

  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print('链接超时');
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print('响应超时');
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print(' 请求超时');
    } else if (e.type == DioErrorType.RESPONSE) {
      print('   出现异常');
    } else if (e.type == DioErrorType.CANCEL) {
      print(' 请求取消');
    } else {
      print('未知错误');
    }
  }
}
