//
//  HeroCollectionView.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 20/06/22.
//

import Foundation
import UIKit

class HeroCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var cells: [DotaHeroResponse]?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        register(HeroCollectionCell.self, forCellWithReuseIdentifier: HeroCollectionCell.reuseId)
    }
    
    func set(cells: [DotaHeroResponse]){
        self.cells = cells
        reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cells = cells else { return 0 }
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: HeroCollectionCell.reuseId, for: indexPath) as! HeroCollectionCell
        guard let cells = cells else { return cell}
        cell.set(data: cells[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (bounds.size.width - 32) / 2
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
