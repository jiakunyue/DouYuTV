//
//  MainViewController.swift
//  DouYuTV
//
//  Created by Justin on 2017/1/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Follow")
        addChildVC(storyName: "Profile")
    }
    
    private func addChildVC(storyName : String) {
        let vc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(vc)
    }

}
