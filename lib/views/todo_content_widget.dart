import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gc_intern_work/theme/app_palette.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/views/dialog_widgets/alert_modify_widget.dart';
import 'package:gc_intern_work/views/memo.dart';

class TodoContentWidget extends StatelessWidget {
  final String hospitalId;

  const TodoContentWidget({Key? key, required this.hospitalId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 부모 위젯에서 병원 정보 watch (병원명, 주소 표시용)
    return Consumer(
      builder: (context, ref, child) {
        // 병원 정보를 state로 받아서 화면 구성

        return DefaultTabController(
          length: 2, // 메모 / 일정 탭
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
                  const SizedBox(width: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "단아치과의원단아치과의원아인이이",
                        style: AppTheme.boldText20,
                        overflow: TextOverflow.ellipsis, // 넘치면 '...'으로 표시
                        maxLines: 1, // 한 줄로 제한 (필요시 2~3줄로 변경 가능)
                      ),
                      Text("서울 구로구 구로1동", style: AppTheme.greyText14),
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                // 탭 바
                const TabBar(tabs: [Tab(text: '메모'), Tab(text: '일정')]),
                // 탭에 해당하는 뷰
                Expanded(
                  child: TabBarView(
                    children: [
                      // 메모 탭 (자식 위젯; 스스로 병원 데이터 watch)
                      // MemoTabWidget(hospitalId: hospitalId),
                      ReMemoItemWidget(),
                      // 일정 탭 (예시)
                      const Center(child: Text('일정 탭 내용')),
                    ],
                  ),
                ),
              ],
            ),
            // 메모 작성하기 버튼
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AlertModifyWidget();
                  },
                );
              },
              label: Text('메모 작성하기', style: AppTheme.fabTextStyle),
            ),
          ),
        );
      },
    );
  }
}
