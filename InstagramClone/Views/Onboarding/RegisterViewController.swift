//
//  ViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 23/04/2021.
//

import UIKit

class RegisterViewController: Controller {
    private lazy var usernameField = UITextField()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.attributedPlaceholder = "Username".typography(.text, color: Color.lightGray)
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
    
    private lazy var emailField = UITextField()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.attributedPlaceholder = "E-mail".typography(.text, color: Color.lightGray)
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
        $0.attributedPlaceholder = "Password".typography(.text, color: Color.lightGray)
        $0.delegate = self
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
    
    private lazy var registerButton = UIButton()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setAttributedTitle("Sign Up".typography(.text, color: Color.white), for: .normal)
        $0.layer.cornerRadius = CornerRadius._8
        $0.backgroundColor = Color.buttonBackground
        $0.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
    }
    
    private lazy var logoImage = UIImageView(image: UIImage(named: "InstagramLogo"))..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 76).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 210).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        updateNavigationBar(NavTitleStyle.title("Create Account"), titleColor: Color.black, leftButton: .back, leftColor: Color.black)
        configureStyleAndLayout()
    }
    
    private func configureStyleAndLayout() {
        view.addSubview(logoImage)
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Margin._150),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            usernameField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: Margin._32),
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            usernameField.heightAnchor.constraint(equalToConstant: 45),
            
            emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: Margin._12),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            emailField.heightAnchor.constraint(equalToConstant: 45),

            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: Margin._12),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            passwordField.heightAnchor.constraint(equalToConstant: 45),
            
            registerButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: Margin._24),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margin._24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margin._24),
            registerButton.heightAnchor.constraint(equalToConstant: 45),


        ])
    }


    @objc private func didTapRegister() {
        passwordField.resignFirstResponder()
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
        let password = passwordField.text, !password.isEmpty,
        let username = usernameField.text, !username.isEmpty else {return}
        
        AuthManager.shared.registerUser(username: username, email: email, password: password) { (success) in
            DispatchQueue.main.async {
                if success {
                    
                } else {
                    
                }
            }
        }

    }
    
    override func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        }
        else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapRegister()
            view.endEditing(true)
        }
        return true
    }
}


