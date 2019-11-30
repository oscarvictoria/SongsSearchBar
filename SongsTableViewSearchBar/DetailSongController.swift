//
//  DetailSongController.swift
//  SongsTableViewSearchBar
//
//  Created by Oscar Victoria Gonzalez  on 11/30/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailSongController: UIViewController {
    
    
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailArtistLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var songSegue: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let song = songSegue else {
            fatalError("error")
        }
        detailNameLabel.text = song.name
        detailArtistLabel.text = song.artist
       
    }


}
