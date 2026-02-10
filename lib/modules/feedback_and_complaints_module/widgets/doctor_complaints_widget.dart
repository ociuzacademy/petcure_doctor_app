import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/widgets/complaint_card.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/widgets/empty_complaints_widget.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/list_item_loading_widget.dart';

class DoctorComplaintsWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const DoctorComplaintsWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorComplaintsCubit, DoctorComplaintsState>(
      builder: (context, state) {
        return switch (state) {
          DoctorComplaintsInitial() => const SizedBox.shrink(),
          DoctorComplaintsLoading() => const ListItemLoadingWidget(
            itemCount: 5,
          ),
          DoctorComplaintsEmpty() => const EmptyComplaintsWidget(),
          DoctorComplaintsLoaded(
            doctorComplaintsModel: final doctorComplaintsModel,
          ) =>
            Builder(
              builder: (context) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: doctorComplaintsModel.count,
                  itemBuilder: (context, index) {
                    final complaint = doctorComplaintsModel.data[index];
                    return ComplaintCard(complaint: complaint);
                  },
                );
              },
            ),
          DoctorComplaintsError(error: final error) => CustomErrorWidget(
            onRetry: onRetry,
            errorMessage: error,
          ),
        };
      },
    );
  }
}
