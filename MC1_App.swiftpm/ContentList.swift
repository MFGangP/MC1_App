import SwiftUI

struct Content {
    var conwriter : String
    var contime : Date
    var contitle : String
    var conmaintext : String
    var conhash : String
}

struct ContentList: View {
    @State private var con1 = Content(
        conwriter: "갱",
        contime: Date(),
        contitle: "도쿄 스시 투어 하실 분 구합니다",
        conmaintext: "도쿄 시부야 역",
        conhash: "#일본 #도쿄 #시부야 #스시"
    )
    
    var body: some View {
        VStack {
            // View 내에서 con1을 사용할 수 있음
        }
    }
}
