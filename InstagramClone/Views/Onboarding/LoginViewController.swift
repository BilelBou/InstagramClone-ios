//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var usernameEmailField = UITextField()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.attributedPlaceholder = "Username or e-mail".typography(.text, color: Color.lightGray)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.returnKeyType = .next
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.layer.cornerRadius = CornerRadius._8
        $0.backgroundColor = .secondarySystemBackground
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = Color.lightGray.cgColor
    }
    
    private lazy var passwordField = UITextField()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.attributedPlaceholder = "Password".typography(.text, color: Color.lightGray)
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        $0.returnKeyType = .continue
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.layer.cornerRadius = CornerRadius._8
        $0.backgroundColor = .secondarySystemBackground
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = Color.lightGray.cgColor
        $0.isSecureTextEntry = true
    }
    
    private lazy var loginButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setAttributedTitle("Log In".typography(.text, color: Color.white), for: .normal)
        $0.layer.cornerRadius = CornerRadius._8
        $0.backgroundColor = Color.buttonBackground
        $0.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }
    
    private lazy var registerButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setAttributedTitle("Create an Account.".typography(.captionStrong, color: Color.buttonLetter), for: .normal)
        $0.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
    }
    
    private lazy var forgotPassword = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setAttributedTitle("Forgot password ?".typography(.captionStrong, color: Color.buttonLetter), for: .normal)
    }
    
    private lazy var newUserLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.attributedText = "You don't have an account ?".typography(.caption, color: Color.lightGray)
    }

    
    private lazy var logoImage = UIImageView(image: UIImage(named: "InstagramLogo"))..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.tintColor = .label
        $0.heightAnchor.constraint(equalToConstant: 76).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemBackground
        configureStyleAndLayout()
        // Do any additional setup after loading the view.
    }
    
    private func configureStyleAndLayout() {
        view.addSubview(logoImage)
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(forgotPassword)
        view.addSubview(loginButton)
        view.addSubview(newUserLabel)
        view.addSubview(registerButton)

        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Margin._150),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameEmailField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: Margin._32),
            usernameEmailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            usernameEmailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            usernameEmailField.heightAnchor.constraint(equalToConstant: 45),
            
            passwordField.topAnchor.constraint(equalTo: usernameEmailField.bottomAnchor, constant: Margin._12),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            passwordField.heightAnchor.constraint(equalToConstant: 45),
            
            forgotPassword.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Margin._20),
            forgotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            
            loginButton.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: Margin._24),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            newUserLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Margin._36),
            newUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._20),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Margin._30),
            registerButton.leadingAnchor.constraint(equalTo: newUserLabel.trailingAnchor, constant: Margin._6),
        ])
    }
    
    @objc private func didTapLogin() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty else { return }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            email = usernameEmail
        } else {
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(email: email, username: username, password: password) { (success) in
            DispatchQueue.main.async {
                if success {
                    print("Loged")
                    self.dismiss(animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Log In Error", message: "Please check your email or password", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    print("No")
                }
            }
        }
    }
    
    @objc private func didTapCreateAccount() {
        let vc = RegisterViewController()
        let vcWithNav = UINavigationController(rootViewController: vc)
        vcWithNav.modalPresentationStyle = .fullScreen
        
        present(vcWithNav, animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLogin()
            view.endEditing(true)
        }
        return true
    }
}
