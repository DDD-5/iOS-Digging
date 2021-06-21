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
			Color.diggingYellow.edgesIgnoringSafeArea(.all)
			VStack {

				HStack {
					Button(action: {}, label: {
						Image("close_icon_img")
							.frame(width: 24, height: 24, alignment: .topTrailing)
							.padding(
								EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
							)
					})
					Spacer()
				}

				Image(R.image.login_digging.name)
					.resizable()
					.frame(width: 197, height: 155, alignment: .center)
					.padding([.top], 70)
				Spacer()


			}
		}


		
		}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}

