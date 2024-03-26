import SwiftUI

// LoginPage 뷰 정의
struct LoginPage: View {
    // 아이디와 비밀번호를 저장하는 상태 속성 정의
    @State private var loginId = ""
    @State private var loginPw = ""
    // 키보드 높이를 저장하는 상태 속성 정의
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            // 화면 상단의 공간 확보
            Spacer()
            VStack{
                // "로그인" 텍스트 표시
                Text("로그인")
                    .font(Font.custom("Inter", size: 48).weight(.heavy)) // 폰트 설정
                    .foregroundColor(Color(red: 0.56, green: 0.55, blue: 1)) // 글자색 설정
            }
            // 로그인 입력 폼과 버튼을 감싸는 VStack
            Spacer()
                .frame(height: 230) // 공간 확보
            VStack(alignment: .leading){
                // "아이디" 텍스트 표시
                Text("아이디")
                    .font(Font.custom("Inter", size: 16).weight(.semibold)) // 폰트 설정
                    .foregroundColor(Color(red: 0.56, green: 0.55, blue: 1)) // 글자색 설정
                    .padding(.leading, 30) // 왼쪽 여백 추가
                // 아이디 입력 필드
                HStack{
                    TextField("아이디를 입력해주세요.", text: $loginId)
                        .background(Color(red: 175, green: 175, blue: 175)) // 배경색 설정
                        .textFieldStyle(.roundedBorder) // 테두리 모양 설정
                        .padding(.leading, 30) // 왼쪽 여백 추가
                        .padding(.trailing, 30) // 오른쪽 여백 추가
                }
            }
            VStack(alignment: .leading){
                // "비밀번호" 텍스트 표시
                Text("비밀번호")
                    .font(Font.custom("Inter", size: 16).weight(.semibold)) // 폰트 설정
                    .foregroundColor(Color(red: 0.56, green: 0.55, blue: 1)) // 글자색 설정
                    .padding(.leading, 30) // 왼쪽 여백 추가
                // 비밀번호 입력 필드
                HStack{
                    SecureField("비밀번호를 입력해주세요.", text: $loginPw)
                        .background(Color(red: 175, green: 175, blue: 175)) // 배경색 설정
                        .textFieldStyle(.roundedBorder) // 테두리 모양 설정
                        .padding(.leading, 30) // 왼쪽 여백 추가
                        .padding(.trailing, 30) // 오른쪽 여백 추가
                }
            }
            VStack{
                // 로그인 버튼
                Button(action: {
                    // 버튼 클릭 이벤트
                }) {
                    RoundedRectangle(cornerRadius: 10) // 둥근 모양의 사각형
                        .fill(Color(red: 0.56, green: 0.55, blue: 1)) // 배경색 설정
                        .frame(width: 335, height: 45) // 크기 설정
                        .overlay(
                            Text("로그인") // 버튼 텍스트
                                .foregroundColor(.white) // 글자색 설정
                                .font(.headline) // 폰트 설정
                        )
                }
            }
            // 화면 하단의 공간 확보
            Spacer()
        }
        // 여기부터는 블로그 보고 가져다 붙인 부분 내가 한 부분이 아니라서 이해가 필요함
        // 키보드가 나타날 때 화면을 밀어올리기 위한 설정
        .padding(.bottom, keyboardHeight) // 키보드가 나타날 때만 아래쪽에 패딩 추가
        .edgesIgnoringSafeArea(.bottom) // 키보드가 나타날 때 컨텐츠를 키보드 위로 밀도록 설정
        // 키보드 이벤트 수신하여 키보드 높이 업데이트
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            if let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                withAnimation {
                    self.keyboardHeight = keyboardSize.height
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            withAnimation {
                self.keyboardHeight = 0
            }
        }
    }
}

// LoginPage의 미리보기
struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
