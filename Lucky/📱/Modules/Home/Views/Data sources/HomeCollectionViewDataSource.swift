//
//  HomeCollectionViewDataSource.swift
//  Lucky
//
//  Created by Emiliano Da luz on 07/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import Foundation
import UIKit

protocol HomeDataSourceProtocol {
    var delegate: HomeDataSourceDelegate? { get set }
    func setSections(_ sections: [HomeSectionModel])
}

protocol HomeDataSourceDelegate {
    func didSelectItem(promotion: PromotionModel)
}

class HomeCollectionViewDataSource: NSObject, HomeDataSourceProtocol, UICollectionViewDelegate {
    var delegate: HomeDataSourceDelegate?
    private var sections: [HomeSectionModel] = []
    
    weak var collectionView: UICollectionView? {
        didSet {
            setupCollectionView()
        }
    }
    
    func setSections(_ sections: [HomeSectionModel]) {
        self.sections = sections
        self.collectionView?.reloadData()
    }
    
    private func setupCollectionView() {
        collectionView?.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        collectionView?.register(UINib.init(nibName: "TitleCell", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TitleCell")
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
}

extension HomeCollectionViewDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].promotions.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        let promotion = section.promotions[indexPath.row]
        
        guard let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(promotion)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TitleCell", for: indexPath) as? TitleCell else {
                return UICollectionReusableView()
            }

            view.setHeaderTitle(sections[indexPath.section].title)
            return view
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 90)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        let promotion = section.promotions[indexPath.row]
        delegate?.didSelectItem(promotion: promotion)
    }
}

extension HomeCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
