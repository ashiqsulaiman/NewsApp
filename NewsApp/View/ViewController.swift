//
//  ViewController.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let colours = ColourScheme()
    let ArticleVM = ArticleViewModel()
    let headlineNib = UINib(nibName: "HeadlineCell", bundle: nil)
    let realm = try! Realm()
    @IBOutlet weak var headlinesTable: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        headlinesTable.delegate = self
        headlinesTable.dataSource = self
        getArticles()
    }

    
    func setupUI(){
        //Navbar
        let navBarFont = UIFont.appBoldFontWith(size: 18.0)
        self.navigationController?.navigationBar.isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: colours.navBarTitleColor, .font: navBarFont]
        self.title = "H E A D L I N E S"
        //TableView
        headlinesTable.register(headlineNib, forCellReuseIdentifier: "headlineCell")
        headlinesTable.backgroundColor = colours.bgColor
        headlinesTable.separatorColor = .clear
        //View
        self.view.backgroundColor = colours.bgColor
        
    }
    
    func getArticles(){
        ArticleVM.getArticles { (success) in
            if success {
                self.headlinesTable.reloadData()
            }
        }
    }
}

