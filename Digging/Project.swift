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
							"\(projectName)/SupportFiles/**"
						]
					
				)
		]
)
