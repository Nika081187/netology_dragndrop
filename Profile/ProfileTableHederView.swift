//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by v.milchakova on 05.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ProfileTableHederView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cont)
        
        cont.addSubview(statusTextField)
        cont.addSubview(statusButton)
        cont.addSubview(nameLabel)
        cont.addSubview(avatarImage)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder!")
    }
        
    private lazy var cont: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = UIColor.systemGray5
        return view
    }()
    
    public lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        avatarImage.toAutoLayout()
        avatarImage.image = #imageLiteral(resourceName: "LiitlePhoto")
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.tintColor = .white
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.clipsToBounds = true
        return avatarImage
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.toAutoLayout()
        nameLabel.text = "Hysterical Cat"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        return nameLabel
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusText = UITextField()
        statusText.toAutoLayout()
        statusText.font = UIFont.boldSystemFont(ofSize: 14.0)
        statusText.textColor = .darkGray
        statusText.placeholder = "Waiting for something..."
        statusText.isEnabled = true
        return statusText
    }()
    
    private lazy var statusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.toAutoLayout()
        statusButton.backgroundColor = .systemBlue
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.layer.cornerRadius = 15
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4
        statusButton.layer.masksToBounds = false
        statusButton.addTarget(self, action: #selector(showStatusButtonPressed), for: .touchUpInside)
        statusButton.isEnabled = true
        return statusButton
    }()
    
    @objc func showStatusButtonPressed() {
        print("Status button pressed: \(statusTextField.text!)")
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            cont.topAnchor.constraint(equalTo: topAnchor),
            cont.leadingAnchor.constraint(equalTo: leadingAnchor),
            cont.trailingAnchor.constraint(equalTo: trailingAnchor),
            cont.widthAnchor.constraint(equalTo: widthAnchor),
            cont.heightAnchor.constraint(equalToConstant: 220),
            
            avatarImage.topAnchor.constraint(equalTo: cont.topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: cont.leadingAnchor, constant: 16),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),

            statusButton.bottomAnchor.constraint(equalTo: cont.bottomAnchor, constant: -30),
            statusButton.leadingAnchor.constraint(equalTo: cont.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: cont.trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: cont.topAnchor, constant: 27),
            nameLabel.centerXAnchor.constraint(equalTo: statusButton.centerXAnchor, constant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),

            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
            statusTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
}

