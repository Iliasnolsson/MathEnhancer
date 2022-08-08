import Foundation

internal struct ObjectLine: Line {
    
    let name: String
    let nameEndIndex: String.Index
    
    let type: ObjectLineType
    let typeTextEndIndex: String.Index
    let lineDeclaring: String
 
    init(name: String, nameEndIndex: String.Index, type: ObjectLineType, typeTextEndIndex: String.Index, lineDeclaring: String) {
        self.name = name
        self.nameEndIndex = nameEndIndex
        self.type = type
        self.typeTextEndIndex = typeTextEndIndex
        self.lineDeclaring = lineDeclaring
    }
    
    internal func toTypescript(_ parameter: TypescriptLineConversionParameter) -> String {
        return ""
    }

}

public enum ObjectLineType: String {
    case classObject = "class"
    case enumObject = "enum"
    case structObject = "struct"
    case protocolObject = "protocol"
}
