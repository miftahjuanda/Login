//
//  TabBarPage.swift
//  Insura App
//
//  Created by Miftah Juanda Batubara on 22/02/22.
//

import Foundation
import UIKit

enum TabBarPage {
    case home
    case profile
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .home
        case 1:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .home:
            return 0
        case .profile:
            return 1
        }
    }
    
    func pageImageItem() -> UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .profile:
            return UIImage(systemName: "person")!
        }
    }
}
