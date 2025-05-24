import Foundation

import EasyEnvironment
import EasyCore

public struct AppEnvironment: Environment {
    private let bundle: Bundle
    private let processInfo: ProcessInfo
    
    public init(
        bundle: Bundle = .main,
        processInfo: ProcessInfo = .processInfo
    ) {
        self.bundle = bundle
        self.processInfo = processInfo
    }
    
    public var build: Build {
        if let configuration = variable("XCODE_CONFIGURATION"),
           let build = Build(rawValue: configuration.lowercased()) {
            return build
        }
        
        return .production
    }
    
    public var identifier: String {
        bundle.bundleIdentifier ?? "unknown"
    }
    
    public var platform: OS {
        var platformString = String()
        
        #if os(iOS)
        platformString = "iOS"
        #elseif os(macOS)
        platformString =  "macOS"
        #elseif os(tvOS)
        platformString = "tvOS"
        #elseif os(watchOS)
        platformString = "watchOS"
        #elseif os(visionOS)
        platformString = "visionOS"
        #endif
        
        return OS(rawValue: platformString) ?? OS.unknown
    }

    public var language: String {
        Locale.current.languageCode ?? "unknown"
    }

    public var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    public func argument(_ flag: String) -> Bool {
        processInfo.arguments.contains(flag)
    }
    
    public func variable(_ key: String) -> String? {
        processInfo.environment[key]
    }
}
