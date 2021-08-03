//
//  SecondViewController.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {
    
    var userIndex: Int?
    var nTitle: String?
    
    lazy private var videoManager = VideoManager()
    private var videoData: [Video] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
        videoManager.getVideo { [weak self] response in
            self?.videoData = response.videos
            if let i = self?.userIndex {
                print(self?.videoData[i].user.name)
                self?.nTitle = self?.videoData[i].user.name
            } else { return }
        }
    }
    
    override func viewDidLoad() {
        self.navigationController?.title = nTitle!
    }
    
}
