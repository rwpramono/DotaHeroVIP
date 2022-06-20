//
//  HomeVCTests.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import XCTest
@testable import DotaHeroVIP

final class HomeViewControllerTests: XCTestCase {
    private var sut: HomeViewController!
    private var interactor: HomeBusinessLogicSpy!
    private var window: UIWindow!
        
    override func setUp() {
        super.setUp()
        
        let mainWindow = UIWindow()
        let homeViewController = HomeViewController()
        let homeInteractor = HomeBusinessLogicSpy()
        
        homeViewController.interactor = homeInteractor
        
        sut = homeViewController
        interactor = homeInteractor
        window = mainWindow
        
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    override func tearDown() {
        sut = nil
        interactor = nil
        window = nil
        
        super.tearDown()
    }
        
    func testViewDidLoad() {
        sut.viewWillAppear(true)
        
        XCTAssertFalse(interactor.isCalledFetchHeroes)
    }
}
