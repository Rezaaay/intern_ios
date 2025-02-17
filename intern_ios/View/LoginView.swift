//
//  LoginView.swift
//  intern_ios
//
//  Created by Naufal Fachreza on 17/02/25.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func loginButtonTapped(username: String, password: String)
}

class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    
    
    private let usernameIcon = UIImage(systemName: "person")
    private let lockIcon = UIImage(systemName: "lock")
    private let eyeIcon = UIImage(systemName: "eye")
    private let eyeSlashIcon = UIImage(systemName: "eye.slash")

    private let backgroundContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        return view
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg-image")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Masukkan email dan password anda untuk melanjutkan masuk ke dalam aplikasi"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var emailTextField: CustomTextField = {
        return CustomTextField(labelText: "Username", placeholderText: "Masukkan Username", prefixIcon: usernameIcon)
    }()

    private lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(labelText: "Password", isSecure: true, placeholderText: "Masukkan Password", prefixIcon: lockIcon, suffixIcon: eyeIcon)
        textField.textField.rightView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility)))
        textField.textField.rightView?.isUserInteractionEnabled = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.isHidden = true
        return label
    }()
    
    private let loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
        
        loginButton.addTarget(self, action: #selector(handleLoginTapped), for: .touchUpInside)
        emailTextField.textField.addTarget(self, action: #selector(resetError), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(resetError), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(headerView)
        headerView.addSubview(logoImageView)
        
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        titleStackView.axis = .vertical
        titleStackView.spacing = 8
        
        let textFieldsStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, errorLabel])
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = 16
        
        let mainStackView = UIStackView(arrangedSubviews: [titleStackView, textFieldsStackView, loginButton])
        mainStackView.axis = .vertical
        mainStackView.spacing = 32
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStackView)
        addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 350),
            
            logoImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 350),
            logoImageView.heightAnchor.constraint(equalToConstant: 350),
            
            mainStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])
    }
    
    @objc private func handleLoginTapped() {
        let username = emailTextField.getText()
        let password = passwordTextField.getText()
        delegate?.loginButtonTapped(username: username, password: password)
    }
    
    @objc private func resetError() {
        errorLabel.isHidden = true
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func showLoading() {
        loadingView.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        loadingView.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    @objc private func togglePasswordVisibility() {
        passwordTextField.textField.isSecureTextEntry.toggle()
        
        let newIcon = passwordTextField.textField.isSecureTextEntry ? eyeIcon : eyeSlashIcon

        if let rightImageView = passwordTextField.textField.rightView as? UIImageView {
            rightImageView.image = newIcon
        }
    }
}


