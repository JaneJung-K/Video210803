//
//  ViewController.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import UIKit
import Kingfisher

class ViewController: UITableViewController {
    
    lazy var videoManager = VideoManager()
    var videoData: [Video] = []
    
    @IBOutlet var vTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.vTableView.rowHeight = 150
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        videoManager.getVideo { [weak self] response in
            self?.videoData = response.videos
            self?.tableView.reloadData()
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! VTableViewCell
        let url = URL(string: videoData[indexPath.row].image)
        cell.vImage.kf.setImage(with: url)
        cell.vName.text = videoData[indexPath.row].user.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

}

class VTableViewCell: UITableViewCell {
    
    @IBOutlet weak var vImage: UIImageView!
    @IBOutlet weak var vName: UILabel!
    
}
