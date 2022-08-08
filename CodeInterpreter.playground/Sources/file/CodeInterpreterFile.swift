import Foundation

public struct CodeInterpreterFile {
    public var name: String
    public var code: String
    
    public init(name: String, code: String) {
        self.name = name
        self.code = code
    }
}
