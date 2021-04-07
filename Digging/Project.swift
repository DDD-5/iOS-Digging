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



let project = Project(
		name: projectName,
		organizationName: organizationName,
		settings: Settings(configurations: [
			.debug(name: "Debug", xcconfig: "\(projectName)/SupportFiles/Config/Debug.xcconfig"),
			.release(name: "Release", xcconfig: "\(projectName)/SupportFiles/Config/Release.xcconfig"),
		]),
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
							"\(projectName)/SupportFiles/Resource**"
						]
					
				)
		],
		schemes: [
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

)

