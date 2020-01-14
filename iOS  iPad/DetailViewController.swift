//
//  DetailViewController.swift
//  iOS  iPad
//
//  Created by Sandeep Jangra on 2020-01-14.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var webview: WKWebView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail["url"].stringValue
                if let url = URL(string: detail["url"].stringValue){
                    let request = URLRequest(url: url)
                    webview.load(request)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: JSON? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

