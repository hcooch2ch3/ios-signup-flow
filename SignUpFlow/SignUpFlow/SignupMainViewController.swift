//
//  SignupMainViewController.swift
//  SignUpFlow
//
//  Created by 임성민 on 2020/12/02.
//

import UIKit

class SignupMainViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentImagePicker))
        userImageView.addGestureRecognizer(tap)
    }
    
    @objc func presentImagePicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func touchUpCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
    }
    
}
