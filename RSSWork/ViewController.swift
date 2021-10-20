//
//  ViewController.swift
//  RSSWork
//
//  Created by weihao on 2021/10/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushToHome(_ sender: Any) {
        navigationController?.pushViewController(CRHomeViewController(), animated: true)
    }
}

