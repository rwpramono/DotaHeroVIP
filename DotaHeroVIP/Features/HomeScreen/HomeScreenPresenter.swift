//
//  HomeScreenPresenter.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation

protocol HomePresentationLogic {
    func presentFetchedHeroes(_ response: HomeModels.FetchHeroes.Response)
}

final class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
        
    func presentFetchedHeroes(_ response: HomeModels.FetchHeroes.Response) {
        let sortedUsers = response.heores.sorted { $0.id < $1.id }
        let viewModel = HomeModels.FetchHeroes.ViewModel(heores: sortedUsers)
        
        viewController?.displayFetchedHeroes(viewModel)
    }
}
