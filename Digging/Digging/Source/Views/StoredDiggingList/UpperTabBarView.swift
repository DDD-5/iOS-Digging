//
//  UpperTabBarView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/08.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

enum SelectedType {
  case total
  case liked
}

struct UpperTabBarView: View {
  @Binding var selection: SelectedType
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button(action: {
          
        }, label: {
          Text("전체")
            .font(.custom("AppleSDGothicNeo-Bold", size: 16)
            )
            .foregroundColor(.black)
        })
        Spacer()
        Spacer()
        Button(action: {
          
        }, label: {
          Text("좋아요")
            .font(.custom("AppleSDGothicNeo-Bold", size: 16)
            )
            .foregroundColor(.black)
        })
        Spacer()
      }
      HStack {
        Rectangle()
          .frame(height: 3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .padding()
        Spacer()
      }
    }.padding(.top, 20)
  }
}

struct UpperTabBarView_Previews: PreviewProvider {
  @State static var selection: SelectedType = .total
  static var previews: some View {
    UpperTabBarView(selection: $selection)
  }
}
