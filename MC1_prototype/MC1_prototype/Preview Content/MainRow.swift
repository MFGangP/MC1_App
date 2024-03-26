//
//  MainRow.swift
//  MC1_prototype
//
//  Created by lovehyun95 on 3/25/24.
//

import SwiftUI

struct MainRow: View{
    @Binding var krlocallist: KrLocalList
    
    var body: some View{
        HStack{
            Image(krlocallist.LocalImage)
                .resizable()
                .frame(width: 50, height: 50)
            Text(krlocallist.LocalName)
            Spacer()
        }
    }
}



