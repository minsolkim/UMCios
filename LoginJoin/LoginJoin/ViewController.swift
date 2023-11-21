//
//  ViewController.swift
//  LoginJoin
//
//  Created by 김민솔 on 2023/11/17.
//

import UIKit

class ViewController: UIViewController {
    var name: String = ""
    var password: String = ""
    
    @IBOutlet weak var Mainlabel: UILabel!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    override func viewDidLoad() {
        //버튼 둥글게
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        joinButton.layer.cornerRadius = 10
        joinButton.clipsToBounds = true
        super.viewDidLoad()
    }
    
    @IBAction func idedit(_ sender: Any) {
    }
    //로그인 버튼 눌렀을 때
    
    @IBAction func passwordedit(_ sender: Any) {
    }
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
    // Retrieve stored user data from UserDefaults
        guard let id = idTextField.text, !id.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        // UserDefaults에서 id 존재하는지 유무
        guard let uid = UserDefaults.standard.object(forKey: "id") as? String else {
            print("아이디 존재안함")
            Mainlabel.text = "존재하지 않는 ID"
            return
        }
        guard let upassword = UserDefaults.standard.object(forKey: "password") as? String else {
            print("비밀번호 존재안함")
            return
        }
        //아이디가 일치하지 않을 때
        if (id != uid) {
            Mainlabel.text = "존재하지 않는 ID"
        } else {
            //비밀번호가 일치하지 않을 때
            if(password != upassword) {
                Mainlabel.text = "비밀번호 불일치"
            } else {
                //로그인 성공
                Mainlabel.text = "로그인 성공"
            }
        }
        
    }
    //회원가입 버튼 눌렀을 때
    @IBAction func JoinButtonTapped(_ sender: UIButton) {
        //입력된 아이디와 비밀번호 확인
        guard let id = idTextField.text,!id.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else {
            return
        }
    
        let userid = UserDefaults.standard.object(forKey: "id") as? String
        let userpassword = UserDefaults.standard.object(forKey: "password") as? String
        
        //이미 존재하는 id인지 확인
            if let existingUserId = UserDefaults.standard.string(forKey: "id"), existingUserId == id {
                // 이미 존재하는 id 일 경우
                print("이미 존재하는 아이디")
                Mainlabel.text = "이미 존재하는 ID"
            } else {
                // 새로운 사용자 데이터를 UserDefaults에 저장
                UserDefaults.standard.set(id, forKey: "id")
                UserDefaults.standard.set(password, forKey: "password")
                UserDefaults.standard.synchronize()
                // 회원가입 완료
                print("회원가입 완료:\(id), \(password)")
                Mainlabel.text = "회원가입 성공"
            }
    }
}

