//
//  ViewController.swift
//  LoginJoin
//
//  Created by 김민솔 on 2023/11/17.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Mainlabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    override func viewDidLoad() {
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        joinButton.layer.cornerRadius = 10
        joinButton.clipsToBounds = true
        super.viewDidLoad()
        
    }
    
    @IBAction func IDTextFieldEditing(_ sender: UITextField) {
        
    }
    
    @IBAction func JOINTextFieldEditing(_ sender: UITextField) {
        
    }
    
    @IBAction func JoinButtonTapped(_ sender: UIButton) {
        guard let id = idTextField.text, let password = passwordTextField.text else {
            // 아이디 또는 비밀번호가 비어있을 경우 처리
            return
        }

        // 여기서 실제 회원가입 로직을 구현합니다.
        // 간단한 예로, 아이디와 비밀번호를 출력하는 것으로 대체합니다.
        print("회원가입 완료 - 아이디: \(id), 비밀번호: \(password)")
        Mainlabel.text = "회원가입 성공"
    }
    

}

