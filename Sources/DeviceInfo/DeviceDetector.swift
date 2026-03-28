//
//  DeviceDetector.swift
//  DeviceInfo
//
//  Created by Holger Krupp on 19.04.25.
//

import SwiftUI
@MainActor
public struct DeviceDetector {
    public static func currentDeviceStyle(safeAreaTopInset: CGFloat?) -> DeviceUIStyle {
        #if os(macOS)
        return detectMacStyle()
        #elseif os(watchOS)
        return .appleWatch
        #elseif os(visionOS)
        return .visionPro
        #elseif targetEnvironment(macCatalyst)
        return .macLaptop
        #else
        let inset = safeAreaTopInset ?? 0
        let idiom = UIDevice.current.userInterfaceIdiom

        if idiom == .pad {
            return inset <= 20 ? .ipadHomeButton : .ipadNoHomeButton
        } else {
            if inset >= 59 {
                return .iphoneDynamicIsland
            } else if inset > 20 {
                return .iphoneNotch
            } else {
                return .iphoneHomeButton
            }
        }
        #endif
    }

    #if os(macOS)
    private static func detectMacStyle() -> DeviceUIStyle {
        var size: Int = 0
        sysctlbyname("hw.model", nil, &size, nil, 0)
        var model = [CChar](repeating: 0, count: size)
        sysctlbyname("hw.model", &model, &size, nil, 0)
        let identifier = String(
            decoding: model.prefix { $0 != 0 }.map { UInt8(bitPattern: $0) },
            as: UTF8.self
        )

        if identifier.contains("MacBook") {
            return .macLaptop
        } else if identifier.contains("Macmini") {
            return .macMini
        } else if identifier.contains("MacPro") {
            return .macPro
        } else {
            return .macDesktop
        }
    }
    #endif
}
