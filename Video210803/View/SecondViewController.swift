//
//  SecondViewController.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import UIKit
import Kingfisher
import AVKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var userIndex: Int?
    var nTitle: String?
    var videoData2: [Video] = []
    var isPlaying: Bool = false
    var player: AVPlayer?
    var count = 0
    
    @IBOutlet weak var plyButton: UIButton!
    
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    @IBOutlet weak var thumnail: UIImageView!
    
    private func setupPlayerView() {
        let url = URL(string: (self.videoData2[self.userIndex!].videoFiles[0].link))
                
        player = AVPlayer(url: url!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.thumnail.bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.thumnail.layer.insertSublayer(playerLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewDidLoad() {
        self.title = nTitle!
        let url = URL(string: (self.videoData2[self.userIndex!].image))
        self.thumnail.kf.setImage(with: url)
        
        plyButton.addTarget(self, action: #selector(handlePause), for: .touchUpInside)
        
    }
    
    @objc func handlePause() {
        count += 1
        
        if count == 1 {
            setupPlayerView()
        }
        
        if isPlaying {
            player?.pause()
            plyButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player?.play()
            plyButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        
        isPlaying = !isPlaying
        print(isPlaying)
    }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let pictureData = self.videoData2[self.userIndex!].videoPictures
        return pictureData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserPicture
        let pictureIndex = self.videoData2[self.userIndex!].videoPictures
        let url = URL(string: (pictureIndex[indexPath.row].picture))
        cell.userPicture.kf.setImage(with: url)
        return cell
    }
    
}

extension SecondViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 8
        let itemSpacing: CGFloat = 10
        //let width = 100
        let width = (collectionView.bounds.height - margin * 2 - itemSpacing * 2) / 4
        return CGSize(width: width, height: 100)
    }
    
}

class UserPicture: UICollectionViewCell {
    @IBOutlet weak var userPicture: UIImageView!
}
