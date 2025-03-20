import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/models/models.dart';
import 'package:gc_intern_work/services/provider_repository.dart';
import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/viewmodels/hospital_viewmodel.dart';
// 필요에 맞게 경로 조정

/* /// 간단 예시용 가짜 데이터 모델
class MemoItem {
  final String id;
  final String writer; // 예: "CE | 강서지점"
  final String content; // 예: "원장님 미팅, 다음번에 브로셔 가지고..."
  final String timeInfo; // 예: "30분전 (2024.07.18)"
  final List<MemoItem>? replies; // nullable로 변경

  MemoItem({
    required this.id,
    required this.writer,
    required this.content,
    required this.timeInfo,
    this.replies,
  });
} */

/* /// 가짜 Provider (실제 로직/데이터는 별도 StateNotifier 등을 구현)
final memoListProvider = Provider<List<MemoItem>>((ref) {
  return [
    MemoItem(
      id: '1',
      writer: 'CE | 강서지점',
      content: '원장님 미팅, 다음번에 브로셔 가지고 다시 한 번 미팅',
      timeInfo: '30분전 (2024.07.18)',
      replies: [
        MemoItem(
          id: '1-1',
          writer: 'CE | 답글작성자',
          content: '네, 다음번 미팅 일정 잡아보겠습니다!',
          timeInfo: '10분전 (2024.07.18)',
        ),
        MemoItem(
          id: '1-2',
          writer: 'CE | 다른 작성자',
          content: '브로셔 디자인도 확인 부탁드립니다.',
          timeInfo: '5분전 (2024.07.18)',
        ),
      ],
    ),
    MemoItem(
      id: '2',
      writer: 'CE | 강서지점',
      content: '원장님 미팅, 다음번에 브로셔 가지고 다시 한 번 미팅',
      timeInfo: '30분전 (2024.07.18)',
    ),
  ];
}); */

class TodoContentWidget extends ConsumerWidget {
  final String hospitalId;

  const TodoContentWidget({Key? key, required this.hospitalId})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 병원 전체 데이터를 가져옴 (AsyncValue<Hospital>)
    final hospitalState = ref.watch(hospitalViewModelProvider(hospitalId));

    return hospitalState.when(
      data: (hospital) {
        // 예) 모든 직원(Employee)의 memos를 하나로 합친 List<Comment>.
        //    혹은 hospital.employees.first.memos 로 특정 직원만 사용해도 됨.
        final allComments =
            hospital.employees.expand((employee) => employee.memos).toList();

        return DefaultTabController(
          length: 2, // "메모" / "일정"
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 24,
                    color: AppPalette.primaryColor,
                  ),
                  SizedBox(width: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 상호 명
                      Text(hospital.name, style: AppTheme.boldText20),
                      // 주소
                      Text(hospital.location, style: AppTheme.greyText14),
                    ],
                  ),
                ],
              ),
              centerTitle: false, // 필요 시 조정
            ),
            body: Column(
              children: [
                // 탭 바
                const TabBar(tabs: [Tab(text: '메모'), Tab(text: '일정')]),

                // 탭바에 해당하는 View
                Expanded(
                  child: TabBarView(
                    children: [
                      // 1) 메모 탭
                      _buildMemoTab(context, allComments),

                      // 2) 일정 탭 (예시)
                      const Center(child: Text('일정 탭 내용')),
                    ],
                  ),
                ),
              ],
            ),

            // 메모 작성하기 버튼
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                _showSimpleDialog(context, ref);
              },
              label: Text('메모 작성하기', style: AppTheme.fabTextStyle),
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('에러: $err')),
    );
  }

  /// 메모 탭 UI 빌드
  Widget _buildMemoTab(BuildContext context, List<Comment> commentList) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // 안내 문구
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

          // 총 n개
          Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 12),
            child: Row(
              children: [
                Text('총 ${commentList.length}개', style: AppTheme.boldText14),
              ],
            ),
          ),

          // 메모 목록
          Expanded(
            child: ListView.separated(
              itemCount: commentList.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = commentList[index];
                return _buildMemoItem(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 개별 메모 아이템
  Widget _buildMemoItem(BuildContext context, Comment item) {
    // 예: 작성자 / 시간 표시 부분을 임시로 item.id 사용.
    // 실제로는 Employee의 jobTitle, workplace, 혹은 editDate에서 계산한 시각 차를 표시할 수 있음.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 작성자 + 시간
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
                      // 작성자
                      Text(item.id, style: AppTheme.boldText14),
                      // 시간
                      Text('${item.editDate}', style: AppTheme.normalText14),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // 수정 로직 (예시)
                      // ref.read(hospitalViewModelProvider(hospitalId).notifier)
                      //   .updateComment(
                      //       employeeId: ...,
                      //       commentId: item.id,
                      //       newContent: '수정된 내용',
                      //   );
                    },
                    child: Text('수정', style: AppTheme.greyActionText),
                  ),
                  SizedBox(
                    height: 14,
                    width: 10, // Divider가 차지할 공간
                    child: VerticalDivider(
                      thickness: 1,
                      color: AppPalette.greyColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 삭제 로직 (예시)
                      // ref.read(hospitalViewModelProvider(hospitalId).notifier)
                      //   .deleteComment(
                      //       employeeId: ...,
                      //       commentId: item.id,
                      //   );
                    },
                    child: Text('삭제', style: AppTheme.greyActionText),
                  ),
                ],
              ),
            ],
          ),

          // 메모 내용
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              item.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          // 하단 액션 (답글 쓰기 등)
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // 실제 답글 쓰기 로직
                  // ref.read(hospitalViewModelProvider(hospitalId).notifier)
                  //   .addReply(
                  //       employeeId: ...,
                  //       parentCommentId: item.id,
                  //       content: '답글 내용',
                  //   );
                },
                child: Text('답글 쓰기', style: AppTheme.greyActionText),
              ),
            ],
          ),

          // 필요하다면 item.replies를 재귀 표시
        ],
      ),
    );
  }

  /// 메모 작성하기
  void _showSimpleDialog(BuildContext context, WidgetRef ref) {
    String newContent = '';

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('메모 작성하기'),
          content: TextField(
            onChanged: (value) {
              newContent = value;
            },
            decoration: const InputDecoration(hintText: '메모 내용을 입력하세요'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (newContent.isNotEmpty) {
                  // 실제 메모 추가 로직
                  // 여기서는 임의로 employees.first에 추가한다고 가정
                  // (프로젝트에 맞게 employeeId 지정)
                  ref
                      .read(hospitalViewModelProvider(hospitalId).notifier)
                      .addComment(
                        employeeId: 'employee_1',
                        content: newContent,
                      );
                }
                Navigator.pop(dialogContext); // 다이얼로그 닫기
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}
