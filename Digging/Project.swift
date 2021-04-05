//
//  Project.swift
//  Digging
//
//  Created by GisuHwang on 2021/04/05.
//

import ProjectDescription

let project = Project(
		name: "Digging",
		targets: [
				Target(
						name: "Digging",
						platform: .iOS,
						product: .app,
						bundleId: "com.oreo.ddd.Digging",
						infoPlist: .file(path: "Digging/Info.plist"),
						sources: [
								"Digging/Core/**",
								"Digging/Views/**"
						],
						resources: [
							"Digging/SupportFiles/**"
						]
				)
		]
)
