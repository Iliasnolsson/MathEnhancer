import Foundation

internal protocol Line {
     
    func toTypescript(_ parameter: TypescriptLineConversionParameter) -> String
    
}
