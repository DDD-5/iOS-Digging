//
//  CreateDiggingView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/11.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct CreateDiggingView: View {
  @State var title: String = ""
  
  var body: some View {
    GeometryReader { reader in
      ScrollView {
        VStack {
          Image("")
          HStack {
            
          }
          
          HStack {
            Text("제목")
            Text("0/10")
          }
          LazyVGrid(columns: [GridItem(.adaptive(minimum: 20))], content: {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            Text("일반 기획")
              .padding(.vertical, 10)
              .padding(.horizontal, 15).background(Capsule().stroke(Color.black, lineWidth: 1)).overlay(GeometryReader { reading in
                Text("\(reading.size.width)")
              })
          })
          TextField(LocalizedStringKey("test"), text: $title)
          GeometryReader { hstackReader in
            HStack(spacing: 0) {
              
              Text("일반 기획")
                .padding(.vertical, 10)
                .padding(.horizontal, 15).background(Capsule().stroke(Color.black, lineWidth: 1)).overlay(GeometryReader { reading in
                  Text("\(reading.size.width)")
                })
              Text("서비스 기획 \(hstackReader.size.width)")
                .overlay(GeometryReader { reading in
                  Text("\(reading.size.width)").foregroundColor(.red)
                })
              Text("전략 기획")
                .overlay(GeometryReader { reading in
                  Text("\(reading.size.width)").foregroundColor(.red)
                })
            }
          }
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

