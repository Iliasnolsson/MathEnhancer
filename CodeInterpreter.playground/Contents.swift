import UIKit

var swiftCode =
"""
protocol IWorkspaceAuthenticationEndpoints {
    
    // Post
    func authenticate(_ workspace: ID, pin: Int?) async throws
    
    func pinUpdate(_ pin: Int, verificationCode: String?) async throws
    
    func settingUpdate(toType type: WorkspaceAuthenticationType, accessDurationInMinutes: Int) async throws
    
    // Get
    func getRole() async throws -> WorkspaceRole

    func getAuthenticated() async throws -> ID
    
    func getAuthenticationStatus(_ workspace: ID) async throws -> WorkspaceAuthenticationStatusResponse
    
    func getSettingsInfo() async throws -> WorkspaceAuthenticationSettingsInfoResponse
    
}
"""

let files: [CodeInterpreterFile] = [
    .init(name: "Random", code: swiftCode)
]

let interpreter = CodeInterpreter(files: files, filesCodeLanguage: .swift)
print(interpreter.convert(to: .typescript))

