//
//  InfoViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var showAlertButton: UIButton = {
        let showAlertButton = UIButton(type: .system)
        showAlertButton.setTitle("Add post", for: .normal)
        showAlertButton.setTitleColor(.red, for: .normal)
        showAlertButton.addTarget(self, action: #selector(showAlertPressed), for:.touchUpInside)
        showAlertButton.toAutoLayout()
        return showAlertButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(showAlertButton)
        
        NSLayoutConstraint.activate([
            showAlertButton.heightAnchor.constraint(equalToConstant: 50),
            showAlertButton.widthAnchor.constraint(equalToConstant: 100),
            showAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func showAlertPressed(){
        showAlert()
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "Удалить пост?", message: "Пост нельзя будет восстановить", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            print("Удалить")
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
