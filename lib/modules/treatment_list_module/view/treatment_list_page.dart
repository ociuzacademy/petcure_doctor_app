// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_doctor_app/core/exports/bloc_exports.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/utils/treatment_list_helper.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/date_selector_widget.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/empty_treatments_list.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/treatment_record_card.dart';
import 'package:petcure_doctor_app/widgets/custom_error_widget.dart';
import 'package:petcure_doctor_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';

class TreatmentListPage extends StatefulWidget {
  const TreatmentListPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const TreatmentListPage());

  @override
  State<TreatmentListPage> createState() => _TreatmentListPageState();
}

class _TreatmentListPageState extends State<TreatmentListPage> {
  late final TreatmentListHelper _treatmentListHelper;
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier(DateTime.now());
  @override
  void initState() {
    super.initState();
    _treatmentListHelper = TreatmentListHelper(
      context: context,
      selectedDate: _selectedDate,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _treatmentListHelper.getTreatmentHistory();
    });
    _selectedDate.addListener(() {
      _treatmentListHelper.getTreatmentHistory();
    });
  }

  @override
  void dispose() {
    _selectedDate.removeListener(() {
      _treatmentListHelper.getTreatmentHistory();
    });
    _selectedDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treatment Records'),
        backgroundColor: AppPalette.firstColor,
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
        iconTheme: const IconThemeData(color: AppPalette.whiteColor),
        actionsIconTheme: const IconThemeData(color: AppPalette.whiteColor),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              _selectedDate.value = DateTime.now();
            },
            tooltip: 'Go to Today',
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<TreatmentHistoryCubit, TreatmentHistoryState>(
          builder: (context, state) {
            return switch (state) {
              TreatmentHistoryLoading() => const CustomLoadingWidget(),
              TreatmentHistoryError(:final message) => CustomErrorWidget(
                onRetry: _treatmentListHelper.getTreatmentHistory,
                errorMessage: message,
              ),
              TreatmentHistorySuccess(:final treatmentHistory) => Column(
                children: [
                  // Date selector
                  DateSelectorWidget(
                    selectedDate: _selectedDate.value,
                    onSelectingDate: (date) {
                      _selectedDate.value = date;
                    },
                    recordsCount: treatmentHistory.treatments.length,
                  ),

                  // Treatment records list
                  Expanded(
                    child: treatmentHistory.treatments.isEmpty
                        ? EmptyTreatmentsList(
                            onSelectingToday: () {
                              _selectedDate.value = DateTime.now();
                            },
                          )
                        : ListView.builder(
                            itemCount: treatmentHistory.treatments.length,
                            itemBuilder: (context, index) {
                              return TreatmentRecordCard(
                                treatment: treatmentHistory.treatments[index],
                                getBookingOptionColor:
                                    AppHelpers.getAppointmentTypeColor,
                                getBookingOptionText:
                                    AppHelpers.getAppointmentTypeText,
                              );
                            },
                          ),
                  ),
                ],
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomSnackBar.show(context, message: 'Treatment records refreshed');
        },
        backgroundColor: AppPalette.firstColor,
        tooltip: 'Refresh Records',
        child: const Icon(Icons.refresh, color: AppPalette.whiteColor),
      ),
    );
  }
}
