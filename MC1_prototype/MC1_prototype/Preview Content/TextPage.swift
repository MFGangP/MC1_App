//
//  TextPage.swift
//  MC1_prototype
//
//  Created by lovehyun95 on 3/26/24.
//

import SwiftUI

struct MainPage: View {
    
    // Sample image data
    let images = ["image1", "image2", "image3", "image4", "image5"]
    
    @State private var selectedImage: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(images, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                // Handle image selection
                                selectedImage = imageName
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("이미지 선택")
            .sheet(item: $selectedImage) { imageName in
                // Present a new view when an image is selected
                ImageDetail(imageName: imageName)
            }
        }
    }
}

struct ImageDetail: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationBarTitle(Text(imageName), displayMode: .inline)
    }
}


#Preview {
    TextPage()
}
