//
//  CRHomeViewController.swift
//  RSSWork
//
//  Created by weihao on 2021/10/18.
//

import UIKit
import SnapKit

class CRHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    var containerListView : UICollectionView!,
        layout : UICollectionViewFlowLayout!,
        dataSource : Array<CRFeedStoreModel>!
    let cellRegiestId = "CRHomeListCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = defaultFeeds()
        
        setupUI()
    }
    
    private func setupUI() {
        setupContainerView()
    }
    
    private func setupContainerView() {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        containerListView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        containerListView.delegate = self
        containerListView.dataSource = self
        containerListView.showsVerticalScrollIndicator = false
        containerListView.showsHorizontalScrollIndicator = false
        containerListView.backgroundColor = .white
        containerListView.register(CRHomeListCollectionViewCell.self, forCellWithReuseIdentifier: cellRegiestId)
        self.view.addSubview(containerListView)
        
        containerListView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRegiestId, for: indexPath) as! CRHomeListCollectionViewCell
        
        let storeModel = self.dataSource[indexPath.row]
        
        cell.fillData(withStoreModel: storeModel)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenWidth, height: w_ratio(100));
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storeModel = self.dataSource[indexPath.row]
        requestRSSList(rssUrl: storeModel.xmlLink) { (data) in
            
        }
    }
    
    
}
