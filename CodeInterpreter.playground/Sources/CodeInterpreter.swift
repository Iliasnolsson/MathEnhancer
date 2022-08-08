import Foundation

public class CodeInterpreter {

    private var files: [CodeInterpreterFileAnalysed]
    private let filesCodeLanguage: SourceLanguage
    
    public init(files: [CodeInterpreterFile], filesCodeLanguage: SourceLanguage) {
        self.files = files.map {CodeInterpreter.getCodeInterpreterFileAnalysed($0)}
        self.filesCodeLanguage = filesCodeLanguage
    }
    
    private static func getCodeInterpreterFileAnalysed(_ file: CodeInterpreterFile) -> CodeInterpreterFileAnalysed {
        return .init(
            name: file.name,
            code: file.code,
            lines: getLines(forCode: file.code))
    }
    
    private static func getLines(forCode code: String) -> [Line] {
        var result = [Line]()
        var lines = code.split(whereSeparator: \.isNewline).map {String($0)}
        
        while !lines.isEmpty {
            let line = lines.removeFirst()
            if let syntaxStart = line.firstIndex(where: {!$0.isWhitespace}) {
                let syntaxEnd = line.range(of: " ", options: [], range: syntaxStart..<line.endIndex)?.lowerBound ?? line.endIndex
                let syntaxText = String(line[syntaxStart..<syntaxEnd])
                
                // Check if object
                if let objectType = ObjectLineType(rawValue: syntaxText) {
                    if let nameStart = line.firstIndex(where: {!$0.isWhitespace}, after: line.index(after: syntaxEnd)) {
                        if let nameEnd = line.firstIndex(where: {$0.isWhitespace}, after: nameStart) {
                            result.append(ObjectLine(
                                name: String(line[nameStart..<nameEnd]),
                                nameEndIndex: nameEnd,
                                type: objectType,
                                typeTextEndIndex: syntaxEnd,
                                lineDeclaring: line))
                        }
                    }
                }
                
                
                
            }
        }
        return result
    }
    
}

// MARK: Typescript
public extension CodeInterpreter {
    
    func convert(to language: TargetLanguage) -> [CodeInterpreterFile] {
        return toTypescript()
    }
    
    private func toTypescript() -> [CodeInterpreterFile] {
        return []
    }
    
}
