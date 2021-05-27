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
        .padding(EdgeInsets(top: 0, leading: 4, bottom: 7, trailing: 0))
        .textContentType(.none)
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
  @State var tagText: String = ""
  @State var description: String = ""
  @State var text: String = ""
  @State var recommendedTagList = ["일반 개발", "웹 개발", "Javascript", "React", "Vue.js", "Angular", "Node.js"]
  @State var addedTagList: [String] = []
  
  @ObservedObject var viewModel: CreateDiggingViewModel
  
  // TODO: temp code for test
  init(viewModel: CreateDiggingViewModel) {
      UITextView.appearance().textContainerInset =
           UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 12)   // << !!
    self.viewModel = viewModel
  }
  
  var body: some View {
    ZStack {
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
              .modifier(DiggingFont(type: .medium, size: 14))
            Spacer()
          }
          .padding([.leading, .trailing], 20)
          HStack {
            TextField(LocalizedStringKey("추천 태그를 선택하거나, 직접 입력해주세요."), text: $tagText)
              .frame(width: 274, height: 44)
              .overlay(
                RoundedRectangle(cornerRadius: 8)
                  .stroke(
                    Color.grayBorder,
                    lineWidth: 1
                  )
              )
              .padding(.trailing, 8)
            
            Button(action: {
              if !addedTagList.contains(tagText) {
                addedTagList.append(tagText)
              }
            }, label: {
              Text("입력")
                .modifier(
                  DiggingFont(
                    type: .regular,
                    size: 14
                  )
                )
                .foregroundColor(.darkGray)
            })
            .frame(
              width: 53,
              height: 44
            )
            .background(Color.diggingYellow)
            .cornerRadius(8)
          }
          .padding(
            [.leading, .trailing],
            20
          )
        }
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
        .padding()
        
        Divider()
          .foregroundColor(.grayBorder)
          .padding([.leading, .trailing], 20)
        
        FlowLayout(mode: .scrollable,
                                   binding: .constant(5),
                                   items: $addedTagList) {
          Text($0)
            .foregroundColor(.white)
            .modifier(DiggingFont(type: .medium, size: 14))
            .padding([.leading, .trailing], 14)
            .padding([.top, .bottom], 10)
            .background(Color.tagFillColor.cornerRadius(18))
        }
        .padding()
      }
    }
    Button(action: {}, label: {
      Text("작성 완료😀")
        .modifier(
          DiggingFont(
            type: .bold,
            size: 16
          )
        )
        .foregroundColor(.darkGray)
    })
    .frame(minWidth: 0, idealWidth: 335, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 60, maxHeight: 60)
    .background(Color.diggingYellow)
    .cornerRadius(8)
    .padding(
      [.leading, .trailing],
      20
    )
    .padding(.bottom, 50)
  }
}

struct CreateDigging_Previews: PreviewProvider {
  
  static var previews: some View {
    CreateDiggingView(viewModel: CreateDiggingViewModel(useCase: CreateDiggingUseCase(repository: CreateDiggingRepositoryImpl(networking: Networking(logger: [])))))
  }
}

