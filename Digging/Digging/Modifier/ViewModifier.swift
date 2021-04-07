//
//  ViewModifier.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/04/07.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

struct CornerRadiusStyle: ViewModifier {
	var radius: CGFloat
	var corners: UIRectCorner

	struct CornerRadiusShape: Shape {

		var radius = CGFloat.infinity
		var corners = UIRectCorner.allCorners

		func path(in rect: CGRect) -> Path {
			let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
			return Path(path.cgPath)
		}
	}

	func body(content: Content) -> some View {
		content
			.clipShape(CornerRadiusShape(radius: radius, corners: corners))
	}
}
