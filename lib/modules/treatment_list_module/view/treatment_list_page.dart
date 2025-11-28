// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_doctor_app/core/helpers/app_helpers.dart';
import 'package:petcure_doctor_app/core/theme/app_palette.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/provider/treatment_list_provider.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/date_selector_widget.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/empty_treatments_list.dart';
import 'package:petcure_doctor_app/modules/treatment_list_module/widgets/treatment_record_card.dart';
import 'package:petcure_doctor_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';

class TreatmentListPage extends StatefulWidget {
  const TreatmentListPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const TreatmentListPage());

  @override
  State<TreatmentListPage> createState() => _TreatmentListPageState();
}

class _TreatmentListPageState extends State<TreatmentListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TreatmentListProvider()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Treatment Records'),
          backgroundColor: AppPalette.firstColor,
          titleTextStyle: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
          iconTheme: const IconThemeData(color: AppPalette.whiteColor),
          actionsIconTheme: const IconThemeData(color: AppPalette.whiteColor),
          actions: [
            Consumer<TreatmentListProvider>(
              builder: (context, provider, child) {
                return IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    provider.selectDate(DateTime.now());
                  },
                  tooltip: 'Go to Today',
                );
              },
            ),
          ],
        ),
        body: Consumer<TreatmentListProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                // Date selector
                DateSelectorWidget(
                  selectedDate: provider.selectedDate,
                  onSelectingDate: (date) {
                    provider.selectDate(date);
                  },
                  filteredRecords: provider.filteredRecords,
                ),

                // Treatment records list
                Expanded(
                  child: provider.filteredRecords.isEmpty
                      ? EmptyTreatmentsList(
                          onSelectingToday: () {
                            provider.selectDate(DateTime.now());
                          },
                        )
                      : ListView.builder(
                          itemCount: provider.filteredRecords.length,
                          itemBuilder: (context, index) {
                            return TreatmentRecordCard(
                              record: provider.filteredRecords[index],
                              getBookingOptionColor:
                                  AppHelpers.getBookingOptionColor,
                              getBookingOptionText:
                                  AppHelpers.getBookingOptionText,
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: Consumer<TreatmentListProvider>(
          builder: (context, provider, child) {
            return FloatingActionButton(
              onPressed: () {
                provider.refreshRecords();
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
      ),
    );
  }
}
