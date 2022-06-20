//
//  HomeScreenView.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 20/06/22.
//

import Foundation
import UIKit
import AVFoundation

class HomeScreenView: UIScrollView {
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    private lazy var titleView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Dota Hero"
        return label
    }()

    private lazy var filterControl = FilterControlView()
    private lazy var heroCollectionView = HeroCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelfScrollView()
        addSubview(mainView)
        mainView.addSubview(titleView)
        mainView.addSubview(filterControl)
        mainView.addSubview(heroCollectionView)
        mainView.bringSubviewToFront(filterControl)
        makeConstraints()
    }
    
    func configureSelfScrollView() {
        self.bounces = false
        self.contentInsetAdjustmentBehavior = .never
        self.showsVerticalScrollIndicator = false
    }
    
    private func makeConstraints() {
        // mainView constraints
        mainView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainView.contentHuggingPriority(for: .vertical)
        
        titleView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 50).isActive = true
        titleView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        titleView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
        
    func configure(viewModel: HomeModels.FetchHeroes.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            UIView.animate(
                withDuration: 0.4,
                delay: 0.0,
                options: [.allowUserInteraction],
                animations: { () -> Void in
                    self.mainView.alpha = 1
                }
            )
            
            self.backgroundColor = self.mainView.backgroundColor
            self.heroCollectionView.set(cells: viewModel.heores)
            
            
            self.heroCollectionView.frame = CGRect(x: 0,
                                                   y: self.titleView.frame.maxY + 24,
                                                   width: self.frame.width,
                                                   height: self.frame.height)

            self.filterControl.frame = CGRect(x: self.heroCollectionView.frame.maxX / 2,
                                              y: self.heroCollectionView.frame.maxY - 32,
                                              width: 125,
                                              height: 50)
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
