//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Is Re on 10/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    struct Post {
        let title: String
    }
    
        
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
    
    class PostViewController: UIViewController {

        var post: Post?

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .systemBackground

            if let post = post {
                title = post.title
            }
            
            let infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(showInfo))
            navigationItem.rightBarButtonItem = infoButton
        }

        @objc private func showInfo() {
            let infoViewController = InfoViewController()
            let navigationController = UINavigationController(rootViewController: infoViewController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
    
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


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarController()

        let feedViewController = FeedViewController()
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedNavigationController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "list.bullet"), tag: 0)

        let post = Post(title: "Пост")
        let profileViewController = ProfileViewController(post: post)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)

        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
    
   

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }




