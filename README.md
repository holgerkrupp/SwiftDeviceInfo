# Swift Device Info

A Package I wrote to show SF Symbols for the device used.

Add this to your SwiftUI App:
```swift
import DeviceInfo


extension DeviceUIStyle {
    var sfSymbolName: String {
        switch self {
        case .iphoneHomeButton: return "iphone.gen1"
        case .iphoneNotch: return "iphone.gen2"
        case .iphoneDynamicIsland: return "iphone.gen3"
        case .ipadHomeButton: return "ipad.gen1"
        case .ipadNoHomeButton: return "ipad.gen2"
        case .macLaptop: return "macbook"
        case .macMini: return "macmini"
        case .macPro: return "macpro.gen3"
        case .macDesktop: return "desktopcomputer"
        }
    }
}
```

Inject it in your View with 
```swift
            ContentView()
                .withDeviceStyle()
```       
                
And use it with 
```swift
    @Environment(\.deviceUIStyle) var style

        ...

    Image(systemName: style.sfSymbolName)
```

You can use it of course to customize other items, not only sfSymbolNames. Modify the extension accordingly.
