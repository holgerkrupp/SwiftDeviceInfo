//
//  DeviceStyleModifier.swift
//  DeviceInfo
//
//  Created by Holger Krupp on 19.04.25.
//

import SwiftUI

public struct DeviceStyleReader: ViewModifier {
    @State private var detectedStyle: DeviceUIStyle = .iphoneHomeButton

    public init() {}

    public func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .environment(\.deviceUIStyle, detectedStyle)
                .onAppear {
                    detectedStyle = DeviceDetector.currentDeviceStyle(
                        safeAreaTopInset: geometry.safeAreaInsets.top
                    )
                }
        }
    }
}

public extension View {
    func withDeviceStyle() -> some View {
        self.modifier(DeviceStyleReader())
    }
}
