//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 김민솔 on 2023/11/10.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth

class ViewController: UIViewController {
    
    var email: String?
    var accessToken: String?
    var name: String?
    
    @IBOutlet weak var kakaologin: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var infolabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaologin.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginWithKakaoTalk(_ sender: Any) {
        var oauthToken: OAuthToken?
        
        // isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
        if (UserApi.isKakaoTalkLoginAvailable()) {
            
            // 카톡 설치되어있으면 -> 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk { (token, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 톡으로 로그인 성공")
                    
                    oauthToken = token
                    // 로그인 관련 메소드 추가
                }
            }
        } else { // 카톡 없으면 -> 계정으로 로그인
            UserApi.shared.loginWithKakaoAccount { (token, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    oauthToken = token
                    // 관련 메소드 추가
                    self.setUserInfo()
                }
            }
        }
    }
//        func setUserInfo() {
//            // 사용자 정보 불러옴
//            UserApi.shared.me { [self] user, error in
//                if let error = error {
//                    print(error)
//                } else {
//
//                    guard let token = oauthToken?.accessToken, let email = user?.kakaoAccount?.email,
//                          let name = user?.kakaoAccount?.profile?.nickname else {
//                        print("token/email/name is nil")
//                        return
//                    }
//
//                    self.email = email
//                    self.accessToken = token
//                    self.name = name
//                }
//            }
//        }
        func setUserInfo() {
            UserApi.shared.me() {(user, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("me() success.")
                    //do something
                    _ = user
                    if let nickname = user?.kakaoAccount?.profile?.nickname
                        {
                        // Update UI on the main thread
                        DispatchQueue.main.async {
                            self.infolabel.text = "닉네임: \(nickname)"
                                    }
                                }

                    if let url = user?.kakaoAccount?.profile?.profileImageUrl,
                       let data = try? Data(contentsOf: url) {
                        self.profileImageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }
