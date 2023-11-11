import 'package:crypto_app/constants/strings.dart';

List<String> types = [Strings.crypto, Strings.nft];
List<String> filter = ["Price", "Volume 24H"];

String apiKey = '464e87fb-b3f5-425a-8d9e-22d325928388';
String baseUrlV1 = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/';
String baseUrlV2 = 'https://pro-api.coinmarketcap.com/v2/cryptocurrency/';

//Endpoints

String listing = "listings/latest";
String info = "info";

int CODE_SUCCESS = 200;