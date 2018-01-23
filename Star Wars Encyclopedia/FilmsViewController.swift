//
//  TableViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Andy Kwong on 1/22/18.
//  Copyright © 2018 Andy Kwong. All rights reserved.
//

import UIKit
import Foundation

class FilmsViewController: UITableViewController {
    var films = [String]()
    var allFilmInfo = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllFilms { (data, response, error) in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    if let results = jsonResult["results"] {
                        let resultsArray = results as! NSArray
                        self.allFilmInfo = resultsArray
                        for films in resultsArray {
                            if let title = films as? NSDictionary {
                                self.films.append(title["title"] as! String)
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        let cell = UITableViewCell()
        
        cell.textLabel?.text = films[indexPath.row]
        print(films)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "filmsSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! NSIndexPath
        let filmInfo = allFilmInfo[indexPath.row] as! NSDictionary
        
        let filmMoreInfoVC = segue.destination as! FilmsMoreInfoVC
        
        filmMoreInfoVC.filmTitle = filmInfo["title"] as! String
        filmMoreInfoVC.director = filmInfo["director"] as! String
        filmMoreInfoVC.opening = filmInfo["opening_crawl"] as! String
        filmMoreInfoVC.release = filmInfo["release_date"] as! String
        
    }
}
