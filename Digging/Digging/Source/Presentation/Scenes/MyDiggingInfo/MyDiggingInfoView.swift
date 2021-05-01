//
//  MyDiggingInfoView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/26.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct MyDiggingInfoView: View {
  
  // MARK: - Properties
  
  @StateObject var viewModel: MyDiggingInfoViewModel = MyDiggingInfoViewModel()
  
  // MARK: - UI Components
  
  var gridLayout = [
    GridItem(.adaptive(minimum: 40, maximum: 40), spacing: 15)
  ]
  
  // MARK: - SetupUI
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        HStack {
          Text("이름없음님의\n디깅 내역")
            .modifier(
              DiggingFont(
                type: .bold,
                size: 28
              )
            )
          Image("")
        }
        .padding([.leading, .trailing], 20)
        HStack {
          Image("left_calendar_arrow_img")
          Spacer()
          Text("2021.03").modifier(
            DiggingFont(
              type: .medium,
              size: 18
            )
          )
          Spacer()
          Image("right_calendar_arrow_img")
        }
        .padding([.leading, .trailing], 20)
        .padding(.bottom, 22)
        HStack(alignment: .center) {
          ForEach(
            viewModel.dayNameAlphabetArray,
            id: \.self
          ) {
            CalendarDayNameView(dayName: $0)
              .frame(maxWidth: .infinity)
          }
        }.padding(.bottom, 16)
        LazyVGrid(columns: gridLayout, content: {
          ForEach(viewModel.dateInfoArray, id: \.id) {
            CalendarDateInfoView(dateInfo: $0)
              .padding(.bottom, 7)
          }
        })
        Rectangle()
          .foregroundColor(.grayBorder)
          .frame(
            height: 1,
            alignment: .center
          )
          .padding(
            [.top, .leading, .trailing],
            20
          )
        Text("2일 (월)")
          .foregroundColor(.cardDarkGray)
          .modifier(
            DiggingFont(type: .bold, size: 16)
          )
          .padding([.leading], 20)
          .padding([.top], 18)
          .padding([.top], 16)
        DiggingRectangleCardView().padding([.leading, .trailing], 20)
      }
      .padding(.top, 40)
      .navigationBarHidden(true)
      .frame(
        minWidth: 0,
        maxWidth: .infinity,
        minHeight: 0,
        maxHeight: .infinity,
        alignment: .topLeading
      )
    }
  }
}

struct MyDiggingInfoView_Previews: PreviewProvider {
  static var previews: some View {
    MyDiggingInfoView()
  }
}
