import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/models/models.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/viewmodels/hospital_viewmodel.dart';
import 'package:gc_intern_work/views/common_widgets/memo_item_widget.dart';
import 'package:intl/intl.dart';

class MemoTabWidget extends StatelessWidget {
  final String hospitalId;

  const MemoTabWidget({Key? key, required this.hospitalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(
              '거래처 관련자에 대한 내밀 또는 개인 정보 등 명예훼손 문제가 발생될 수 있으니 꼭! 유의하여 작성해 주세요!',
              style: AppTheme.textgreyColor15,
            ),
          ),

          // 메모 콘텐츠 부분
          Expanded(child: _MemoListSection(hospitalId: hospitalId)),
        ],
      ),
    );
  }
}

class _MemoListSection extends ConsumerWidget {
  final String hospitalId;

  const _MemoListSection({Key? key, required this.hospitalId})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 병원 아이디를 전송 후, 병원에 대한 메모 댓글 받아옴.
    final hospitalState = ref.watch(hospitalViewModelProvider(hospitalId));

    //  비동기 데이터 가정 하에 상태 구독.
    return hospitalState.when(
      data: (hospital) {
        // data로
        final viewModel = ref.read(
          hospitalViewModelProvider(hospitalId).notifier,
        );
        final detailList = viewModel.detailedComments; // 메모 + 직원정보 합쳐진 리스트

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "총 n개"
            Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 12),
              child: Row(
                children: [
                  Text('총 ${detailList.length}개', style: AppTheme.normalText16),
                ],
              ),
            ),

            // 메모 목록, 불러옴, Expanded를 써야 ListView 모든 공간을 차지하지 못하게 할 수 있음.
            Expanded(
              // 글이 많다는 가정 하에, AsyncValue 사용.
              child: ListView.separated(
                itemCount: detailList.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final detailItem = detailList[index];
                  // detailItem.comment, detailItem.employee 모두 포함
                  return MemoItemWidget(detail: detailItem);
                },
              ),
            ),
          ],
        );
      },
      //에러 처리.
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('에러: $err')),
    );
  }
}
