//
//  MainPage.swift
//  MC1_prototype
//
//  Created by lovehyun95 on 3/23/24.
//

import SwiftUI

struct ContentView: View {
    //구조체 선언
    struct Photo{
        let photoname: String
        let cityname: String
    }
    // 게시물 구조체 선언
    struct Post{
        let writerArea : String
        let writerName : String
        let postNum : Int
        let postTitle : String
        let postMainText : String
        let postTime : Date
        let postHash : String
    }
    // 국내 사진 및 지역이름 리스트
    @State private var photoList: [Photo] = [
        .init(photoname: "seoulcity", cityname: "SEOUL"),
        .init(photoname: "busancity", cityname: "BUSAN"),
        .init(photoname: "daejeoncity", cityname: "DAEJEON"),
        .init(photoname: "daegucity.jpeg", cityname: "DAEGU"),
        .init(photoname: "ulsancity", cityname: "ULSAN"),
        .init(photoname: "Incheoncity", cityname: "INCHEON"),
    ]
    // 해외 사진 및 지역이름 리스트
    @State private var overseaphotoList: [Photo] = [
        .init(photoname: "americacity", cityname: "AMERICA"),
        .init(photoname: "canadacity", cityname: "CANADA"),
        .init(photoname: "englandcity", cityname: "ENGLAND"),
        .init(photoname: "francecity", cityname: "FRANCE"),
        .init(photoname: "germancity", cityname: "GERMAN"),
        .init(photoname: "japancity", cityname: "JAPAN"),
        .init(photoname: "chinacity", cityname: "CHINA"),
    ]
    // 게시글 리스트
    @State private var postlist: [Post] = [
        .init(writerArea: "국내", writerName: "갱", postNum: 0, postTitle: "부산역 밥 친구 구합니다", postMainText: "부산역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#부산 #부산역 #스시"),
        .init(writerArea: "국내", writerName: "갱", postNum: 1, postTitle: "양산역 밥 친구 구합니다", postMainText: "양산역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#양산 #양산역 #스시"),
        .init(writerArea: "국내", writerName: "갱", postNum: 2, postTitle: "화정역 밥 친구 구합니다", postMainText: "화정역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#김해 #화정역 #스시"),
        .init(writerArea: "국내", writerName: "갱", postNum: 3, postTitle: "물금역 밥 친구 구합니다", postMainText: "물금역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#양산 #물금역 #스시"),
        .init(writerArea: "국내", writerName: "갱", postNum: 4, postTitle: "동래역 밥 친구 구합니다", postMainText: "동래역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#부산 #동래역 #스시")
    ]
    @State private var overseapostlist: [Post] = [
        .init(writerArea: "해외", writerName: "갱", postNum: 0, postTitle: "시부야 밥 친구 구합니다", postMainText: "시부야역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#도쿄 #시부야 #스시"),
        .init(writerArea: "해외", writerName: "갱", postNum: 1, postTitle: "오다이바 밥 친구 구합니다", postMainText: "오다이바역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#도쿄 #오다이바 #스시"),
        .init(writerArea: "해외", writerName: "갱", postNum: 2, postTitle: "하라주쿠 밥 친구 구합니다", postMainText: "하라주쿠역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#도쿄 #하라주쿠 #스시"),
        .init(writerArea: "해외", writerName: "갱", postNum: 3, postTitle: "오사카 밥 친구 구합니다", postMainText: "오사카역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#오사카 #오사카역 #스시"),
        .init(writerArea: "해외", writerName: "갱", postNum: 4, postTitle: "아키하바라 밥 친구 구합니다", postMainText: "아키하바라역에서 스시 같이 드실 분 구합니다", postTime: Date(), postHash: "#도쿄 #아키하바라 #스시")
    ]
    
    // 홈 화면이 먼저 뜨게하기 위한 변수
    @State private var selection = 0
    // 게시글 3개만 뽑아내기 위한 변수
    @State private var postselection = 0
    
    var body: some View {
        // 탭 뷰로 전체 화면을 꾸밈
        TabView(selection: $selection){
            // 수직으로 화면 설정
            VStack(alignment: .leading) {
                // 탭 이름은 상단에 고정
                Text("국내")
                    .font(.largeTitle)
                    .padding()
                // 스크롤 뷰를 통해 원하는 나라를 나열
                ScrollView {
                    // 반복문 돌면서 이미지를 두장씩 생성하고 다음 VStack으로 넘어가야됌
                    // 지금은 +1 을 못해주니까 같은 화면 두장 나오고 넘어가버림
                    // 일단 한 장씩 나열하고 다음에 방법을 찾으면 두장이나 여러장으로 나눌 예정
                    ForEach(photoList, id: \.photoname) { photo in
                        VStack{
                            // 지금 방법으로는 HStack이 의미가 없지만 나중을 위해서 남겨둠
                            HStack{
                                Button(){
                                    
                                }label: {
                                    // ZStack을 사용해서 이미지랑 텍스트를 분리하고 각자 설정이 가능하게 수정함
                                    ZStack{
                                        Image(photo.photoname)
                                            .resizable() // 이미지 비율 조절
                                            .frame(width: 350, height: 160) // 이미지 프레임 크기
                                            .cornerRadius(20) // 이미지 곡률
                                        Text(photo.cityname)
                                            .font(.system(size: 40)) // 폰트 크기 조금 더 줄이기
                                            .fontWeight(.semibold) // 글자 굵기
                                            .foregroundColor(Color.white) // 글자 색
                                            .padding(50) // 택스트 사이 여유 공간
                                    }
                                    
                                }
                            }
                            
                        }// Hstack 끝 지점
                    }// Vstack 끝 지점
                }//ForEach 끝 지점
            }
            .tabItem {
                Image(systemName: "fork.knife")
                    .resizable()
                Text("국내")
            }
            VStack(alignment: .leading) {
                Text("해외")
                    .font(.largeTitle)
                    .padding()
                ScrollView {
                    // 반복문 돌면서 이미지를 두장씩 생성하고 다음 VStack으로 넘어가야됌
                    // 지금은 +1 을 못해주니까 같은 화면 두장 나오고 넘어가버림
                    // 일단 한 장씩 나열하고 다음에 방법을 찾으면 두장이나 여러장으로 나눌 예정
                    ForEach(overseaphotoList, id: \.photoname) { photo in
                        VStack{
                            HStack{
                                Button(){
                                    
                                }label: {
                                    ZStack{
                                        Image(photo.photoname)
                                            .resizable() // 이미지 비율 조절
                                            .frame(width: 350, height: 160) // 이미지 프레임 크기
                                            .cornerRadius(20) // 이미지 곡률
                                        Text(photo.cityname)
                                            .font(.system(size: 40)) // 폰트 크기 조금 더 줄이기
                                            .fontWeight(.semibold) // 글자 굵기
                                            .foregroundColor(Color.white) // 글자 색
                                            .padding(50) // 택스트 사이 여유 공간
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "globe")
                    .resizable()
                Text("해외")
            }
            VStack {
                Text("홈")
                    .font(.largeTitle)
                    .padding()
                ScrollView {
                    VStack{
                        Button(){
                            
                        }label: {
                            ZStack{
                                Image("map")
                                    .frame(width: 350, height: 70) // 이미지 프레임 크기
                                    .cornerRadius(10) // 이미지 곡률
                                    .opacity(0.80)
                                //                            Image(systemName: "scope")
                                //                                .frame(width: 60, height: 60) // 이미지 프레임 크기
                                //                                .padding(.bottom)
                                Text("내 주변 탐색")
                                    .font(.system(size: 40))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.white)
                            }
                        }
                            ZStack{
                                Image("")
                                    .frame(width: 350, height: 200) // 이미지 프레임 크기
                                    .background(.gray)
                                    .cornerRadius(10) // 이미지 곡률
                                    .opacity(0.1)
                                VStack{
                                    Text("국내 게시판")
                                        .frame(width: 350, height: 40) // 이미지 프레임 크기
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.black)
                                        .padding(.trailing, 220)
                                    ForEach(0..<min(3, postlist.count), id: \.self) { index in
                                        // 리스트에 직접 reversed()를 붙여야 역순으로 불러옴
                                        let post = postlist.reversed()[index]
                                        Button {
                                            
                                        } label: {
                                            ZStack {
                                                Image("")
                                                    .frame(width: 350, height: 40) // 이미지 프레임 크기
                                                    .background(Color.gray.opacity(0.05))
                                                Text(post.postTitle)
                                                    .foregroundColor(.mint)
                                        }
                                    }
                                }
                            }
                        }
                        ZStack{
                            Image("")
                                .frame(width: 350, height: 200) // 이미지 프레임 크기
                                .background(.gray)
                                .cornerRadius(10) // 이미지 곡률
                                .opacity(0.1)
                            VStack{
                                Text("해외 게시판")
                                    .frame(width: 350, height: 40) // 이미지 프레임 크기
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 220)
                                // ForEach 돌면서 리스트
                                // 복잡하게 생각 할 필요 없이 아래에서 정의 해주면 간단함.
                                
                                ForEach(0..<min(3, overseapostlist.count), id: \.self) { index in
                                    // 리스트에 직접 reversed()를 붙여야 역순으로 불러옴
                                    let post = overseapostlist.reversed()[index]
                                    Button {
                                        
                                    } label: {
                                        ZStack {
                                            Image("")
                                                .frame(width: 350, height: 40) // 이미지 프레임 크기
                                                .background(Color.gray.opacity(0.05))
                                            Text(post.postTitle)
                                                .foregroundColor(.teal)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                    .resizable()
                Text("홈")
            }.tag(0)
            VStack {
                Text("채팅")
                    .font(.largeTitle)
                    .padding()
                ScrollView {
                    
                }
            }
            .tabItem {
                Image(systemName: "ellipsis.message.fill")  .resizable()
                Text("채팅")
            }
            VStack {
                Text("프로필")
                    .font(.largeTitle)
                    .padding()
                ScrollView {
                    
                }
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                Text("프로필")
            }
        }
    }
}


#Preview(){
    ContentView()
}
