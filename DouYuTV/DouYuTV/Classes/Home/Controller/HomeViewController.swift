//
//  HomeViewController.swift
//  DouYuTV
//
//  Created by Justin on 2017/1/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}


// MARK:- UI相关
extension HomeViewController {
    
    fileprivate func setupUI() {
        setupNav()
    }
    
    private func setupNav() {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "logo"), for: .normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        let size = CGSize(width: 30, height: 30)
        let historyBtn = UIBarButtonItem(imageName: #imageLiteral(resourceName: "image_my_history"), hightName: #imageLiteral(resourceName: "Image_my_history_click"), size: size)
        let searchBtn = UIBarButtonItem(imageName: #imageLiteral(resourceName: "btn_search"), hightName: #imageLiteral(resourceName: "btn_search_clicked"), size: size)
        let qrcodeBtn = UIBarButtonItem(imageName: #imageLiteral(resourceName: "Image_scan"), hightName: #imageLiteral(resourceName: "Image_scan_click"), size: size)
        
        navigationItem.rightBarButtonItems = [historyBtn, searchBtn, qrcodeBtn]
    }
}
