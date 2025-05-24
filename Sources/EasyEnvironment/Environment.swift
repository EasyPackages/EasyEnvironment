public protocol Environment {
    var build: Build { get }
    var identifier: String { get }
    var platform: OS { get }
    var language: String { get }
    var isSimulator: Bool { get }
    
    func argument(_ flag: String) -> Bool
    func variable(_ key: String) -> String?
}
