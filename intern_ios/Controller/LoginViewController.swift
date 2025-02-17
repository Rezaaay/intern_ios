//
//  LoginViewController.swift
//  alfagift_intern
//
//  Created by Naufal Fachreza on 15/02/25.
//

import UIKit

class LoginViewController: UIViewController, LoginViewDelegate {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        loginView.delegate = self
    }
    
    func loginButtonTapped(username: String, password: String) {
        guard !username.isEmpty, !password.isEmpty else {
            loginView.showError("Username dan password tidak boleh kosong.")
            return
        }
        
        loginView.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkLogin(username: username, password: password)
        }
    }
    
    func checkLogin(username: String, password: String) {
        if username == "alfagift-admin" && password == "asdf" {
            navigateToStudentList()
        } else {
            loginView.showError("Username atau password salah.")
        }
        
        loginView.hideLoading()
    }
    
    func navigateToStudentList() {
        let studentListVC = StudentListView()
        navigationController?.pushViewController(studentListVC, animated: true)
    }
}

