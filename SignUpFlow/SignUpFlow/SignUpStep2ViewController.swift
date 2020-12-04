import UIKit

class SignUpStep2ViewController: UIViewController {
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UILabel!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var signinButton: UIButton!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayDatePicker.maximumDate = Date()
        
        birthdayTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
    }
    
    /// 두번째 회원가입 화면에서 입력받는 전화번호와 생년월일의 입력  여부를 반환하는 함수.
    ///
    /// - Returns: 잘 입력되었으면 true, 아니면 false 반환.
    func allInformationIsComplete() -> Bool {
        if phoneNumberTextField.hasText
        && dateFormatter.string(from: birthdayDatePicker.date) != dateFormatter.string(from: Date()) {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func birthdayDatePickerDidChange(_ sender: Any) {
        birthdayTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
        
        signinButton.isEnabled = allInformationIsComplete()
    }
    
    @IBAction func phoneNumberTextFieldDidChange(_ sender: Any) {
        signinButton.isEnabled = allInformationIsComplete()
    }
    
    @IBAction func pressedCancelButton(_ sender: UIButton) {
        UserInformation.common.reset()
        
        dismiss(animated: true)
    }
    
    @IBAction func pressedBackButton(_ sender: UIButton) {
        if let phoneNumber = phoneNumberTextField.text, phoneNumber != "" {
            UserInformation.common.setPhoneNumber(phoneNumber)
        }
        
        if dateFormatter.string(from: birthdayDatePicker.date) != dateFormatter.string(from: Date()) {
            UserInformation.common.setBirthday(birthdayDatePicker.date)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pressedSigninButton(_ sender: UIButton) {
        guard let phoneNumber = phoneNumberTextField.text, phoneNumber != "" else {
            print("전화번호가 잘못 입력되어서 회원가입을 진행할 수 없습니다.")
            return
        }
        
        guard dateFormatter.string(from: birthdayDatePicker.date) != dateFormatter.string(from: Date()) else {
            print("생년월일이 잘못 입력되어서 회원가입을 진행할 수 없습니다.")
            return
        }
        
        UserInformation.common.setPhoneNumber(phoneNumber)
        UserInformation.common.setBirthday(birthdayDatePicker.date)
        
        dismiss(animated: true)
    }
}
