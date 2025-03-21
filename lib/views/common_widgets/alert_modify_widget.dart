import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';

import '../re_common_widgets/viewmodels/hospital_viewmodel.dart';

class AlertModifyWidget extends ConsumerStatefulWidget {
  final Memo? memo; // null이면 새로 작성, 값이 있으면 수정

  const AlertModifyWidget({super.key, this.memo});
  @override
  _AlertModifyWidgetState createState() => _AlertModifyWidgetState();
}

class _AlertModifyWidgetState extends ConsumerState<AlertModifyWidget> {
  late final TextEditingController _memoController;

  @override
  void initState() {
    super.initState();
    _memoController = TextEditingController(text: widget.memo?.content ?? '');
  }

  @override
  void dispose() {
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.only(top: 15, right: 15, left: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      // title 대신에 직접 Row를 구성해서 닫기 버튼 포함
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.memo != null ? '메모 수정하기' : '메모 작성하기',
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 24,
                      color: AppPalette.primaryColor,
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "단아치과의원단아치과의원아인이이",
                            style: AppTheme.boldText16,
                            overflow: TextOverflow.ellipsis, // 넘치면 '...'으로 표시
                            maxLines: 1, // 한 줄로 제한 (필요시 2~3줄로 변경 가능)
                          ),
                          Text("서울 구로구 구로1동", style: AppTheme.greyText14),
                        ],
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
      // 하단 취소 / 확인 버튼
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: double.infinity, // 전체 너비를 차지하도록 설정
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 50),
                    backgroundColor: AppPalette.textbackground, // 배경색 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('취소', style: AppTheme.alertTextStyleCancel),
                ),
              ),
              const SizedBox(width: 9), // 버튼 사이 간격 추가
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 50),
                    backgroundColor: AppPalette.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  onPressed: () {
                    if (widget.memo != null) {
                      // 기존 메모 수정: 업데이트할 새 메모 객체 생성
                      final updatedMemo = Memo(
                        id: widget.memo!.id,
                        content: _memoController.text,
                        editDate: DateTime.now(),
                        replies: widget.memo!.replies,
                      );
                      ref
                          .read(hospitalViewModelProvider.notifier)
                          .updateMemo(widget.memo!.id, updatedMemo);
                    } else {
                      // 새 메모 추가
                      final newMemo = Memo(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        content: _memoController.text,
                        editDate: DateTime.now(),
                        replies: [],
                      );
                      ref
                          .read(hospitalViewModelProvider.notifier)
                          .addMemo(newMemo);
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
  }
}
