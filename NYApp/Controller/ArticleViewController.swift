//
//  ViewController.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Alamofire

class ArticleViewController: UIViewController {
 
    var popularArticle:MostPopular?
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setUIDecoration()
        setLocalization()
        
    }
    
    func setUIDecoration(){
        tableView.tableFooterView = UIView()
    }
    
    func setLocalization(){
        self.title = String.NYTimesMostPopular
    }
    
   @objc func loadData(){
        self.startActivityInitialIndicator()
        DataHub.getMostPopular(completion: {mostPopular,error in
            
            if let _ = error{
                self.showToast(errorMessage: true)
            }
            
            if let mostPopular = mostPopular{
                self.popularArticle = mostPopular
                self.tableView.reloadData()
                
            }
            
            self.stopActivityInitialIndicator()
        })
    }
}

extension ArticleViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !(NetworkReachabilityManager()?.isReachable ?? false){
            return 1
        }else{
            return popularArticle?.results?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !(NetworkReachabilityManager()?.isReachable ?? false){
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoInternetMostPopularTableView", for: indexPath) as? NoInternetMostPopularTableView
            cell?.message.text = String.noInternetAccess
            cell?.btnRefresh.addTarget(self, action: #selector(loadData), for: .touchUpInside)
            return cell ?? UITableViewCell()
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainMostPopularTableView", for: indexPath) as?  MainMostPopularTableView
            cell?.source.text = self.popularArticle?.results?[indexPath.row].source
            cell?.published_date.text = self.popularArticle?.results?[indexPath.row].publishedDate
            cell?.abstractArticle.text = self.popularArticle?.results?[indexPath.row].abstract
            cell?.titleArticle.text = self.popularArticle?.results?[indexPath.row].title
            if let imageURL =  self.popularArticle?.results?[indexPath.row].media?.first?.mediaMetadata?.first?.url{
               cell?.imageMedia.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: ""))
            }
            
            cell?.accessoryType = .disclosureIndicator
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !(NetworkReachabilityManager()?.isReachable ?? false){
            return UIScreen.main.bounds.height
        }else{
            return 180
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   ArticleDetailsViewController
        if (NetworkReachabilityManager()?.isReachable ?? false){
            
            if let articleDetailsViewController =  UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailsViewController")as? ArticleDetailsViewController{
                articleDetailsViewController.article = self.popularArticle?.results?[indexPath.row].title ?? ""
                articleDetailsViewController.abstraction = self.popularArticle?.results?[indexPath.row].abstract ?? ""
                
                self.navigationController?.pushViewController(articleDetailsViewController, animated: true)
            }
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class MainMostPopularTableView:UITableViewCell{
  
    @IBOutlet var source: UILabel!
    
    @IBOutlet var imageMedia: UIImageView!
    @IBOutlet var published_date: UILabel!
    @IBOutlet var abstractArticle: UILabel!
    @IBOutlet var titleArticle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageMedia.clipsToBounds = true
        imageMedia.layer.masksToBounds = true
        imageMedia.layer.cornerRadius = imageMedia.frame.width/2
    }
}

class NoInternetMostPopularTableView:UITableViewCell{
    
    @IBOutlet var btnRefresh: UIButton!
    @IBOutlet var message: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnRefresh.setTitle(String.refresh, for: .normal)
    }
}
