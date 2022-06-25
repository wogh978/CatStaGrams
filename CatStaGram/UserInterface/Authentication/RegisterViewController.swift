//
//  RegisterViewController.swift
//  CatStaGram
//
//  Created by 유재호 on 2022/04/01.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    
    
//    var passName: ((name) -> Void)?
//    var passNickname: ((nickname) -> Void)
//    var passpassword: ((password) -> Void)?
//
//
    var isValidEmail = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    // textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //왜 여기는 클로져?  -> = 이 안되는 이유
    var textFields:[UITextField] { [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    
    //MARK: Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
            
        case nameTextField:
            self.isValidName = text.count>2
            self.name = text
            
        case nicknameTextField:
            self.isValidNickname = text.count>2
            self.nickname = text
            
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
            
        default:
            fatalError("Missing TextField...!")
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        //뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(email: self.email, name: self.name, nickname: self.nickname, password: self.password)
        
        self.userInfo?(userInfo)
    }
    //MARK: Helpers
    private func setUpTextField() {
        textFields.forEach{
            tf in tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    //사용자 정보 입력받아 가입버튼 활성화
    private func validateUserInfo() {
        
        if isValidEmail && isValidName && isValidNickname && isValidPassword{
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
        } else {
            
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33){
                self.signupButton.backgroundColor = .disabledButtonColor
                
            }
        }
        
        
    }
    private func setupAttribute() {
        //register button
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        let attributes = generateButtonAttribute(self.popToLoginButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
}
    extension String {
        func isValidPassword() -> Bool {
            let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
            let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
            
            return passwordValidation.evaluate(with: self)
        }
        func isValidEmail() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@",emailRegEx)
            return emailTest.evaluate(with: self)
        }
    }

