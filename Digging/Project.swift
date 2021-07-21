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


let bottomSheetDependancy = Package.package(url: "https://github.com/weitieda/bottom-sheet", from: "1.0.0")

let lottieDependancy = Package.package(url: "https://github.com/airbnb/lottie-ios", from: "3.2.3")

let targetAction = [
  
	TargetAction.pre(path: "Scripts/RSwiftRunScript.sh",
					 arguments: [],
					 name: "R.Swift",
					 inputPaths: [Path.init("$TEMP_DIR/rswift-lastrun")],
					 inputFileListPaths: [],
					 outputPaths: [Path.init("$SRCROOT/\(projectName)/Source/Generated/R.generated.swift")],
					 outputFileListPaths: [])
]

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
		packages: [
			bottomSheetDependancy,
      lottieDependancy
		],
		targets: [
				Target(
						name: projectName,
						platform: .iOS,
						product: .app,
						bundleId: bundleID,
				        deploymentTarget: DeploymentTarget.iOS(
						  targetVersion: "14.0",
						  devices: [DeploymentDevice.iphone]
					    ),
						infoPlist: .file(path: "\(projectName)/SupportFiles/Info.plist"),
						sources: [
							"\(projectName)/Source/**"
						],
						resources: [
							"\(projectName)/SupportFiles/Resource/**",
							"\(projectName)/SupportFiles/Lottie/**"
						],
						entitlements: .relativeToManifest("\(projectName)/Digging.entitlements"),
						actions: targetAction,
						dependencies: [
              .package(product: "BottomSheet"),
              .package(product: "Lottie"),
							.cocoapods(path: "."),
							.target(name: "DiggingWidget")
						]
				),
      Target(name: "DiggingWidget",
             platform: .iOS,
             product: .appExtension,
             bundleId: "com.oreo.ddd.Digging.DiggingWidget",
						 infoPlist: .file(path: "DiggingWidget/SupportFiles/Info.plist"),
             sources: "DiggingWidget/Source/**",
						 resources: [
							"DiggingWidget/SupportFiles/Resource/**"
						 ],
             dependencies: [
							.sdk(name: "SwiftUI.framework"),
							.sdk(name: "WidgetKit.framework")
       ])
		]

)
