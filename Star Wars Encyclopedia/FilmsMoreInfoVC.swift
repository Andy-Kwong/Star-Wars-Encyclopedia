//
//  FilmsMoreInfoVC.swift
//  Star Wars Encyclopedia
//
//  Created by Andy Kwong on 1/22/18.
//  Copyright © 2018 Andy Kwong. All rights reserved.
//

import UIKit

class FilmsMoreInfoVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var filmTitle = ""
    var release = ""
    var director = ""
    var opening = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Title: " + filmTitle
        releaseDataLabel.text = "Release Date: " + release
        directorLabel.text = "Director: " + director
        openingCrawlLabel.text = "Opening Crawl" + opening
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
