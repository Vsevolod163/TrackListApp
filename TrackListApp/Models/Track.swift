//
//  Track.swift
//  TrackListApp
//
//  Created by Vsevolod Lashin on 17.04.2023.
//

struct Track {
    let artist: String
    let song: String
    
    var title: String {
        "\(artist) \(song)"
    }
    
    static func getTrackList() -> [Track] {
        [
            Track(artist: "RHCP", song: "one"),
            Track(artist: "RHCP", song: "two"),
            Track(artist: "RHCP", song: "three"),
            Track(artist: "RHCP", song: "four"),
            Track(artist: "Gorillas", song: "one"),
            Track(artist: "Gorillas", song: "two"),
            Track(artist: "Nickleback", song: "one"),
            Track(artist: "Nickleback", song: "two"),
            Track(artist: "Nickleback", song: "three"),
            Track(artist: "Nickleback", song: "four")
        ]
    }
}
