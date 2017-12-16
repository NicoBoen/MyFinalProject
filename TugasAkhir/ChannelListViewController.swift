//
//  ChannelListViewController.swift
//  TugasAkhir
//
//  Created by iosdev on 11/25/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit
import Firebase

class ChannelListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "profilesegue", sender: nil)
    }
    
}
