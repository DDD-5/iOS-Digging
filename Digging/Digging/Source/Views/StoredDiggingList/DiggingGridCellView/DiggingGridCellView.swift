//
//  DiggingGridCellView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI


// MARK: List row extensions

extension View {
    
    func hideListRowSeparator() -> some View {
        return customListRowSeparator(insets: .init(), insetsColor: .clear)
    }
    
    func customListRowSeparator(
        insets: EdgeInsets,
        insetsColor: Color) -> some View {
        modifier(HideRowSeparatorModifier(insets: insets,
                                          background: insetsColor
        )) .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
        }
    }
}

// MARK: ViewModifier

private struct HideRowSeparatorModifier: ViewModifier {
        
    var insets: EdgeInsets
    var background: Color
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}

struct DiggingGridCellView: View {
  var likeButtonView: Image {
    return Image.init(systemName: "")
  }
  
  var body: some View {
    
    GeometryReader { geometry in
      ZStack {
        Color(red: 246/255, green: 246/255, blue: 246/255)
          .cornerRadius(10)
        Image.init(systemName: "suit.heart.fill")
          .foregroundColor(.red)
          .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topTrailing)
          .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 8))
      }
    }
  }
}

struct DiggingGridCellView_Previews: PreviewProvider {
  static var previews: some View {
    DiggingGridCellView()
  }
}
