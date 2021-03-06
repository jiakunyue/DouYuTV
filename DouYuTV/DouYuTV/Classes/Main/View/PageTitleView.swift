//
//  PageTitleView.swift
//  DouYuTV
//
//  Created by Justin on 2017/1/25.
//  Copyright © 2017年 jerei. All rights reserved.
//

import UIKit


protocol PageTitleViewDelegate : class {
    func pageTitleView(titleView : PageTitleView, selectedIndex index : Int)
}
private let kScrollLineH: CGFloat = 2

class PageTitleView: UIView {
    // MARK:- 定义属性
    fileprivate var titles : [String]
    fileprivate var currentIndex : Int = 0
    weak var delegate : PageTitleViewDelegate?
    // MARK:- 懒加载
    fileprivate lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK:- 设置 UI
extension PageTitleView {
    
    fileprivate func setupUI() {
        // 添加 UIscrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        // 添加 title 对应的 Label
        setupTitleLabels()
        
        // 添加底部对应的线条
        setupBottomLineAndScrollLine()
    }
    
    private func setupTitleLabels() {
        
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kScrollLineH
        let labelY: CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            
            let labelX: CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(PageTitleView.titleLabelClick))
            label.addGestureRecognizer(tapGes)
        }
    }
    
    private func setupBottomLineAndScrollLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange
        
        scrollView.addSubview(scrollLine)
        
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

// MARK:- 监听 label 的点击
extension PageTitleView {
    @objc fileprivate func titleLabelClick(tapGes : UITapGestureRecognizer) {
        guard let currentLabel = tapGes.view as? UILabel else { return }
        let oldLabel = titleLabels[currentIndex]
        currentLabel.textColor = UIColor.orange
        oldLabel.textColor = UIColor.darkGray
        currentIndex = currentLabel.tag
        let scrollLineX = CGFloat(currentLabel.tag) * scrollLine.frame.width
        UIView.animate(withDuration: 0.15) { 
            self.scrollLine.frame.origin.x = scrollLineX
        }
        
        delegate?.pageTitleView(titleView: self, selectedIndex: currentIndex)
    }
}
