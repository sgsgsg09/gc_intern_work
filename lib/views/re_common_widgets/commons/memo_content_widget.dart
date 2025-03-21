import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/models/memo_model.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/views/dialog_widgets/alert_modify_reply_widget.dart';
import 'package:gc_intern_work/views/dialog_widgets/alert_modify_widget.dart';
import 'package:gc_intern_work/viewmodels/hospital_viewmodel.dart';
import 'package:intl/intl.dart';

class MemoContentWidget extends StatelessWidget {
  final Memo memo;
  final List<String> employeeInformation;

  const MemoContentWidget({
    Key? key,
    required this.memo,
    required this.employeeInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 작성자, 시간 등 상단 정보
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.handshake, color: AppPalette.textgreyColor),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          employeeInformation[0],
                          style: AppTheme.boldText14,
                        ),
                        SizedBox(
                          height: 14,
                          child: VerticalDivider(
                            thickness: 1,
                            width: 10,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          employeeInformation[1],
                          style: AppTheme.boldText14,
                        ),
                      ],
                    ),
                    Text(
                      _formatEditDate(memo.editDate),
                      style: AppTheme.normalText14,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // AlertModifyWidget에 기존 memo를 전달.
                    showDialog(
                      context: context,
                      builder: (context) => AlertModifyWidget(memo: memo),
                    );
                  },
                  child: Text('수정', style: AppTheme.greyActionText),
                ),
                const SizedBox(
                  height: 14,
                  width: 10,
                  child: VerticalDivider(
                    thickness: 1,
                    color: AppPalette.greyColor,
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    return GestureDetector(
                      onTap: () {
                        ref
                            .read(hospitalViewModelProvider.notifier)
                            .deleteMemo(memo.id);
                      },
                      child: Text('삭제', style: AppTheme.greyActionText),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            memo.content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertModifyReplyWidget(memoId: memo.id),
                );
              },
              child: Text('답글 쓰기', style: AppTheme.greyActionText),
            ),
          ],
        ),
      ],
    );
  }

  String _formatEditDate(DateTime editDate) {
    final Duration diff = DateTime.now().difference(editDate);
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}분전 (${DateFormat('yyyy.MM.dd').format(editDate)})';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}시간전 (${DateFormat('yyyy.MM.dd').format(editDate)})';
    } else {
      return '${diff.inDays}일전 (${DateFormat('yyyy.MM.dd').format(editDate)})';
    }
  }
}
