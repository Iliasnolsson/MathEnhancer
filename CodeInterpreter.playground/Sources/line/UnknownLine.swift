import Foundation

class UnknownLine: Line {
    
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    internal func toTypescript(_ parameter: TypescriptLineConversionParameter) -> String {
        return ""
    }
    
}
