//
//  DeviceStyleEnvironment.swift
//  DeviceInfo
//
//  Created by Holger Krupp on 19.04.25.
//

import SwiftUI

private struct DeviceStyleKey: @preconcurrency EnvironmentKey {
    @MainActor static let defaultValue: DeviceUIStyle = .iphoneHomeButton
}

public extension EnvironmentValues {
    var deviceUIStyle: DeviceUIStyle {
        get { self[DeviceStyleKey.self] }
        set { self[DeviceStyleKey.self] = newValue }
    }
}
