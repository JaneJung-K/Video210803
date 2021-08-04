//
//  SecondViewController.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import UIKit
import Kingfisher
import AVKit

class SecondViewController: UIViewController {
    
    var userIndex: Int?
    var nTitle: String?

    
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var thumnail: UIImageView!
    
    lazy private var videoManager = VideoManager()
    private var videoData: [Video] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewDidLoad() {
        self.title = nTitle!
        
        setup()


        }
        
        private func setup() {
            videoManager.getVideo { [weak self] response in

                self?.videoData = response.videos
                let url = URL(string: (self?.videoData[self!.userIndex!].image)!)
                self?.thumnail.kf.setImage(with: url)
                print(self?.videoData[self!.userIndex!].videoPictures.count)
                self?.pictureCollectionView.reloadData()
        }
        
    }
    
}

extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let pictureData = self.videoData[self.userIndex!].videoPictures
        return pictureData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserPicture
        let pictureIndex = self.videoData[self.userIndex!].videoPictures
        let url = URL(string: (pictureIndex[indexPath.row].picture))
        cell.userPicture.kf.setImage(with: url)
        return cell
        
    }
    
    
}

class UserPicture: UICollectionViewCell {
    @IBOutlet weak var userPicture: UIImageView!
}
