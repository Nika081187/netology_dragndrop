//
//  ProfilePhotoStackView.swift
//  Navigation
//
//  Created by v.milchakova on 13.12.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

protocol ProfilePhotoStackViewDelegate: class {
    func onArrowPressed()
}

@available(iOS 13.0, *)
class ProfilePhotoStackView: UIView {
    let baseOffset: CGFloat =  12
    public var rootController: UIViewController?
    
    weak var delegate: ProfileViewDelegate?
    
    private lazy var photoLabel: UILabel = {
        let photoLabel = UILabel()
        photoLabel.toAutoLayout()
        photoLabel.textColor = .black
        photoLabel.text = "Photos"
        photoLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        return photoLabel
    }()
    
    private lazy var arrowButton: UIButton = {
        let arrowButton = UIButton()
        arrowButton.toAutoLayout()
        arrowButton.setImage(#imageLiteral(resourceName: "arrow2"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonPressed), for: .touchUpInside)
        return arrowButton
    }()
    
    @objc func arrowButtonPressed() {
        print("Arrow button pressed")
        delegate?.onArrowPressed()
    }
    
    private lazy var photoStackView: UIStackView = {
        let stack = UIStackView()
        setupImagesToStackView(stack: stack)
        stack.spacing = 8
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.toAutoLayout()
        return stack
    }()
    
    func setupImagesToStackView(stack: UIStackView){
        (0...3).forEach { index in
            let image = UIImageView()
            image.image = PhotoStorage().photos[index]
            image.layer.masksToBounds = false
            image.layer.cornerRadius = 6
            image.clipsToBounds = true
            image.toAutoLayout()
            stack.addArrangedSubview(image)
        }
    }
    
    private lazy var footer: UIView = {
        let footer = UIView()
        footer.toAutoLayout()
        footer.backgroundColor = UIColor.systemGray5
        return footer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photoLabel)
        addSubview(arrowButton)
        addSubview(photoStackView)
        addSubview(footer)
        setupLayout()
        rootController = findViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder!")
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: baseOffset),
            photoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(baseOffset)),
            photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: baseOffset),
            photoLabel.heightAnchor.constraint(equalToConstant: 20),
            
            arrowButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(baseOffset)),
            arrowButton.heightAnchor.constraint(equalToConstant: 20),
            arrowButton.widthAnchor.constraint(equalToConstant: 20),
            
            photoStackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: baseOffset),
            photoStackView.widthAnchor.constraint(equalToConstant: self.frame.width),
            photoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(baseOffset)),
            photoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(baseOffset)),
            photoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: baseOffset),
            
            footer.topAnchor.constraint(equalTo: photoStackView.bottomAnchor, constant: baseOffset),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor),
            footer.leadingAnchor.constraint(equalTo: leadingAnchor),
            footer.heightAnchor.constraint(equalToConstant: 8),
        ])
    }
}

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
