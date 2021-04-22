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

struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool)->() = { _ in }
  var commit: ()->() = { }
  
  var body: some View {
    ZStack(alignment: .leading) {
      TextEditor(text: $text)
      if text.isEmpty { placeholder }
    }
  }
}

struct CreateDiggingView: View {
  @State var title: String = ""
  @State var description: String = ""
  @State var text: String = ""
  
  // TODO: temp code for test
  init() {
      UITextView.appearance().textContainerInset =
           UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 12)   // << !!
  }
  
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
        
        VStack {
          HStack {
            Text("제목")
              .font(.custom("AppleSDGothicNeo-Medium", size: 14)
              )
            Spacer()
            Text("0/10")
              .font(.custom("AppleSDGothicNeo-Regular", size: 13)
              )
          }
          
          TextField(LocalizedStringKey("  10자 이내로 제목을 입력해주세요."), text: $title)
            .frame(height: 44)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .stroke(Color.grayBorder, lineWidth: 1)
            )
        }
        .padding([.leading, .trailing], 20)
        
        
        HStack {
          Text("내용")
            .font(.custom("AppleSDGothicNeo-Medium", size: 14)
            )
          Spacer()
          Text("0/200")
            .font(.custom("AppleSDGothicNeo-Regular", size: 13)
            )
        }
        .padding([.leading, .trailing], 20)
        TextArea("10자 이내로 제목을 입력해주세요.", text: $text)
          .frame(height: 143.9)
          .overlay(
            RoundedRectangle(cornerRadius: 8)
              .stroke(Color(red: 229 / 255, green: 229 / 255, blue: 229 / 255), lineWidth: 1)
          )
          .padding([.leading, .trailing], 20)
        HStack {
          Text("태그")
          Spacer()
        }
        HStack {
          TextField(LocalizedStringKey("test"), text: $title)
          Button(action: {}, label: {
            Text("입력")
          }).background(Color.blue)
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

