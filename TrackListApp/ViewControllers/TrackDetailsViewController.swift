//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by Vsevolod Lashin on 17.04.2023.
//

import UIKit

final class TrackDetailsViewController: UIViewController {

    @IBOutlet var artCoverImageView: UIImageView!
    @IBOutlet var trackTitleLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artCoverImageView.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
    }
}
