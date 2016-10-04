//
//  NormalModeTableView.swift
//  masterHTML
//
//  Created by 迫 佑樹 on 2016/10/03.
//  Copyright © 2016年 Yuki Sako. All rights reserved.
//

import UIKit

class NormalModeTableView: UITableView,UITableViewDelegate,UITableViewDataSource{

    var topTitle: String!
    var imageName: String!
    var color: UIColor!
    
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        //Nibの登録
        registerNib(UINib(nibName: "QuizProgressTableViewCell",bundle: nil), forCellReuseIdentifier: "QuizProgressTableViewCell")
        registerNib(UINib(nibName:"NormalModeTableViewCell",bundle:nil), forCellReuseIdentifier: "NormalModeTableViewCell")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //セクション数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //セル数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return 10
        }
    }

    //テーブル高さ
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 200
        } else {
            return 80
        }
    }
    
    //セルの設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCellWithIdentifier("QuizProgressTableViewCell",forIndexPath: indexPath) as! QuizProgressTableViewCell
            
            //トップのセルのパラメータ指定(コントローラでインスタンス作成時にパラメータ作成)
            cell.topImageView.image = UIImage(named: imageName)
            cell.imageMaskView.backgroundColor = self.color
            cell.topLabel.text = self.topTitle
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("NormalModeTableViewCell") as! NormalModeTableViewCell
            return cell
        }
    }
    
    

    
}
