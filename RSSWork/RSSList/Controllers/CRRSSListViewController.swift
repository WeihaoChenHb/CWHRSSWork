//
//  CRListViewController.swift
//  RSSWork
//
//  Created by weihao on 2021/10/23.
//

import UIKit

class CRRSSListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
        
    var containerView : UICollectionView!,
        layout : UICollectionViewFlowLayout!,
        dataSource : Array<Any>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupContainer()
    }
    
    private func setupContainer() {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .vertical
        
        containerView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        containerView.delegate = self
        containerView.dataSource = self
        containerView.showsVerticalScrollIndicator = false
        containerView.showsHorizontalScrollIndicator = false
        containerView.register(CRRSSListCollectionViewCell.self, forCellWithReuseIdentifier: CRRSSListCollectionViewCell.cellId)
        view.addSubview(containerView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // MARK: To Be Processed
        
        let cellModel : CRRSSListCollectionViewCellModel = dataSource[indexPath.row] as! CRRSSListCollectionViewCellModel
        
        let cell : CRRSSListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:cellModel.cellId, for: indexPath) as! CRRSSListCollectionViewCell
        
        cell.fillData(cellData: cellModel)
        
        return cell
    }
    
}
