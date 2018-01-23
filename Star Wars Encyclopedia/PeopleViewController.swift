//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Andy Kwong on 1/22/18.
//  Copyright © 2018 Andy Kwong. All rights reserved.
//

import UIKit
import Foundation

class PeopleViewController: UITableViewController {
    // Hardcoded data for now
    var people = [String]()
    var allInfo = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople { (data, response, error) in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] {

                        let resultsArray = results as! NSArray
                        self.allInfo = resultsArray
                        
                        for person in resultsArray {
                            if let character = person as? NSDictionary {
                                self.people.append(character["name"] as! String)
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
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        print(people)
        // return the cell so that it can be rendered
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "peopleSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! NSIndexPath
        let characterInfo = allInfo[indexPath.row] as! NSDictionary
        
        let peopleMoreInfoVC = segue.destination as! PeopleMoreInfoVC
        
        peopleMoreInfoVC.name = characterInfo["name"] as! String
        peopleMoreInfoVC.gender = characterInfo["gender"] as! String
        peopleMoreInfoVC.birthyear = characterInfo["birth_year"] as! String
        peopleMoreInfoVC.mass = characterInfo["mass"] as! String
    }
}

