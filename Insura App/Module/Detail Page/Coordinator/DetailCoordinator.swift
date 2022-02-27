//
//  DetailCoordinator.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 21/02/22.
//

import UIKit

final class DetailCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType {.tab}
    var parentCoordinator: HomeCoordinator?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {}
    
    func startDetail(id: Int) {
        let detailVC = DetailViewController()
        let viewModel = DetailViewModel(provider: NetworkProvider())
        
        detailVC.detailViewModel = viewModel
        detailVC.detailCoordinator = self
        
        DispatchQueue.main.async {
            viewModel.fetcDetailData(id: id)
            viewModel.fetchDetailComment(id: id)
        }
        navigationController.pushViewController(detailVC, animated: true)
    }
    
}
