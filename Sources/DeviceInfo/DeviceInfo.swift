// The Swift Programming Language
// https://docs.swift.org/swift-book

public enum DeviceUIStyle: Equatable {
    case iphoneHomeButton
    case iphoneNotch
    case iphoneDynamicIsland
    case ipadHomeButton
    case ipadNoHomeButton
    case appleWatch
    case visionPro
    case macLaptop
    case macMini
    case macPro
    case macDesktop
}

public extension DeviceUIStyle {
    static var defaultForCurrentPlatform: DeviceUIStyle {
        #if os(watchOS)
        .appleWatch
        #elseif os(visionOS)
        .visionPro
        #elseif os(macOS) || targetEnvironment(macCatalyst)
        .macLaptop
        #else
        .iphoneHomeButton
        #endif
    }
}
