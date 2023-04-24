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
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        let track = trackList[indexPath.row]
        let detailsVC = segue.destination as? TrackDetailsViewController
        detailsVC?.track = sender as? Track
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
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TrackListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let track = trackList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: track)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let track = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(track, at: destinationIndexPath.row)
    }
}
