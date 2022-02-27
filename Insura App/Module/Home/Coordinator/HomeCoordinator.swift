//
//  HomeCoordinator.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

final class HomeCoordinator : Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType {.tab}
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let homeVC = HomeViewController()
        let viewModel = HomeViewModel(provider: NetworkProvider())
        homeVC.homeCoordinator = self
        homeVC.homeViewModel = viewModel
        viewModel.fetchData(limit: 10)
        
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func startToDetail(id: Int) {
        let coordinatorDetail = DetailCoordinator(navigationController)
        coordinatorDetail.parentCoordinator = self
        childCoordinators.append(coordinatorDetail)
        coordinatorDetail.startDetail(id: id)
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordin -> Bool in
            return true
        }) {
            childCoordinators.remove(at: index)
        }
    }
    
}
