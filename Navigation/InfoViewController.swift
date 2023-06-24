//
//  InfoViewController.swift
//  Navigation
//
//  Created by Is Re on 24/06/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Info"
        view.backgroundColor = .systemBackground
        
        let button = UIButton(type: .system)
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showAlert() {
        let alertController = UIAlertController(title: "Alert", message: "This is an example alert", preferredStyle: .alert)

        let action1 = UIAlertAction(title: "Action 1", style: .default) { _ in
            print("Action 1 tapped")
        }
        alertController.addAction(action1)

        let action2 = UIAlertAction(title: "Action 2", style: .default) { _ in
            print("Action 2 tapped")
        }
        alertController.addAction(action2)

        present(alertController, animated: true, completion: nil)
    }
}
