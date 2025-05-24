public enum Build: String {
    case debug
    case testing
    case staging
    case release
    case production
    case development
    case beta
    case alpha
    case canary
    case nightly
    case preview
    case snapshot
    case experimental
    case `internal`
    case external
    case local
    case remote
    case stagingDebug
    case stagingRelease
    case stagingProduction
    case custom
}

public enum OS: String {
    case iOS
    case macOS
    case tvOS
    case watchOS
    case visionOS
    case unknown
}
