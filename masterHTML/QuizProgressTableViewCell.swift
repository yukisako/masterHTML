//
//  QuizProgressTableViewCell.swift
//  masterHTML
//
//  Created by 迫 佑樹 on 2016/10/03.
//  Copyright © 2016年 Yuki Sako. All rights reserved.
//

import UIKit

class QuizProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var imageMaskView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setImageView()
        setImageMask()
        setTopLabel()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImageView(){
        self.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        self.imageView?.layer.masksToBounds = true
    }
    
    func setImageMask(){
        self.imageMaskView.alpha = 0.6
    }
    
    func setTopLabel(){
        topLabel.textAlignment = NSTextAlignment.Center
        topLabel.font = UIFont(name: "Helvetica-Bold", size: 40)
        topLabel.textColor = UIColor.whiteColor()
        topLabel.alpha = 1.0
    }
}
