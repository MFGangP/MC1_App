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
    
    @State private var selection = 0
    
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
                            //                                Button(){
                            //                                     
                            //                                }label: {
                            //                                    Image(photo.photoname)
                            //                                        .resizable() // 이미지 비율 조절
                            //                                        .frame(width: 160, height: 160) // 이미지 프레임 크기
                            //                                        .cornerRadius(20) // 이미지 곡률
                            //                                }
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
                    Button(){
                        
                    }label: {
                        ZStack{
                            Image("map")
                                .padding(.leading)
                                .frame(width: 350, height: 160) // 이미지 프레임 크기
                                .cornerRadius(20) // 이미지 곡률
                            Image(systemName: "scope")
                                .padding(.bottom)
                                .frame(width: 60, height: 60) // 이미지 프레임 크기
                            Text("주변 탐색")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(50)
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
