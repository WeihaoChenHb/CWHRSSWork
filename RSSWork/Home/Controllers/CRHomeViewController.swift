//
//  CRHomeViewController.swift
//  RSSWork
//
//  Created by weihao on 2021/10/18.
//

import UIKit

class CRHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    var containerListView : UICollectionView!,
        layout : UICollectionViewFlowLayout!,
        dataSource : Array<Any>!
    let cellRegiestId = "CRHomeListCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupUI() {
        
    }
    
    private func setupContainerView() {
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        containerListView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        containerListView.delegate = self
        containerListView.dataSource = self
        containerListView.showsVerticalScrollIndicator = false
        containerListView.showsHorizontalScrollIndicator = false
        containerListView.register(CRHomeListCollectionViewCell.self, forCellWithReuseIdentifier: cellRegiestId)
        self.view.addSubview(containerListView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRegiestId, for: indexPath)
        
        return cell
    }
    
}
