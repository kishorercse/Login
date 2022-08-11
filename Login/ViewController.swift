//
//  ViewController.swift
//  Login
//
//  Created by kishore-pt5557 on 05/08/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var checkbox: UIButton!
    var eyeButton: UIButton!
    var emailText: UITextField!
    var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.backgroundColor = .lightGray
        
        let login = UIStackView()
        view.addSubview(login)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        login.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        login.center = view.center
        login.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        login.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9).isActive = true
        login.backgroundColor = .white
        login.axis = .vertical
        login.layer.cornerRadius = 20
        login.distribution = .fill
        login.alignment = .fill
        
        let top = UIView()
        let center = UIView()
        let bottom = UIView()
        login.addArrangedSubview(top)
        login.addArrangedSubview(center)
        login.addArrangedSubview(bottom)

        top.heightAnchor.constraint(equalTo: login.heightAnchor, multiplier: 0.2).isActive = true
        center.heightAnchor.constraint(equalTo: login.heightAnchor, multiplier: 0.6).isActive = true
        bottom.heightAnchor.constraint(equalTo: login.heightAnchor, multiplier: 0.2).isActive = true

        let loginLabel = UILabel()
        top.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.leftAnchor.constraint(equalToSystemSpacingAfter: top.leftAnchor, multiplier: 2).isActive = true
        loginLabel.topAnchor.constraint(equalTo: top.topAnchor, constant: 10).isActive = true
        loginLabel.widthAnchor.constraint(equalTo: top.widthAnchor, multiplier: 0.3).isActive = true
        loginLabel.heightAnchor.constraint(equalTo: top.heightAnchor, multiplier: 0.3).isActive = true
        loginLabel.text = "Log in"
        loginLabel.font = loginLabel.font.withSize(30)



        let googleButton = UIButton()
        top.addSubview(googleButton)
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.centerXAnchor.constraint(equalTo: top.centerXAnchor).isActive = true
        googleButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20).isActive = true
        googleButton.widthAnchor.constraint(equalTo: top.widthAnchor, multiplier: 0.9).isActive = true
        googleButton.heightAnchor.constraint(equalTo: top.heightAnchor, multiplier: 0.25).isActive = true
        googleButton.backgroundColor = .gray
        googleButton.layer.cornerRadius = 10
        googleButton.addTarget(self, action: #selector(googleButtonTapped), for: .touchUpInside)
        
        googleButton.setTitle(" Log in with Google", for: .normal)
        googleButton.setTitleColor(.black, for: .normal)
        googleButton.titleLabel?.centerXAnchor.constraint(equalTo: googleButton.centerXAnchor).isActive = true
        

        googleButton.setImage(UIImage(named: "google"), for: .normal)
        googleButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        googleButton.imageView?.centerYAnchor.constraint(equalTo: googleButton.centerYAnchor).isActive = true
        googleButton.imageView?.widthAnchor.constraint(equalToConstant: 25).isActive = true
        googleButton.imageView?.heightAnchor.constraint(equalToConstant: 25).isActive = true

        let closeButton = UIButton(type: .close)
        top.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.backgroundColor = .white
        closeButton.rightAnchor.constraint(equalTo: top.rightAnchor, constant: -10).isActive = true
        closeButton.topAnchor.constraint(equalTo: top.topAnchor, constant: 10).isActive = true
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)


        let line = UIView()
        center.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.widthAnchor.constraint(equalTo: center.widthAnchor, multiplier: 0.9).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: center.centerXAnchor).isActive = true
//        line.leftAnchor.constraint(equalTo: center.leftAnchor).isActive = true
        line.topAnchor.constraint(equalTo: center.topAnchor).isActive = true
        line.backgroundColor = .lightGray


        let center2 = UIView()
        center.addSubview(center2)
        center2.translatesAutoresizingMaskIntoConstraints = false
        center2.centerXAnchor.constraint(equalTo: center.centerXAnchor).isActive = true
        center2.centerYAnchor.constraint(equalTo: center.centerYAnchor).isActive = true
        center2.widthAnchor.constraint(equalTo: center.widthAnchor, multiplier: 0.9).isActive = true
        center2.heightAnchor.constraint(equalTo: center.heightAnchor, multiplier: 0.8).isActive = true


        let emailLabel = UILabel()
        center2.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 1).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: center2.leftAnchor).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: center2.rightAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.1).isActive = true
        emailLabel.text = "Email"

        emailText = UITextField()
        emailText.tag = 0
        emailText.delegate = self
        center2.addSubview(emailText)
        emailText.keyboardType = .emailAddress
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailText.borderStyle = .roundedRect
        emailText.textContentType = .emailAddress
        emailText.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 4).isActive = true
        emailText.leftAnchor.constraint(equalTo: center2.leftAnchor).isActive = true
        emailText.widthAnchor.constraint(equalTo: center2.widthAnchor, multiplier: 0.9).isActive = true
        emailText.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.15).isActive = true
        emailText.autocapitalizationType = .none

        let passwordLabel = UILabel()
        center2.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 11).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: center2.leftAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: center2.widthAnchor, multiplier: 0.35).isActive = true
        passwordLabel.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.1).isActive = true
        passwordLabel.text = "Password"

        


        passwordText = UITextField()
        passwordText.tag = 1
        passwordText.delegate = self
        center2.addSubview(passwordText)
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        passwordText.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 14).isActive = true
        passwordText.leftAnchor.constraint(equalTo: center2.leftAnchor).isActive = true
        passwordText.widthAnchor.constraint(equalTo: center2.widthAnchor, multiplier: 0.9).isActive = true
        passwordText.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.15).isActive = true
        passwordText.borderStyle = .roundedRect
        passwordText.textContentType = .password
        passwordText.isSecureTextEntry = true
        passwordText.autocapitalizationType = .none
        
       
        
        
        eyeButton = UIButton()
        eyeButton.setImage(UIImage(named: "eye-crossed"), for: .normal)
        eyeButton.setImage(UIImage(named: "eye-open"), for: .selected)
        eyeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        eyeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(eyeTapped)))
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        eyeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        

        passwordText.rightView = eyeButton
        passwordText.rightViewMode = .always
        


        checkbox = UIButton()
        checkbox.setImage(UIImage(named: "unchecked"), for: .normal)
        checkbox.setImage(UIImage(named: "checked"), for: .selected)
        checkbox.setTitle(" Remember me", for: .normal)
        checkbox.setTitleColor(.black, for: .normal)
        checkbox.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(boxTapped)))
        center2.addSubview(checkbox)
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 20).isActive = true
        checkbox.leftAnchor.constraint(equalTo: center2.leftAnchor).isActive = true
        checkbox.widthAnchor.constraint(equalTo: center2.widthAnchor, multiplier: 0.5).isActive = true
        checkbox.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.1).isActive = true
        
        
        let submitButton = UIButton()
        center2.addSubview(submitButton)
        submitButton.setTitle("Log in", for: .normal)
        submitButton.backgroundColor = .systemBlue
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 25).isActive = true
        submitButton.leftAnchor.constraint(equalTo: checkbox.leftAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalTo: center2.widthAnchor, multiplier: 0.9).isActive = true
        submitButton.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.12).isActive = true
        submitButton.layer.cornerRadius = 10
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        
        let forgotPswdButton = UIButton()
        center2.addSubview(forgotPswdButton)
        forgotPswdButton.setTitle("Forgot Password?", for: .normal)
        forgotPswdButton.setTitleColor(.systemBlue, for: .normal)
        forgotPswdButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPswdButton.topAnchor.constraint(equalToSystemSpacingBelow: center2.topAnchor, multiplier: 30).isActive = true
        forgotPswdButton.centerXAnchor.constraint(equalTo: center2.centerXAnchor).isActive = true
        forgotPswdButton.widthAnchor.constraint(equalTo: center2.widthAnchor, multiplier: 0.6).isActive = true
        forgotPswdButton.heightAnchor.constraint(equalTo: center2.heightAnchor, multiplier: 0.1).isActive = true
        forgotPswdButton.addTarget(self, action: #selector(forgotPswdButtonTapped), for: .touchUpInside)

        let line2 = UIView()
        center.addSubview(line2)
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.widthAnchor.constraint(equalTo: center.widthAnchor, multiplier: 0.9).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line2.centerXAnchor.constraint(equalTo: center.centerXAnchor).isActive = true
//        line2.leftAnchor.constraint(equalTo: center.leftAnchor).isActive = true
        line2.bottomAnchor.constraint(equalTo: center.bottomAnchor).isActive = true
        line2.backgroundColor = .lightGray

        let signupLabel = UILabel()
        bottom.addSubview(signupLabel)
        signupLabel.text = "Don't have an account?"
        signupLabel.translatesAutoresizingMaskIntoConstraints = false
        signupLabel.topAnchor.constraint(equalToSystemSpacingBelow: bottom.topAnchor, multiplier: 2).isActive = true
        signupLabel.centerXAnchor.constraint(equalTo: bottom.centerXAnchor).isActive = true
        signupLabel.widthAnchor.constraint(equalTo: bottom.widthAnchor, multiplier: 0.6).isActive = true
        signupLabel.heightAnchor.constraint(equalTo: bottom.heightAnchor, multiplier: 0.25).isActive = true

        let signupButton = UIButton()
        bottom.addSubview(signupButton)
        signupButton.setTitle("Sign up", for: .normal)
        signupButton.setTitleColor(.systemBlue, for: .normal)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        signupButton.topAnchor.constraint(equalToSystemSpacingBelow: bottom.topAnchor, multiplier: 6).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: bottom.centerXAnchor).isActive = true
        signupButton.widthAnchor.constraint(equalTo: bottom.widthAnchor, multiplier: 0.3).isActive = true
        signupButton.heightAnchor.constraint(equalTo: bottom.heightAnchor, multiplier: 0.25).isActive = true
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }

    @objc func googleButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
        let alert = UIAlertController(title: "Google Sign-in", message: "Loading", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

    @objc func closeButtonTapped(_sender: UIButton) {
        dismissKeyboard()
        let alert = UIAlertController(title: "Close window", message: "Click ok to close application", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

    @objc func eyeTapped(_ sender: UIButton) {
        eyeButton.isSelected.toggle()
        passwordText.isSecureTextEntry.toggle()

    }

    @objc func boxTapped(_ sender: UIButton) {
        dismissKeyboard()
        checkbox.isSelected.toggle()
    }

    @objc func forgotPswdButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
        let alert = UIAlertController(title: "Forgot Password", message: "Loading", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    
    @objc func signupButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Sign up", message: "Loading", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

    @objc func submitButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
        if !validateEmail(emailText.text ?? "") {
            let alert = UIAlertController(title: "Please enter a valid Email id", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
            return
        }
        if !validatePassword(passwordText.text ?? "") {
            let alert = UIAlertController(title: "Please enter a valid password", message: "Password length shoud be between 8 and 20 characters with atleast one uppercase, one lowercase, one number and one special character", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
            return
        }
        if !checkbox.isSelected {
            let alert = UIAlertController(title: "Remember me", message: "Please check the Remember me", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
            return
        }

        let alert = UIAlertController(title: "Sign-in", message: "Success", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

    func validateEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)

    }

    func validatePassword(_ password: String) -> Bool{
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,20}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func tagBasedTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1

        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tagBasedTextField(textField)
        return true
    }
}

