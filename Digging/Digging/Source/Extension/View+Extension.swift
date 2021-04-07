//
//  View+Extension.swift
//  Digging
//
//  Created by Gisu Hwang on 2021/04/07.
//  Copyright © 2021 Oreo. All rights reserved.
//

import SwiftUI

// MARK: - View Extension
extension View {
	func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
		ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
	}
}
