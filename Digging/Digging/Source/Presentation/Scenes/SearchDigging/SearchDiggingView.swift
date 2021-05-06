//
//  SearchDiggingView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/05.
//

import SwiftUI

struct SearchDiggingView: View {
  @State var searchedText: String = ""
  @State var recommendedTagList = ["일반 개발", "웹 개발", "Javascript", "React", "Vue.js", "Angular", "Node.js"]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("검색")
        .modifier(
          DiggingFont(
            type: .bold,
            size: 28
          )
        )
      
      TextField(LocalizedStringKey("  내가 디깅한 아이디어 찾아보기"), text: $searchedText)
        .frame(height: 44)
        .background(Color.textFieldGray.cornerRadius(8))
      
      Text("💡 내가 보유한 태그")
        .modifier(
          DiggingFont(
            type: .bold,
            size: 16
          )
        )
        .padding()
      
      FlowLayout(mode: .scrollable,
                                 binding: .constant(5),
                                 items: $recommendedTagList) {
        Text($0)
          .modifier(DiggingFont(type: .medium, size: 14))
          .padding([.leading, .trailing], 14)
          .padding([.top, .bottom], 10)
          .overlay(
            RoundedRectangle(cornerRadius: 18)
              .stroke(
                Color.tagBorder,
                lineWidth: 1
              )
          )
      }
      Spacer()
      Spacer()
    }.frame(height: UIScreen.main.bounds.height)
    .padding([.leading, .trailing], 20)
  }
}

struct SearchDiggingView_Previews: PreviewProvider {
  static var previews: some View {
    SearchDiggingView()
  }
}
