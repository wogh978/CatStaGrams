//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/04/01.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    var email = String()
    var password = String()
    var userInfo:UserInfo?

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor
        = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    }

    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.count > 2 ? .facebookColor : .disabledButtonColor
       
        self.password = text
    }
    
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        //회원가입 정보 전달받아서 , textfield랑 일치하면 로그인
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email && userInfo.password == self.password {
//            self.loginButton.backgroundColor = .facebookColor
//            self.loginButton.isEnabled = true
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController

            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
//            self.loginButton.backgroundColor = .disabledButtonColor
//            self.loginButton.isEnabled = false
        }
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면 전환
        // 1. Storyboard 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. ViewController 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용하여 화면을 전환
//        self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        //ARC 개념. swift 메모리 관리 방법, 강한/약한 참조, 약한참조일 경우  arc를 낮춰서 메모리가 해제되면 weak 부분도 해제, 강한참조는 반대로 메모리 낭비
        registerViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
            print(userInfo)
        }
        
        // 메인스토리 보드를 생성하고, 전환할 화면의 VC를 연결해준다.
    }
    
    private func setupAttribute() {
        //register button
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
}
