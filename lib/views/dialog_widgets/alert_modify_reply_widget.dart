import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/models/memo_model.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';

import '../../viewmodels/hospital_viewmodel.dart';
import 'package:intl/intl.dart';

class AlertModifyReplyWidget extends ConsumerStatefulWidget {
  final String memoId;

  final Reply? reply;

  const AlertModifyReplyWidget({super.key, required this.memoId, this.reply});

  @override
  _AlertModifyReplyWidgetState createState() => _AlertModifyReplyWidgetState();
}

class _AlertModifyReplyWidgetState
    extends ConsumerState<AlertModifyReplyWidget> {
  late final TextEditingController _memoController;

  @override
  void initState() {
    super.initState();
    _memoController = TextEditingController(text: widget.reply?.content ?? '');
  }

  @override
  void dispose() {
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeInformation = ["CE", "강서지점"];
    // final memo = ref
    //     .watch(hospitalViewModelProvider)
    //     .firstWhere((m) => m.id == widget.memoId);
    final asyncMemos = ref.watch(hospitalViewModelProvider);

    return asyncMemos.when(
      data: (memos) {
        final memo = memos.firstWhere((m) => m.id == widget.memoId);

        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 15, right: 15, left: 15),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          // title 대신에 직접 Row를 구성해서 닫기 버튼 포함
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.reply != null ? '답글 수정하기' : '답글 작성하기',
                style: AppTheme.boldText14,
              ),
              IconButton(
                //flutter 최소 터치 픽셀 48로 인해 더 이상 조절 불가능.
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(),
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: AppPalette.greyColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          // Divider를 title과 content 사이에 배치
          content: Column(
            mainAxisSize: MainAxisSize.min, // 불필요한 공간 차지를 방지

            children: [
              const Divider(
                height: 0,
                thickness: 1,
                color: AppPalette.greyColor,
              ), // title과 content 사이에 구분선 추가
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // 불필요한 공간 차지를 방지
                  children: [
                    const SizedBox(height: 10), // 구분선과 본문 사이 간격 추가
                    Column(
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
                                  _formatEditDate(memo.editDate),
                                  style: AppTheme.normalText14,
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
                      ],
                    ),
                    const SizedBox(height: 10), // 구분선과 본문 사이 간격 추가

                    TextField(
                      controller: _memoController,
                      maxLines: null, // 줄 수 제한 없이 자동으로 줄바꿈됨
                      minLines: 3, // 초기 최소 줄 수 (원하는 만큼 설정 가능)

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText:
                            "기록하고 싶은 영업 내용을 글로 남겨보세요. \n거래처 관련자에 대한 내밀 또는 개인 정보 등 입력 시 명예훼손 문제가 발생될 수 있으니 꼭! 유의하세요!",
                        hintStyle: AppTheme.greyText14,
                        hintMaxLines: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 하단 버튼
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: double.infinity, // 전체 너비를 차지하도록 설정
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 50,
                        ),
                        backgroundColor: AppPalette.textbackground, // 배경색 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        '취소',
                        style: AppTheme.alertTextStyleCancel,
                      ),
                    ),
                  ),
                  const SizedBox(width: 9), // 버튼 사이 간격 추가
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 50,
                        ),
                        backgroundColor: AppPalette.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      onPressed: () {
                        final content = _memoController.text;

                        if (widget.reply != null) {
                          final updatedReply = Reply(
                            id: widget.reply!.id,
                            content: content,
                            editDate: DateTime.now(),
                          );
                          ref
                              .read(hospitalViewModelProvider.notifier)
                              .updateReply(
                                widget.memoId,
                                widget.reply!.id,
                                updatedReply,
                              );
                        } else {
                          // 새 답글 추가
                          final newReply = Reply(
                            id:
                                DateTime.now().millisecondsSinceEpoch
                                    .toString(),
                            content: content,
                            editDate: DateTime.now(),
                          );
                          ref
                              .read(hospitalViewModelProvider.notifier)
                              .addReply(widget.memoId, newReply);
                        }
                        Navigator.pop(context);
                      },
                      child: Text('완료', style: AppTheme.alertTextStyleComplete),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (error, stackTrace) => AlertDialog(
            title: const Text('Error'),
            content: Text('Error: $error'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('확인'),
              ),
            ],
          ),
    );
  }
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
