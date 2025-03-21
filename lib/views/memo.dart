import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/views/re_common_widgets/commons/memo_content_widget.dart';
import 'package:gc_intern_work/views/re_common_widgets/commons/reply_item_widget.dart';
import '../viewmodels/hospital_viewmodel.dart'; // HospitalViewModel과 provider가 정의된 파일

class ReMemoItemWidget extends ConsumerWidget {
  const ReMemoItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoList = ref.watch(hospitalViewModelProvider);
    /*     if (memoList.isEmpty) {
      return const Center(child: Text("메모가 없습니다."));
    } */

    final employeeInformation = ["CE", "강서지점"];

    return memoList.when(
      data: (memos) {
        if (memos.isEmpty) {
          return const Center(child: Text("메모가 없습니다."));
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            children: [
              // 안내 문구 "회색 박스" + "회색 글씨"
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppPalette.textbackground,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  '거래처 관련자에 대한 내밀 또는 개인 정보 등 명예훼손 문제가 발생될 수 있으니 꼭! 유의하여 작성해 주세요!',
                  style: AppTheme.textgreyColor15,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 12),
                      child: Row(
                        children: [
                          Text(
                            '총 ${memos.length}개',
                            style: AppTheme.normalText16,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: memos.length,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemBuilder: (context, index) {
                          final memo = memos[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MemoContentWidget(
                                  memo: memo,
                                  employeeInformation: employeeInformation,
                                ),
                                if (memo.replies.isNotEmpty)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children:
                                        memo.replies
                                            .map(
                                              (reply) => ReplyItemWidget(
                                                reply: reply,
                                                employeeInformation:
                                                    employeeInformation,
                                                memoId: memo.id,
                                              ),
                                            )
                                            .toList(),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text("Error: $error")),
    );
  }
}
