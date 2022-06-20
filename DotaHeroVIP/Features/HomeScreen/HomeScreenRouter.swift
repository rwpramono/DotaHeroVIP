//
//  HomeScreenRouter.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import UIKit

protocol HomeRoutingLogic {
    func routeToDetails()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

final class HomeRouter: HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
        
    func routeToDetails() {

    }
}
