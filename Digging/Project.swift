//
//  Project.swift
//  Digging
//
//  Created by GisuHwang on 2021/04/05.
//
import ProjectDescription

let projectName = "Digging"
let organizationName = "Oreo"
let bundleID = "com.oreo.ddd.Digging"


// TODO: 엑스코드 프리뷰 이슈로 현재 선언만 한 상태입니다. 확인후 Project 생성자에 주입예정
let settings = Settings(configurations: [
	.debug(name: "Debug", xcconfig: "\(projectName)/SupportFiles/Config/Debug.xcconfig"),
	.release(name: "Release", xcconfig: "\(projectName)/SupportFiles/Config/Release.xcconfig")
])

// TODO: 엑스코드 프리뷰 이슈로 현재 선언만 한 상태입니다. 확인후 Project 생성자에 주입예정

let schems = [
			Scheme.init(name: projectName,
						shared: true,
						buildAction: BuildAction.init(targets: ["Digging"]),
						testAction: TestAction.init(targets: ["Digging"]),
						runAction: RunAction.init(configurationName: "Release",
												  arguments: nil)
			),
			Scheme.init(name: "DiggingTest",
						shared: true,
						buildAction: BuildAction.init(targets: ["Digging"]),
						testAction: TestAction.init(targets: ["Digging"]),
						runAction: RunAction.init(configurationName: "Debug",
												  arguments: nil)
			)
	]

let project = Project(
		name: projectName,
		organizationName: organizationName,
		targets: [
				Target(
						name: projectName,
						platform: .iOS,
						product: .app,
						bundleId: bundleID,
				        deploymentTarget: DeploymentTarget.iOS(
						  targetVersion: "13.0",
						  devices: [DeploymentDevice.iphone]
					    ),
						infoPlist: .file(path: "\(projectName)/Info.plist"),
						sources: [
								"\(projectName)/Core/**",
								"\(projectName)/Views/**"
						],
						resources: [
							"\(projectName)/SupportFiles/Resource/**"
						]
					
				)
		]

)
