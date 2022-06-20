//
//  HomeInteractorTests.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import XCTest
@testable import DotaHeroVIP

final class HomeInteractorTests: XCTestCase {
    private var sut: HomeInteractor!
    private var worker: HomeWorkingLogicSpy!
    private var presenter: HomePresentationLogicSpy!
        
    override func setUp() {
        super.setUp()
        
        let homeInteractor = HomeInteractor()
        let homeWorker = HomeWorkingLogicSpy()
        let homePresenter = HomePresentationLogicSpy()
        
        homeInteractor.worker = homeWorker
        homeInteractor.presenter = homePresenter
        
        sut = homeInteractor
        worker = homeWorker
        presenter = homePresenter
    }
    
    override func tearDown() {
        sut = nil
        worker = nil
        presenter = nil
        
        super.tearDown()
    }
        
    func testFetchHeroes() {
        let request = HomeModels.FetchHeroes.Request()
        
        sut.fetchDatas(request)
        
        XCTAssert(worker.isCalledFetchHeroes)
        XCTAssertFalse(presenter.isCalledPresentFetche)
    }
}
