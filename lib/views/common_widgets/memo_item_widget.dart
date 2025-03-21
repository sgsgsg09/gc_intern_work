// 파일명: memo_item_widget.dart
import 'package:flutter/material.dart';

import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/viewmodels/hospital_viewmodel.dart';
import 'package:intl/intl.dart';

class MemoItemWidget extends StatelessWidget {
  final DetailedComment detail;

  const MemoItemWidget({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final comment = detail.comment;
    final employee = detail.employee;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 작성자 + 시간 등 기존 _buildMemoItem 내부 구현
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
                            '${employee?.jobTitle}',
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
                            '${employee?.workplace}',
                            style: AppTheme.boldText14,
                          ),
                        ],
                      ),
                      Text(
                        _formatEditDate(comment.editDate),
                        style: AppTheme.normalText14,
                      ),
                    ],
                  ),
                ],
              ),
              // 수정/삭제 버튼
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // 수정 액션 예시
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
                  GestureDetector(
                    onTap: () {
                      // 삭제 액션 예시
                    },
                    child: Text('삭제', style: AppTheme.greyActionText),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              comment.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // 답글 쓰기 액션 예시
                },
                child: Text('답글 쓰기', style: AppTheme.greyActionText),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatEditDate(DateTime editDate) {
    final Duration diff = DateTime.now().difference(editDate);

    String relativeTime;
    if (diff.inMinutes < 60) {
      relativeTime = '${diff.inMinutes}분전';
    } else if (diff.inHours < 24) {
      relativeTime = '${diff.inHours}시간전';
    } else {
      relativeTime = '${diff.inDays}일전';
    }

    final String formattedDate = DateFormat('yyyy.MM.dd').format(editDate);
    return '$relativeTime ($formattedDate)';
  }
}
