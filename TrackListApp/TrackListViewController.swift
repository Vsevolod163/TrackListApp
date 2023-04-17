//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by Vsevolod Lashin on 17.04.2023.
//

import UIKit

final class TrackListViewController: UITableViewController {
    
    private var trackList = Track.getTrackList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
}

// MARK: - UITableViewDataSource
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let track = trackList[indexPath.row]
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        cell.contentConfiguration = content
        
        return cell
    }
}
