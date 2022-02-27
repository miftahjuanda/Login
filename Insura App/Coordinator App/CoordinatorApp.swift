//
//  CoordinatorApp.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 22/02/22.
//

import UIKit


protocol AppCoordinatorProtocol: Coordinator {
    func showLoginFlow()
    func showMainFlow()
}

//Coordinator pattern app
final class CoordinatorApp: AppCoordinatorProtocol {
    
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType {.app}
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func start() {
        showLoginFlow()
    }
    
    func showLoginFlow() {
        let loginCoordinator = LoginCoordinator.init(navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    func showMainFlow() {
        let tabCoordinator = TabbarCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
    
}

extension CoordinatorApp: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type})
        
        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()
            showLoginFlow()
        case .login:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        default:
            break
        }
    }
}
