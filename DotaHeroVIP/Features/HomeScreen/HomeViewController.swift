//
//  HomeViewController.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayFetchedHeroes(_ viewModel: HomeModels.FetchHeroes.ViewModel)
}

final class HomeViewController: UIViewController {
    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
        
    private var heroes: [DotaHeroResponse] = []
    private lazy var homeScreenView = HomeScreenView()

    private func setup() {
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
        
        self.interactor = interactor
        self.router = router
        self.view.backgroundColor = .white
        self.title = "Heroes"
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        view.addSubview(homeScreenView)
        homeScreenView.frame = view.frame

        requestToFetchHeroes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestToFetchHeroes()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeScreenView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
    }
        
    private func requestToFetchHeroes() {
        let request = HomeModels.FetchHeroes.Request()
        interactor?.fetchDatas(request)
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displayFetchedHeroes(_ viewModel: HomeModels.FetchHeroes.ViewModel) {
        homeScreenView.configure(viewModel: viewModel)
    }
}
