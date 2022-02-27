//
//  LoginCoordinator.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

final class LoginCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType {.login}
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC: LoginViewController = .init()
        loginVC.didSendEventClosure = { [weak self] event in
            self?.finish()
        }
        
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
}
