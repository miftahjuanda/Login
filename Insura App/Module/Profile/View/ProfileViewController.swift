//
//  ProfileViewController.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    private var username = ItemProfileComponent()
    private var email = ItemProfileComponent()
    private var address = ItemProfileComponent()
    private var phone = ItemProfileComponent()
    
    var profileViewModel: ProfileViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        
        setItemUI()
        setDataItem()
    }
    
    private func setItemUI() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(address)
        stackView.addArrangedSubview(phone)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        ])
    }
    
    
    private func setDataItem() {
        let data = profileViewModel?.model
        username.titleLabel.text = "Username"
        username.contentLabel.text = data?.username
        
        email.titleLabel.text = "Email"
        email.contentLabel.text = data?.email
        
        address.titleLabel.text = "Address"
        address.contentLabel.text = data?.address?.city
        
        phone.titleLabel.text = "phone"
        phone.contentLabel.text = data?.phone
    }

}
