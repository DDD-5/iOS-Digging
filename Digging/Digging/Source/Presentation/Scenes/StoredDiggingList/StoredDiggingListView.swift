//
//  StoredDiggingListView.swift
//  Digging
//
//  Created by 황재욱 on 2021/04/07.
//

import SwiftUI

struct StoredDiggingListView: View {
  
  // MARK: - Properties
  
  @GestureState private var dragOffset = CGSize.zero

  @State var selection: Int = 0
  
  @State var showingSheet = false
  
  // MARK: - Layout
  
  var body: some View {
    VStack(alignment: .leading) {
      DiggingListNavigationBar()
      UpperTabBarView(selection: $selection, tabs: ["전체", "좋아요"])
      Button("Show Sheet") {
        showingSheet.toggle()
      }
      .sheet(isPresented: $showingSheet) {
        CreateDiggingView(viewModel: CreateDiggingViewModel(useCase: CreateDiggingUseCase(repository: CreateDiggingRepositoryImpl(networking: Networking(logger: [])))))
      }
      LazyVGrid(columns: [
        GridItem(.adaptive(minimum: 120, maximum: 160), spacing: 20)
      ], content: {
        DiggingGridCellView {
          
        }.frame(height: 160)
        
      })
      Spacer()
    }
    .navigationBarHidden(true)
  }
}

struct StoredDiggingListView_Previews: PreviewProvider {
  static var previews: some View {
    StoredDiggingListView()
  }
}


extension View {
  public func currentDeviceNavigationViewStyle() -> AnyView {
    if UIDevice.current.userInterfaceIdiom == .pad {
      return AnyView(self.navigationViewStyle(DefaultNavigationViewStyle()))
    } else {
      return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
    }
  }
}
