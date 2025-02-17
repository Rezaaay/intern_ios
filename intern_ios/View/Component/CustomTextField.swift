//
//  CustomTextField.swift
//  intern_ios
//
//  Created by Naufal Fachreza on 15/02/25.
//

//import UIKit
//
//class CustomTextField: UIView, UITextFieldDelegate {
//
//    let textField = UITextField()
//    let label = UILabel()
//    let borderRadius: CGFloat
//
//    init(labelText: String, borderRadius: CGFloat = 8.0, isSecure: Bool = false, keyboardType: UIKeyboardType = .default) {
//        self.borderRadius = borderRadius
//        super.init(frame: .zero)
//
//        setupLabel(text: labelText)
//        setupTextField(isSecure: isSecure, keyboardType: keyboardType)
//        setupLayout()
//
//        // ✅ Set delegate
//        textField.delegate = self
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupLabel(text: String) {
//        label.text = text
//        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//    }
//
//    private func setupTextField(isSecure: Bool, keyboardType: UIKeyboardType) {
//        textField.isSecureTextEntry = isSecure
//        textField.keyboardType = keyboardType
//        textField.borderStyle = .none
//        textField.autocapitalizationType = .none
//        textField.layer.cornerRadius = borderRadius
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = UIColor.systemGray4.cgColor
//        textField.setLeftPaddingPoints(10)
//        textField.setRightPaddingPoints(10)
//
//        // ✅ Tambahkan padding & shadow saat aktif
//        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
//        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
//    }
//
//    private func setupLayout() {
//        let stackView = UIStackView(arrangedSubviews: [label, textField])
//        stackView.axis = .vertical
//        stackView.spacing = 8
//
//        addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            textField.heightAnchor.constraint(equalToConstant: 44)
//        ])
//    }
//
//    func setText(_ text: String) {
//        textField.text = text
//    }
//
//    func getText() -> String {
//        return textField.text ?? ""
//    }
//
//    // ✅ Saat TextField Aktif (Focus)
//    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.systemBlue.cgColor
//        textField.layer.borderWidth = 2
//    }
//
//    // ✅ Saat TextField Tidak Aktif (Unfocus)
//    @objc func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.systemGray4.cgColor
//        textField.layer.borderWidth = 1
//    }
//}
//
//// ✅ Helper Padding
//extension UITextField {
//    func setLeftPaddingPoints(_ amount: CGFloat) {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//    }
//
//    func setRightPaddingPoints(_ amount: CGFloat) {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//}


//import UIKit
//
//class CustomTextField: UIView, UITextFieldDelegate {
//
//    let textField = UITextField()
//    let label = UILabel()
//    let borderRadius: CGFloat
//
//    init(labelText: String,
//         borderRadius: CGFloat = 8.0,
//         isSecure: Bool = false,
//         keyboardType: UIKeyboardType = .default,
//         prefixIcon: UIImage? = nil,
//         suffixIcon: UIImage? = nil) {
//
//        self.borderRadius = borderRadius
//        super.init(frame: .zero)
//
//        setupLabel(text: labelText)
//        setupTextField(isSecure: isSecure, keyboardType: keyboardType, prefixIcon: prefixIcon, suffixIcon: suffixIcon)
//        setupLayout()
//
//        textField.delegate = self
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupLabel(text: String) {
//        label.text = text
//        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//    }
//
//    private func setupTextField(isSecure: Bool, keyboardType: UIKeyboardType, prefixIcon: UIImage?, suffixIcon: UIImage?) {
//        textField.isSecureTextEntry = isSecure
//        textField.keyboardType = keyboardType
//        textField.borderStyle = .none
//        textField.autocapitalizationType = .none
//        textField.layer.cornerRadius = borderRadius
//        textField.layer.borderWidth = 1
//        textField.layer.borderColor = UIColor.systemGray4.cgColor
//        textField.setLeftPaddingPoints(10)
//        textField.setRightPaddingPoints(10)
//
//        if let prefixIcon = prefixIcon {
//            textField.leftView = createIconView(image: prefixIcon)
//            textField.leftViewMode = .always
//        }
//
//        if let suffixIcon = suffixIcon {
//            textField.rightView = createIconView(image: suffixIcon)
//            textField.rightViewMode = .always
//        }
//
//        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
//        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
//    }
//
//    private func setupLayout() {
//        let stackView = UIStackView(arrangedSubviews: [label, textField])
//        stackView.axis = .vertical
//        stackView.spacing = 8
//
//        addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            textField.heightAnchor.constraint(equalToConstant: 44)
//        ])
//    }
//
//    func setText(_ text: String) {
//        textField.text = text
//    }
//
//    func getText() -> String {
//        return textField.text ?? ""
//    }
//
//    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.systemBlue.cgColor
//        textField.layer.borderWidth = 2
//    }
//
//    @objc func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.layer.borderColor = UIColor.systemGray4.cgColor
//        textField.layer.borderWidth = 1
//    }
//
//    private func createIconView(image: UIImage) -> UIView {
//        let imageView = UIImageView(image: image)
//        imageView.contentMode = .scaleAspectFit
//        imageView.tintColor = .gray
//        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
//
//        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 24))
//        containerView.addSubview(imageView)
//        imageView.center = containerView.center
//
//        return containerView
//    }
//}
//
//extension UITextField {
//    func setLeftPaddingPoints(_ amount: CGFloat) {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
//        self.leftView = paddingView
//        self.leftViewMode = .always
//    }
//
//    func setRightPaddingPoints(_ amount: CGFloat) {
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
//        self.rightView = paddingView
//        self.rightViewMode = .always
//    }
//}


import UIKit

class CustomTextField: UIView, UITextFieldDelegate {
    
    let textField = UITextField()
    let label = UILabel()
    let borderRadius: CGFloat
    private var rightImageView: UIImageView?  // Simpan referensi ke UIImageView

    init(labelText: String,
         borderRadius: CGFloat = 8.0,
         isSecure: Bool = false,
         placeholderText: String = "",
         keyboardType: UIKeyboardType = .default,
         prefixIcon: UIImage? = nil,
         suffixIcon: UIImage? = nil) {
        
        self.borderRadius = borderRadius
        super.init(frame: .zero)
        
        setupLabel(text: labelText)
        setupTextField(isSecure: isSecure, keyboardType: keyboardType, placeholderText: placeholderText, prefixIcon: prefixIcon, suffixIcon: suffixIcon)
        setupLayout()
        
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createIconView(image: UIImage) -> UIView {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.isUserInteractionEnabled = true // Pastikan bisa ditekan

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 24))
        imageView.frame = CGRect(x: 5, y: 0, width: 24, height: 24)
        containerView.addSubview(imageView)
        
        return containerView
    }
    
    private func setupLabel(text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private func setupTextField(isSecure: Bool, keyboardType: UIKeyboardType, placeholderText: String, prefixIcon: UIImage?, suffixIcon: UIImage?) {
        textField.isSecureTextEntry = isSecure
        textField.keyboardType = keyboardType
        textField.placeholder = placeholderText
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = borderRadius
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        
        if let prefixIcon = prefixIcon {
            textField.leftView = createIconView(image: prefixIcon)
            textField.leftViewMode = .always
        }
        
        if let suffixIcon = suffixIcon {
            rightImageView = UIImageView(image: suffixIcon)
            rightImageView?.contentMode = .scaleAspectFit
            rightImageView?.tintColor = .gray
            rightImageView?.isUserInteractionEnabled = true  // Pastikan bisa ditekan

            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePasswordVisibility))
            rightImageView?.addGestureRecognizer(tapGesture)

            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 34, height: 24))
            rightImageView?.frame = CGRect(x: 5, y: 0, width: 24, height: 24)
            containerView.addSubview(rightImageView!)

            textField.rightView = containerView
            textField.rightViewMode = .always
        }
        
        textField.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
    }
    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [label, textField])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setText(_ text: String) {
        textField.text = text
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
    
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.layer.borderWidth = 2
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray4.cgColor
        textField.layer.borderWidth = 1
    }
    
    @objc private func togglePasswordVisibility() {
        textField.isSecureTextEntry.toggle()
        
        let newIcon = textField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
        rightImageView?.image = newIcon
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
