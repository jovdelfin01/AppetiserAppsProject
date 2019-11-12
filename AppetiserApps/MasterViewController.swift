//
//  MasterViewController.swift
//  AppetiserApps
//
//  Created by Jovin Delfin on 11/10/19.
//  Copyright © 2019 JovElevin. All rights reserved.
//

import UIKit



class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    var songs = [Music]()
    var cellId = "cellIdSongs"

    override func viewDidLoad() {
        super.viewDidLoad()


//        if let split = splitViewController {
//            let controllers = split.viewControllers
//            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
        
        self.tableView.register(ITunesTableCell.self, forCellReuseIdentifier: cellId)
        self.tableView.rowHeight = 90
	
        fetchData()
        
    }
    
    fileprivate func fetchData() {
        let itunesString = "https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all"

                if let url = URL(string: itunesString) {
                   URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    guard let data = data else { return }
                    if let jsonString = String(data: data, encoding: .utf8) {
                         print(jsonString)
                    }
                    
                    do {
                        let decoder = JSONDecoder()
                        let product = try decoder.decode(MusicResultsAPI.self, from: data)

                        print(product.resultCount)
                        print(product.results)

                        self.songs = product.results
                        DispatchQueue.main.async {
                            //Do UI Code here.
                            self.tableView.reloadData()
                        }
                        
                    } catch let jsonErr {
                        print("Error serializing json:", jsonErr)
                    }
                    
                   }.resume()
                }
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        UserDefaults.standard.set("master", forKey: "currentController")
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let object = objects[indexPath.row] as! NSDate
//        cell.textLabel!.text = object.description
//        return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ITunesTableCell
        cell.music = songs[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        print(song.trackName)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(identifier: "DetailVC") as? DetailViewController else { return }
        controller.music = song
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }


}

