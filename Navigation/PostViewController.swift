//
//  PostViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

protocol PostViewControllerDelegate: class {
  func onAddPostPressed()
}

@available(iOS 13.0, *)
class PostViewController: UIViewController {
    
    weak var delegate: PostViewControllerDelegate?
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.setTitle("Add post", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.addTarget(self, action: #selector(addPostPressed), for:.touchUpInside)
        addButton.toAutoLayout()
        return addButton
    }()

    @objc func addPostPressed(){
        print("add post!")
        delegate?.onAddPostPressed()
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(type(of: self), #function)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        title = "Post"
        
        view.backgroundColor = .systemPink
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
