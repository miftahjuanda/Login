//
//  LoginViewController.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var didSendEventClosure: ((LoginViewController.Event) -> Void)?
    
    private var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = .clear
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 30
        return stack
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "Login Apps"
        return label
    }()
    
    private var usernameField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Username"
        field.layer.borderColor = UIColor.blue.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.textContentType = .username
        field.autocorrectionType = UITextAutocorrectionType.no
        field.textAlignment = .center
        return field
    }()
    
    private var passwordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Password"
        field.layer.borderColor = UIColor.blue.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.textContentType = .none
        field.isSecureTextEntry = true
        field.autocorrectionType = UITextAutocorrectionType.no
        field.textAlignment = .center
        return field
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(eventLogin), for: .touchUpInside)
        return button
    }()
    
    var coordinatorLogin: LoginCoordinator?
    var viewModel = LoginViewModel(provider: NetworkProvider())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    deinit {
        print("LoginVC deinit")
    }
    
    @objc private func eventLogin() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        if username.isEmpty || password.isEmpty {
            alert(title: "Peringatan!", message: "Lengkapi isian yang tersedia", vc: self)
        } else if (!username.isEmpty && !password.isEmpty) && (username == password)  {
            viewModel.login(nama: username , completion: { [weak self] isLogin in
                DispatchQueue.main.async {
                    
                    isLogin == username ? self?.didSendEventClosure?(.login) : alert(title: "Gagal!",
                                                                                     message: "Username dan Password tidak ditemukan!",
                                                                                     vc: self!)
                }
            })

        } else {
            alert(title: "Peringatan!", message: "Username atau Password anda salah", vc: self)
        }
        
    }
    
    private func setUIView() {
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(loginLabel)
        verticalStackView.addArrangedSubview(usernameField)
        verticalStackView.addArrangedSubview(passwordField)
        verticalStackView.addArrangedSubview(loginButton)
        
        
        NSLayoutConstraint.activate([
            loginLabel.heightAnchor.constraint(equalToConstant: 100),
            usernameField.heightAnchor.constraint(equalToConstant: 45),
            passwordField.heightAnchor.constraint(equalToConstant: 45),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension LoginViewController {
    enum Event {
        case login
    }
}
