//
//  TopView.swift
//  Navigation
//
//  Created by v.milchakova on 28.11.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class TopHeaderView: UIView {
    
    private lazy var avatarImage = UIImageView {
        let avatarImage = UIImageView()
            avatarImage.image = #imageLiteral(resourceName: "LiitlePhoto.jpg")
            avatarImage.tintColor = .white
            avatarImage.contentMode = .scaleAspectFill
            avatarImage.layer.borderWidth = 3
            avatarImage.layer.masksToBounds = false
            avatarImage.layer.borderColor = UIColor.white.cgColor
            avatarImage.contentMode = .scaleAspectFill
            avatarImage.layer.masksToBounds = false
            avatarImage.layer.cornerRadius = avatarImage.frame.height/2
            avatarImage.clipsToBounds = true
        return avatarImage
    }()
    
//    @IBOutlet var nameLabel: UILabel! {
//        didSet {
//            nameLabel.text = "Hysterical Cat"
//            nameLabel.textColor = .black
//            nameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
//            nameLabel.center.x = super.center.x
//        }
//    }
//    @IBOutlet var statusText: UITextField! {
//        didSet {
//            statusText.font = UIFont.boldSystemFont(ofSize: 14.0)
//            statusText.textColor = .gray
//            statusText.placeholder = "Waiting for something..."
//        }
//    }
//    @IBOutlet var statusButton: UIButton! {
//        didSet {
//            statusButton.backgroundColor = .systemBlue
//            statusButton.setTitle("Show status", for: .normal)
//            statusButton.setTitleColor(.white, for: .normal)
//            statusButton.layer.cornerRadius = 15
//            statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//            statusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//            statusButton.layer.shadowOpacity = 0.7
//            statusButton.layer.shadowRadius = 4
//            statusButton.layer.masksToBounds = false
//            statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    @objc func buttonPressed(){
//        print("Status button pressed: \(statusText.text!)")
//    }
}
