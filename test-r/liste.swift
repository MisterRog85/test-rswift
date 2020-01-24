//
//  listeVC.swift
//  test-r
//
//  Created by William Tomas on 23/01/2020.
//  Copyright © 2020 William Tomas. All rights reserved.
//

import UIKit

class liste: UIViewController {
    
    @IBOutlet weak var laListe: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        laListe.dataSource = self
        laListe.delegate = self
        
        let nib = UINib(nibName: "cell", bundle: nil)
        laListe.register(nib, forCellReuseIdentifier: "cell")
        
        //ajout cellule a une liste
        laListe.register(R.nib.cell)
    }
}

extension liste: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tmp = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.cell, for: indexPath) {
            cell.textLabel?.text = "Hello World !"
            return cell
        }
        return tmp
    }
}
