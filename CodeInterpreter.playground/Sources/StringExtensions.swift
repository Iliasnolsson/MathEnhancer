import Foundation

extension StringProtocol {
    func firstIndex(of char: Character, after index: Index) -> Index? {
        let substring = self[index..<endIndex]
        return substring.firstIndex(of: char)
    }
    
    func firstIndex(where expression: (Character) throws -> Bool, after index: Index) -> Index? {
        let substring = self[index..<endIndex]
        return try? substring.firstIndex(where: expression) ?? nil
    }
}
