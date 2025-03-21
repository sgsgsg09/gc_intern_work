import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/views/common_widgets/alert_modify_reply_widget.dart';
import 'package:gc_intern_work/views/re_common_widgets/viewmodels/hospital_viewmodel.dart';
import 'package:intl/intl.dart';

class ReplyItemWidget extends StatelessWidget {
  final String memoId;

  final Reply reply;
  final List<String> employeeInformation;

  const ReplyItemWidget({
    Key? key,
    required this.memoId,

    required this.reply,
    required this.employeeInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.subdirectory_arrow_right_rounded,
            color: AppPalette.textgreyColor,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.handshake,
                          color: AppPalette.textgreyColor,
                        ),
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
                              _formatEditDate(reply.editDate),
                              style: AppTheme.normalText14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            return GestureDetector(
                              onTap: () {
                                // 수정 버튼: AlertModifyReplyWidget을 열어 기존 답글을 편집
                                showDialog(
                                  context: context,
                                  builder:
                                      (context) => AlertModifyReplyWidget(
                                        memoId:
                                            memoId, // ReplyItemWidget에 추가된 memoId 필드
                                        reply: reply,
                                      ),
                                );
                              },
                              child: Text('수정', style: AppTheme.greyActionText),
                            );
                          },
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
                          builder: (context, ref, child) {
                            return GestureDetector(
                              onTap: () {
                                // 삭제 버튼: viewmodel의 deleteReply 메서드를 호출하여 답글 삭제
                                ref
                                    .read(hospitalViewModelProvider.notifier)
                                    .deleteReply(memoId, reply.id);
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
                    reply.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
