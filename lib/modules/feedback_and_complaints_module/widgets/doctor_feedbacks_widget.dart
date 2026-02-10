import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/widgets/empty_feedbacks_widget.dart';
import 'package:petcure_doctor_app/modules/feedback_and_complaints_module/widgets/feedback_card.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/list_item_loading_widget.dart';

class DoctorFeedbacksWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const DoctorFeedbacksWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorFeedbacksCubit, DoctorFeedbacksState>(
      builder: (context, state) {
        return switch (state) {
          DoctorFeedbacksInitial() => const SizedBox.shrink(),
          DoctorFeedbacksLoading() => const ListItemLoadingWidget(itemCount: 5),
          DoctorFeedbacksEmpty() => const EmptyFeedbacksWidget(),
          DoctorFeedbacksLoaded(
            doctorFeedbackModel: final doctorFeedbackModel,
          ) =>
            Builder(
              builder: (context) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: doctorFeedbackModel.count,
                  itemBuilder: (context, index) {
                    final feedback = doctorFeedbackModel.data[index];
                    return FeedbackCard(feedback: feedback);
                  },
                );
              },
            ),
          DoctorFeedbacksError(error: final error) => CustomErrorWidget(
            onRetry: onRetry,
            errorMessage: error,
          ),
        };
      },
    );
  }
}
