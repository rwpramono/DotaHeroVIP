//
//  HomeScreenModel.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import UIKit

enum HomeModels {
    enum FetchHeroes {
        struct Request {}
        
        struct Response {
            let heores: [DotaHeroResponse]
        }
        
        struct ViewModel {
            let heores: [DotaHeroResponse]
        }
    }
        
    enum SelectHero {
        struct Request {
            let index: Int
        }
    }
}
