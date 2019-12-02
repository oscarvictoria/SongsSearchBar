//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var searchBar: UISearchBar!
    
@IBOutlet weak var tableView: UITableView!
    

    var someSong = [Song]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
        
    }
    
    func loadData() {
        someSong = Song.loveSongs
    }

    
    func filterSongs(for searchText: String) {
        guard !searchText.isEmpty else { return }
        someSong = Song.loveSongs.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let songDVC = segue.destination as? DetailSongController,
            let indexPath = tableView.indexPathForSelectedRow else {
                fatalError("error")
        }
        
        let songs = someSong[indexPath.row]
        songDVC.songSegue = songs
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        someSong.count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = someSong[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchText = searchBar.text else { return }
        
        filterSongs(for: searchText)
    }
    
    
    
}
