//
//  ArticleDetailsViewController.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/20/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    var article:String = ""
    var abstraction:String = ""
    @IBOutlet var articleTitle: UILabel!
    @IBOutlet var articleAbstraction: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocalization()
        setData()
    }
    
    func setData(){
        articleTitle.text = article
        articleAbstraction.text = abstraction
    }
    
    func setLocalization(){
      self.title = String.NYTimesMostPopular
    }
}
