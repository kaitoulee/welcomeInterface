//
//  ViewController.swift
//  welcomeInterface
//
//  Created by kaitouLee on 16/7/10.
//  Copyright © 2016年 kaitou Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

//    闭包属性  用于跳转页面
    var startclosure:(()-> Void)?
    //创建scrollView
    let scrollView = UIScrollView()
    //创建pageController
    let pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        //设置scrollView的大小
        scrollView.frame = self.view.bounds
        //设置scrollView的内容大小,横向宽度等于图片数目乘以宽度,高度为0,不滚动
        scrollView.contentSize = CGSizeMake(self.view.frame.width*4, 0)
        //设置分页
        scrollView.pagingEnabled = true
        //去除弹簧效果
        scrollView.bounces = false
        //去除横向的滚动条
        scrollView.showsHorizontalScrollIndicator = false
        //设置代理
        scrollView.delegate = self
        //设置居中和坐标
        pageControl.center = CGPoint(x: self.view.frame.width/2,y:self.view.frame.height-50)
        //设置当前页面指示颜色
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        //设置指示颜色
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        //设置页数
        pageControl.numberOfPages = 4
        //pageControl的值变动时调用方法
        pageControl.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        //添加背景图片
        for var i = 0 ; i < 4 ; i++ {
            let image = UIImage(named: "\(i+1)")
            let imageView = UIImageView(frame: self.view.frame)
            imageView.image = image
            var frame = imageView.frame
            //x轴等于当前的i乘以宽度 等于偏移宽度
            frame.origin.x = CGFloat(i) * frame.size.width
            //设置imageView的frame
            imageView.frame = frame
            //给最后一个导航页上添加一个进入按钮 进入主页
            if i == 3 {
                let btn = UIButton(frame:CGRect(x: self.view.frame.width/2-60, y:self.view.frame.height/2+100,width:120, height: 40))
                btn.layer.cornerRadius = 10
                btn.backgroundColor = UIColor.redColor()
                btn.setTitle("进入", forState: UIControlState.Normal)
                btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
                btn.addTarget(self, action: "startAction", forControlEvents: UIControlEvents.TouchUpInside)
                imageView.addSubview(btn)
                imageView.userInteractionEnabled = true
            }
            //添加子视图
            scrollView.addSubview(imageView)
        }
        //添加子视图
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        
    }
    
    func startAction(sender:UIButton) {
        startclosure!()
    }
    
    //pageControl的值变动时调用的方法
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //获取index
        let index = scrollView.contentOffset.x/self.view.frame.width
        //设置当前页面
        pageControl.currentPage = Int(index)
        //添加子视图
        self.view.addSubview(pageControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

