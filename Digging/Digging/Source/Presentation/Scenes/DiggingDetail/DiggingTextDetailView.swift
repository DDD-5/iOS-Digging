//
//  DiggingTextDetailView.swift
//  Digging
//
//  Created by GisuHwang on 2021/05/20.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct DiggingTextDetailView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	
    var body: some View {
			ScrollView {
				VStack {
					
					DiggingDetailTitleView()
					
					DiggingDetailContentTextView()
					
					Divider()
						.padding([.leading, .trailing], 20)
					Spacer()
				}
				.navigationBarItems(
					leading:
						HStack {
							Button(action: {
								self.presentationMode.wrappedValue.dismiss()
							}) {
								Image("back_btn_img")
							}
							Image(R.image.digging_text_folder_img.name)
								.resizable()
								.frame(width: 24, height: 24, alignment: .center)
							
							Text("텍스트")
							
						},
					trailing:
						HStack {
							Button(action: {
								print("좋아요")
							}) {
								// TODO: 제플린 요청후 변경예정
								Image(R.image.digging_text_folder_img.name)
									.resizable()
									.frame(width: 24, height: 24, alignment: .center)
							}
							Button(action: {
								print("작성")
							}) {
								// TODO: 제플린 요청후 변경예정
								Image(R.image.digging_text_folder_img.name)
									.resizable()
									.frame(width: 24, height: 24, alignment: .center)
							}
							
							Button(action: {
								print("삭제")
							}) {
								// TODO: 제플린 요청후 변경예정
								Image(R.image.digging_text_folder_img.name)
									.resizable()
									.frame(width: 24, height: 24, alignment: .center)
							}
							
						})
						.navigationBarBackButtonHidden(true)
			}
		}
}

struct DiggingTextDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiggingTextDetailView()
    }
}


struct DiggingDetailTitleView: View {
	var body: some View {
		VStack {
			// Title Area
			Text("영감을 디깅하는 방법")
				.modifier(
					DiggingFont(type: .bold, size: 24)
				)
				.frame(maxWidth: .infinity, alignment: .topLeading)
				.padding(.leading, 20)
				.padding(.bottom, 8)
			
			// Date Area
			Text("2021.04.21")
				.modifier(
					DiggingFont(type: .regular, size: 13)
				)
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.leading, 20)
				.foregroundColor(.lightGray)
			
			
			
		}
	}
}
struct DiggingDetailTitleView_Previews: PreviewProvider {
		static var previews: some View {
			DiggingDetailTitleView()
		}
}

struct DiggingDetailContentTextView: View {
	var body: some View {
		
		
		Text("""
			요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에 디깅을 많이 보긴 하는데 실제로 사용해본 적은 없는것 같다. 요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에서 디깅을 많이 보긴 하는데 실제로 사용해본 적은 없는것 같다.요즘 디깅 한다는 말을 많이 사용한다. 나도 인스타그램에서 디깅을 많이 보긴 하는데 실제로 사용해본 적은 없는것 같다. 요즘 디
			""")
			.modifier(
				DiggingFont(type: .regular, size: 14)
			)
			.frame(maxWidth: .infinity, alignment: .topLeading)
			.foregroundColor(.darkGray)
			.padding()
		
	}
}
struct DiggingDetailContentTextView_Previews: PreviewProvider {
		static var previews: some View {
			DiggingDetailContentTextView()
		}
}
