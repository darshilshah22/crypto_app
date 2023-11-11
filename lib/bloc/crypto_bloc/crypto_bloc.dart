import 'package:bloc/bloc.dart';
import 'package:crypto_app/data/api_repo/api_service.dart';
import 'package:crypto_app/data/models/crypto_model.dart';
import 'package:crypto_app/data/models/response_model.dart';
import 'package:meta/meta.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CryptoInitial()) {
    on<GetCryptoDetailsEvent>((event, emit) async {
      List<CryptoInfoModel>? cryptoList = [];
      emit(CryptoLoadingState());
      try {
        ResponseModel responseModel =
            ResponseModel.fromJson(await latestListingApi());
        if (responseModel.status!.errorCode == 0) {
          for (var e in responseModel.data!) {
            CryptoInfoModel cryptoInfoModel = CryptoInfoModel.fromJson(e);
            ResponseModel response = ResponseModel.fromJson(
                await infoMetadataApi(cryptoInfoModel.id.toString()));
            if (response.status!.errorCode == 0) {
              cryptoInfoModel.logo =
                  response.data['${cryptoInfoModel.id}']['logo'];
              cryptoList.add(cryptoInfoModel);
            }
          }
          cryptoList.sort((a, b) => a.cmcRank!.compareTo(b.cmcRank!));
          emit(CryptoSuccessState(cryptoList: cryptoList));
        } else {
          emit(CryptoErrorState(error: responseModel.status!.errorMessage));
        }
      } catch (e) {
        print("xx: $e");
        emit(CryptoErrorState(error: e.toString()));
      }
    });
  }
}
