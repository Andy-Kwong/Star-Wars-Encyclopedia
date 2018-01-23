//
//  PeopleMoreInfoVC.swift
//  Star Wars Encyclopedia
//
//  Created by Andy Kwong on 1/22/18.
//  Copyright © 2018 Andy Kwong. All rights reserved.
//

import UIKit

class PeopleMoreInfoVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var name = ""
    var gender = ""
    var birthyear = ""
    var mass = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name: " + name
        genderLabel.text = "Gender: " + gender
        birthYearLabel.text = "Year: " + birthyear
        massLabel.text = "Mass: " + mass + " kg"

        // Do any additional setup after loading the view.
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
