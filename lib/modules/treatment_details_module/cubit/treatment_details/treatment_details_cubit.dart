import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/models/treatment_details_model.dart';
import 'package:petcure_doctor_app/modules/treatment_details_module/services/treatment_details_services.dart';

part 'treatment_details_state.dart';
part 'treatment_details_cubit.freezed.dart';

class TreatmentDetailsCubit extends Cubit<TreatmentDetailsState> {
  TreatmentDetailsCubit() : super(const TreatmentDetailsState.initial());

  Future<void> getTreatmentDetails({required int bookingId}) async {
    emit(const TreatmentDetailsState.loading());
    try {
      final response = await TreatmentDetailsServices.getTreatmentDetails(
        bookingId: bookingId,
      );
      emit(TreatmentDetailsState.success(response));
    } catch (e) {
      emit(TreatmentDetailsState.error(e.toString()));
    }
  }
}
