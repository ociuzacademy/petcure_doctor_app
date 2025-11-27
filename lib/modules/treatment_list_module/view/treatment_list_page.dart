// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';

import 'package:petcure_doctor_app/core/helpers/fake_data.dart';
import 'package:petcure_doctor_app/core/models/treatment_record.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/utils/treatment_list_helper.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/date_selector_widget.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/empty_treatments_list.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/treatment_record_card.dart';
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
  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier<DateTime?>(
    DateTime.now(),
  );
  final ValueNotifier<List<TreatmentRecord>> _allTreatmentRecords =
      ValueNotifier<List<TreatmentRecord>>([]);
  final ValueNotifier<List<TreatmentRecord>> _filteredRecords =
      ValueNotifier<List<TreatmentRecord>>([]);

  @override
  void initState() {
    super.initState();
    // Generate fake treatment records
    _treatmentListHelper = TreatmentListHelper(
      allTreatmentRecords: _allTreatmentRecords,
      filteredRecords: _filteredRecords,
    );
    _allTreatmentRecords.value = FakeData.generateFakeTreatmentRecords(
      count: 50,
    );

    for (final record in _allTreatmentRecords.value) {
      debugPrint(record.toString());
    }

    _treatmentListHelper.filterRecordsByDate(_selectedDate.value!);
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
              _treatmentListHelper.filterRecordsByDate(DateTime.now());
            },
            tooltip: 'Go to Today',
          ),
        ],
      ),
      body: Column(
        children: [
          // Date selector
          ValueListenableBuilder<DateTime?>(
            valueListenable: _selectedDate,
            builder: (context, selectedDate, child) {
              return ValueListenableBuilder(
                valueListenable: _filteredRecords,
                builder: (context, filteredRecords, child) {
                  return DateSelectorWidget(
                    selectedDate: selectedDate,
                    onSelectingDate: (date) {
                      _selectedDate.value = date;
                      _treatmentListHelper.filterRecordsByDate(date);
                    },
                    filteredRecords: filteredRecords,
                  );
                },
              );
            },
          ),

          // Treatment records list
          ValueListenableBuilder(
            valueListenable: _filteredRecords,
            builder: (context, filteredRecords, child) {
              return Expanded(
                child: filteredRecords.isEmpty
                    ? EmptyTreatmentsList(
                        onSelectingToday: () {
                          _selectedDate.value = DateTime.now();
                          _treatmentListHelper.filterRecordsByDate(
                            DateTime.now(),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: filteredRecords.length,
                        itemBuilder: (context, index) {
                          return TreatmentRecordCard(
                            record: filteredRecords[index],
                            getBookingOptionColor:
                                AppHelpers.getBookingOptionColor,
                            getBookingOptionText:
                                AppHelpers.getBookingOptionText,
                          );
                        },
                      ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _allTreatmentRecords,
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              // Option to generate new records or refresh
              _allTreatmentRecords.value =
                  FakeData.generateFakeTreatmentRecords(count: 50);
              _treatmentListHelper.filterRecordsByDate(
                _selectedDate.value ?? DateTime.now(),
              );
              CustomSnackBar.show(
                context,
                message: 'Treatment records refreshed',
              );
            },
            backgroundColor: AppPalette.firstColor,
            tooltip: 'Refresh Records',
            child: const Icon(Icons.refresh, color: AppPalette.whiteColor),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _selectedDate.dispose();
    super.dispose();
  }
}
