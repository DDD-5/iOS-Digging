//
//  CreateDiggingView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/11.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

// TODO: Temp code for test
extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}

// TODO: Temp code for test
struct TextArea: View {
  private let placeholder: String
  @Binding var text: String
  
  init(_ placeholder: String, text: Binding<String>) {
    self.placeholder = placeholder
    self._text = text
  }
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      TextEditor(text: $text)
        .foregroundColor(Color.primary.opacity(0.25))
        .padding(EdgeInsets(top: 0, leading: 4, bottom: 7, trailing: 0)).textContentType(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
      if text.isEmpty {
        Text(placeholder)
          .foregroundColor(Color(UIColor.placeholderText)).padding(.horizontal, 16)
          .padding(.vertical, 12.1)
      }
    }
  }
}
struct CreateDiggingView: View {
  @State var title: String = ""
  
  var body: some View {
    ScrollView {
      VStack {
        HStack {
          Spacer()
          Button(action: {}, label: {
            Image("close_icon_img").frame(width: 24, height: 24, alignment: .topTrailing)
          })
        }
        .padding([.top, .trailing], 20)
        
        HStack {
          Image("digging_text_folder_small_img")
          Text("텍스트")
          Spacer()
        }
        .padding([.leading], 20)
        
        HStack {
          Text("제목")
          Spacer()
          Text("0/10")
        }
        TextField(LocalizedStringKey("10자 이내로 제목을 입력해주세요."), text: $title)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .border(Color(red: 229 / 255, green: 229 / 255, blue: 229 / 255), width: 1)
        
        HStack {
          Text("내용")
          Spacer()
          Text("0/200")
        }
        
        TextEditor(text: .constant("Placeholder"))
        Text("태그")
        HStack {
          TextField(LocalizedStringKey("test"), text: $title)
          Button(action: {}, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
          })
        }
      }
    }
  }
}

struct CreateDigging_Previews: PreviewProvider {
  static var previews: some View {
    CreateDiggingView()
  }
}

