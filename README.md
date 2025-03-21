### 과제 내용.

1. **로컬** **데이터베이스**를 활용하여 데이터를 저장 및 관리할 수 있도록 구현해 주세요.
2. **메모** **및** **댓글**은 **최신** **순**으로 **정렬**해 주세요.
3. **메모** **탭**에는 CRUD **기능**을 적용해 주세요.

병원명, 주소, 지점명은 **하드코딩** 해주셔도 됩니다.

일정 탭은 **빈** **페이지**로 노출해 주세요.

## **🛠️ 사용 기술 (Tech Stack)**

**MVVM (Model - View - ViewModel)**

**역할 분리**를 통해 유지보수성과 테스트 용이성 향상

UI(View)와 비즈니스 로직(ViewModel), 데이터(Model)를 명확히 구분

**Riverpod**

**상태관리**를 위한 프레임워크

어노테이션 기반 @riverpod을 활용하여 ViewModel의 상태를 효율적으로 관리

View에서 상태를 **구독(subscribe)** 하여 자동으로 반응

**freezed**

데이터 모델을 정의할 때 **불변성**과 **패턴 매칭**을 간결하게 표현

copyWith, fromJson, toJson 등의 기능을 자동 생성

**hive**

**로컬 NoSQL 데이터베이스**

직렬화된 JSON 문자열을 기반으로 데이터를 저장 및 불러오는 방식 사용

### **🎨 테마 구성 (Theme)**

**app_palette.dart**

제시된 **피그마 디자인**에서 사용된 색상들을 정의

앱 전반에서 일관된 색상 사용을 위해 활용

**app_theme.dart**

앱의 전반적인 **테마 스타일** 정의

텍스트 스타일, 탭바, 다이얼로그 등 **UI 전반의 일관성 유지**

## ViewModel

**📌 ViewModel 구성 요약**

- **상태관리**: Riverpod의 어노테이션 기반 상태관리를 활용
  **동작 방식**: View 단에서는 ViewModel을 구독(subscribe)하여 상태 변화에 반응함
  **데이터 로딩**: build() 시점에 Repository를 통해 Hive에 저장된 데이터를 불러옴

---

**📝 메모 기능 (Memo)**

- addMemo() : 메모 추가
  updateMemo() : 메모 수정
  deleteMemo() : 메모 삭제

---

**💬 댓글 기능 (Reply)**

- addReply() : 댓글 추가
  updateReply() : 댓글 수정
  deleteReply() : 댓글 삭제

---

### **📦 MemoRepository 개요**

- **🛠 주요 기능**
  init() : Hive를 초기화하고, 'memo_box'라는 이름의 박스를 열어 준비함
  getMemos() : 데이터 불러오기
  - 각 메모의 **답글은 최신 순으로 정렬**
  - 전체 메모도 **최신 수정일 기준으로 정렬**

---

**메모 추가 :** 새로운 메모를 JSON 문자열로 인코딩하여 저장

**메모 수정 :** updateMemo(Memo memo), 메모 ID를 키로 하여 기존 메모를 덮어씀

**메모 삭제 :**deleteMemo(String id), 해당 ID의 메모를 박스에서 삭제

---
