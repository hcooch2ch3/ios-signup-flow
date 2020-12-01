//
//  SignupMainViewController.swift
//  SignUpFlow
//
//  Created by 임성민 on 2020/12/02.
//

import UIKit

class SignupMainViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var introductionTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentImagePicker))
        userImageView.addGestureRecognizer(tap)
        
        self.idTextField.delegate = self
        self.passwordTextField.delegate = self
        self.checkPasswordTextField.delegate = self
        self.introductionTextView.delegate = self
    }
    
    @objc func presentImagePicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func touchUpCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// Image, ID, Password, Password Check가 모두 작성되어있으면 다음 버튼을 활성화하고 아니면 비활성화하는 함수
    func toggleNextButton() {
        if userImageView.image != nil
        && passwordTextField.hasText
        && checkPasswordTextField.hasText
        && passwordTextField.text == checkPasswordTextField.text
        && introductionTextView.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
}

extension SignupMainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            print("이미지를 불러올 때 문제가 발생하였습니다.")
            return
        }
        
        userImageView.image = image
        
        dismiss(animated: true, completion: nil)
        
        toggleNextButton()
    }
    
}

extension SignupMainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        toggleNextButton()
    }
    
}

extension SignupMainViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        toggleNextButton()
    }
    
}
