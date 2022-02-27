//
//  TabbarCoordinator.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 22/02/22.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController {get set}
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
    
}

class TabbarCoordinator: NSObject, Coordinator, UITabBarControllerDelegate {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType {.tab}
    var tabBarController: UITabBarController
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPage] = [.home, .profile]
            .sorted(by: {$0.pageOrderNumber() < $1.pageOrderNumber()})
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabController: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabController tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.home.pageOrderNumber()
        
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.navigationBar.prefersLargeTitles = true
        
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.pageImageItem(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .home:
            let homeCoordinator = HomeCoordinator(navController)
            childCoordinators.append(homeCoordinator)
            homeCoordinator.start()
            
        case .profile:
            let user = UserDefaults.standard.integer(forKey: "id_user")
            
            let profileVC = ProfileViewController()
            let viewModel = ProfileViewModel(provider: NetworkProvider())
            profileVC.profileViewModel = viewModel
            profileVC.profileViewModel?.fetchProfile(id: user)
            navController.pushViewController(profileVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
}
