//
//  HomeDisplayLogicSpy.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation
@testable import DotaHeroVIP

final class HomeDisplayLogicSpy: HomeDisplayLogic {
    private(set) var isCalledDisplayFetch = false

    func displayFetchedHeroes(_ viewModel: HomeModels.FetchHeroes.ViewModel) {
        isCalledDisplayFetch = true
    }
}
