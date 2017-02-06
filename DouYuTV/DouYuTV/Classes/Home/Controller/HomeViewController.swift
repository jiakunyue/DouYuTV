//
//  HomeViewController.swift
//  DouYuTV
//
//  Created by Justin on 2017/1/24.
//  Copyright © 2017年 jerei. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 35

class HomeViewController: UIViewController {
    
    // MARK: - 懒加载
    fileprivate lazy var pageTitleView : PageTitleView = { [weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        let contentH = kScreenH - (kStatusBarH + kNavigationBarH + kTitleViewH)
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var childVCs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)), CGFloat(arc4random_uniform(255)))
            childVCs.append(vc)
        }
        let contentView = PageContentView(frame: contentFrame, childVCs: childVCs, parentViewController: self)
        
        return contentView
    }()
    
    // MARK: - 系统回调
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupUI()
    }

}


// MARK:- UI相关
extension HomeViewController {
    
    fileprivate func setupUI() {
        
        automaticallyAdjustsScrollViewInsets = false
        
        // 设置导航栏
        setupNav()
        
        // 添加 titleView
        view.addSubview(pageTitleView)
        
        // 添加容器视图
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.red
    }
    
    // 设置导航栏
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: #imageLiteral(resourceName: "logo"), hightName: #imageLiteral(resourceName: "logo"))
        
        let size = CGSize(width: 30, height: 30)
        let historyBtn = UIBarButtonItem(imageName: #imageLiteral(resourceName: "image_my_history"), hightName: #imageLiteral(resourceName: "Image_my_history_click"), size: size)
        let searchBtn = UIBarButtonItem(imageName: #imageLiteral(resourceName: "btn_search"), hightName: #imageLiteral(resourceName: "btn_search_clicked"), size: size)
        let qrcodeBtn = UIBarButtonItem(imageName: #imageLiteral(resourceName: "Image_scan"), hightName: #imageLiteral(resourceName: "Image_scan_click"), size: size)
        
        navigationItem.rightBarButtonItems = [historyBtn, searchBtn, qrcodeBtn]
    }
}

// MARK:- PageTitleViewDelegate
extension HomeViewController : PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}
