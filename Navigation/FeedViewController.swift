//
//  FeedViewController.swift
//  Navigation
//
//  Created by Is Re on 24/06/23.
//

import UIKit

class FeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Лента"
        let button = UIButton(type: .system)
        button.setTitle("Показать пост", for: .normal)
        button.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
            
        view.addSubview(button)
            
            
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        @objc private func showPost() {
            let post = Post(title: "Пример поста")
            let postViewController = PostViewController()
            postViewController.post = post
            navigationController?.pushViewController(postViewController, animated: true)
        }
        
        
        
    }

