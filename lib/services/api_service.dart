class api_services{
//matoa-api.staging.rhopenlabs-internal.africa
// 10.0.2.2:5278
  static String simpleUrl ="10.0.2.2:5278";
  static String baseUrl = '$simpleUrl/api/v1';
  static String httpBaseUrl = 'http://$baseUrl';

  static void setApiRoute({required bool isLocal}){
    if(isLocal == true){
      simpleUrl ="localhost:5278";
      baseUrl = '$simpleUrl/api/v1';
      httpBaseUrl = 'http://$baseUrl';
    }else{
      simpleUrl ="";
      baseUrl = '$simpleUrl/api/v1';
      httpBaseUrl = 'https://$baseUrl';
    }
  }
}
