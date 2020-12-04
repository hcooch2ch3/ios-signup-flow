import UIKit

final class UserInformation {
    private struct User {
        var id: String?
        var password: String?
        var image: UIImage?
        var introduction: String?
        var phoneNumber: String?
        var birthday: Date?
    }
    
    private var user: User
    
    static let common = UserInformation()
    
    private init() {
        user = User()
    }
    
    func setId(_ id: String) {
        user.id = id
    }
    
    func setPassword(_ pasword: String) {
        user.password = pasword
    }
    
    func setImage(_ image: UIImage) {
        user.image = image
    }
    
    func setIntroduction(_ introduction: String) {
        user.introduction = introduction
    }
    
    func setPhoneNumber(_ phoneNumber: String) {
        user.phoneNumber = phoneNumber
    }
    
    func setBirthday(_ birthday: Date) {
        user.birthday = birthday
    }
    
    func reset() {
        user.id = nil
        user.password = nil
        user.image = nil
        user.introduction = nil
        user.phoneNumber = nil
        user.birthday = nil
    }
}
