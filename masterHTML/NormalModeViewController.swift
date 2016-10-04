//
//  NormalModeViewController.swift
//  masterHTML
//
//  Created by 迫 佑樹 on 2016/10/03.
//  Copyright © 2016年 Yuki Sako. All rights reserved.
//

import UIKit

class NormalModeViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var headerView: UIView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    //テキストブックページのテーブルビューのトップのパラメータ
    let textbookTitle = "はじめてのHTML"
    let textbookColor = UIColor(red: 92.0/255, green: 192.0/255, blue: 215.0/255, alpha: 1.0)
    let textbookImageName = "top_study.jpg"
    
    //クイズページのテーブルビューのトップのパラメータ
    let quizTitle = "HTMLクイズ100問"
    let quizColor = UIColor(red: 195.0 / 255, green: 123.0 / 255, blue: 175.0 / 255, alpha: 1.0)
    let quizImageName = "top_study.jpg"
    
    //タブのボタンを管理する配列
    var tabButtons: Array<UIButton> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self

        self.scrollView.contentSize = CGSizeMake(self.view.frame.width*2, self.view.frame.height)
        self.scrollView.pagingEnabled = true
        
        //上部のタブボタン生成
        setTabButton(self.view.frame.width/3, tag: 1, imageName: "study.png", selectedImageName: "study_selected.png",color: textbookColor)
        setTabButton(self.view.frame.width/3*2, tag: 2,imageName: "quiz.png", selectedImageName: "quiz_selected.png",color: quizColor)
        //解説ページのテーブルビューを表示
        setTableView(0, topTitle: textbookTitle, topColor: textbookColor, imageName: textbookImageName)
        //クイズページ一覧のテーブルビューを表示
        setTableView(self.view.frame.width, topTitle: quizTitle, topColor: quizColor, imageName: quizImageName)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //スクロールによって動いたあとのアクション
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        changeTabButtonColor(scrollView)
    }
    
    //タブボタンのタッチによって動いたあとのアクション
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        changeTabButtonColor(scrollView)
    }

    //タブボタンの色を変えるメソッド
    func changeTabButtonColor(scrollView: UIScrollView){
        if scrollView.contentOffset.x == 0{
            tabButtons[0].selected = true
            tabButtons[0].layer.borderColor = textbookColor.CGColor
            clearOther(1)
        } else if scrollView.contentOffset.x == self.view.frame.width {
            tabButtons[1].selected = true
            tabButtons[1].layer.borderColor = quizColor.CGColor
            clearOther(0)
        }
    }
    
    
    //違うタブボタンのカラーをクリアするメソッド
    func clearOther(unselected: Int){
        tabButtons[unselected].selected = false
        tabButtons[unselected].layer.borderColor = UIColor.whiteColor().CGColor
    }

    //tableViewを生成するためのメソッド
    func setTableView(x:CGFloat, topTitle:String, topColor: UIColor, imageName:String){
        let frame = CGRectMake(x, 0, self.view.frame.width, self.scrollView.frame.height)
        let tableView = NormalModeTableView(frame: frame, style: UITableViewStyle.Plain)
        tableView.topTitle = topTitle
        tableView.color = topColor
        tableView.imageName = imageName
        self.scrollView.addSubview(tableView)
    }
    
    //上部のタブのボタンを生成するためのメソッド
    func setTabButton(x:CGFloat, tag: Int, imageName:String, selectedImageName:String,color:UIColor){
        let tabButton = UIButton()
        tabButton.frame.size = CGSizeMake(44, 44)
        tabButton.center = CGPointMake(x, 44)
        tabButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        tabButton.setTitleColor(color, forState: UIControlState.Selected)
        tabButton.tag = tag
        tabButton.setBackgroundImage(UIImage(named: imageName), forState: UIControlState.Normal)
        tabButton.setBackgroundImage(UIImage(named: selectedImageName), forState: UIControlState.Selected)
        tabButton.addTarget(self, action: #selector(tapButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        tabButton.layer.cornerRadius = tabButton.frame.width / 2
        tabButton.layer.borderColor = UIColor.whiteColor().CGColor
        tabButton.layer.borderWidth = 2
        tabButton.layer.masksToBounds = true
        self.headerView.addSubview(tabButton)
        tabButtons.append(tabButton)
    }
    
    //タブボタンがタップされた後のアクション
    func tapButton(sender: UIButton){
        let moveX = self.view.frame.width * CGFloat(sender.tag-1)
        scrollView.setContentOffset(CGPointMake(moveX,0), animated: true)
    }

    
}


