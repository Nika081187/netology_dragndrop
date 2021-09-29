//
//  LogInViewController.swift
//  Navigation
//
//  Created by v.milchakova on 28.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

protocol LogInViewControllerDelegate: class {
  func onLogInPressed()
}

@available(iOS 13.0, *)
class LogInViewController: UIViewController {
    private let basePadding: CGFloat = 16.0
    
    weak var delegate: LogInViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImage)
        contentView.addSubview(loginTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        contentView.addSubview(biometricAuthButton)
        
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:basePadding),
            loginTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:basePadding),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: basePadding),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: basePadding),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            biometricAuthButton.heightAnchor.constraint(equalToConstant: 100),
            biometricAuthButton.widthAnchor.constraint(equalToConstant: 100),
            biometricAuthButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 50),
            biometricAuthButton.centerXAnchor.constraint(equalTo: logInButton.centerXAnchor),
            biometricAuthButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification){
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        return view
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "logo")
        image.toAutoLayout()
        return image
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.backgroundColor = .systemGray6
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.tintColor = .black
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.masksToBounds = false
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginTextField.placeholder = "Email or phone"
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        loginTextField.leftView = paddingView
        loginTextField.leftViewMode = .always

        loginTextField.toAutoLayout()
        return loginTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.tintColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.masksToBounds = false
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        passwordTextField.placeholder = "Password"
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        passwordTextField.leftView = paddingView
        passwordTextField.leftViewMode = .always

        passwordTextField.toAutoLayout()
        return passwordTextField
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton(type: .system)
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .disabled)
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.layer.masksToBounds = false
        logInButton.clipsToBounds = true
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for:.touchUpInside)
        logInButton.toAutoLayout()
        return logInButton
    }()
    
    private lazy var biometricAuthButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGray
        button.setTitle("Biometric \nAuth", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(biometricAuthButtonPressed), for: .allTouchEvents)
        button.isUserInteractionEnabled = true
        button.toAutoLayout()
        return button
    }()
    
    @objc func logInButtonPressed() {
        print("Log in button pressed")
        delegate?.onLogInPressed()
    }
    
    @objc func biometricAuthButtonPressed() {
        print("Нажали кнопку биометрической авторизации")
        LocalAuthorizationService().authorizeIfPossible { [self] result in
            if result {
                print("Биометрическая авторизация успешна")
                delegate?.onLogInPressed()
            } else {
                print("Биометрическая авторизация не успешна")
            }
        }
    }
}

extension UIImage {
    func alpha(_ value: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
