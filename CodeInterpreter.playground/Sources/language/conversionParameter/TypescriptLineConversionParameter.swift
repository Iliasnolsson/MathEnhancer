import Foundation

internal class TypescriptLineConversionParameter: ConversionParameter {
    
    let protocolNames: [String]
    
    internal init(protocolNames: [String]) {
        self.protocolNames = protocolNames
    }
    
}
