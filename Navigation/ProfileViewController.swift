//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Is Re on 24/06/23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
        title = post.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Профиль"
    }
}
