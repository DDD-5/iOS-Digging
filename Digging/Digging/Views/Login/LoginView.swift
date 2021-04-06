//
//  LoginView.swift
//  Digging
//
//  Created by GisuHwang on 2021/04/06.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct LoginView: View {
	var body: some View {
		
		ZStack {
			Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
			
			VStack {
				Spacer()
				
				VStack {
					
					HStack {
						Button(action: {
							print("Button Close")
							
						})
						{
							// TODO: 이미지 교체 예정
							Image("tabbar_search_digging")
								.resizable()
								.frame(width: 24, height: 24)
								.padding(
									EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
								)
						}
						Text("로그인 또는 회원 가입")
							.frame(maxWidth: .infinity, alignment: .leading)
							.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))
						
					}
					Divider()
					
					VStack(spacing: 20, content: {
						Text("디깅에서 나만의 영감을 디깅하고 싶다면,\n지금 간단하게 시작해보세요!")
							.multilineTextAlignment(.center)
							.font(Font.custom("AppleSDGothicNeo-Regular", size: 14))
						
						Button(action:{print("구글 로그인")}){
							
							Text("구글 로그인")
								.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))
								.foregroundColor(Color(red: 96 / 255, green: 96 / 255, blue: 96 / 255)
								)
								.padding()
								.background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
						}
						
						Button(action:{print("애플 로그인")}){
							
							Text("애플 로그인")
								.font(Font.custom("AppleSDGothicNeo-Bold", size: 16))
								.foregroundColor(Color.white)
								.padding()
								.background(Color.black)
								.cornerRadius(8)
						}
					})
					.padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
				
				}
				.frame(
					maxWidth: .infinity,
					maxHeight: 290,
					alignment: .topLeading
				)
				.background(Color.white)
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}

