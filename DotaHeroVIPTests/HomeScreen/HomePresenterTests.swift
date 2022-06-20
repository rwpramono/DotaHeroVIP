//
//  HomePresenterTests.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import XCTest
@testable import DotaHeroVIP

final class HomePresenterTests: XCTestCase {
    
    private var sut: HomePresenter!
    private var viewController: HomeDisplayLogicSpy!
    
    override func setUp() {
        super.setUp()
        
        let homePresenter = HomePresenter()
        let homeViewController = HomeDisplayLogicSpy()
        
        homePresenter.viewController = homeViewController
        
        sut = homePresenter
        viewController = homeViewController
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    
}
