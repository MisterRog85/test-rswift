//
//  ViewController.swift
//  test-r
//
//  Created by William Tomas on 22/01/2020.
//  Copyright © 2020 William Tomas. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    //pour la présentation de storyboard
    @IBAction func afficherListe(_ sender: UIButton) {
        let storyboard = R.storyboard.liste()
        let rootViewController = storyboard.instantiateViewController(withIdentifier: R.storyboard.liste.name)
        self.present(rootViewController, animated: true, completion: nil)
    }
    
    //pour l'animation on utilise "name"
    let animationView = AnimationView(name: R.file.outlineJson.name)
    
    //pour les fichiers JSON on utilise le path (renvoie un ?)
    let tmp = R.file.testJson.path()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //les images sont accessibles depuis le sous menu image
        image.image = R.image.lol()
        
        //les strings sont seulement accessibles si on utilise des fichiers localized
        label.text = R.string.localized.alert_menu()
        
        //changement de font
        if let font = R.font.jetBrainsMonoRegular(size: 25) {
            label.font = font
        }
        
        //changement de couleur
        if let color = R.color.monBleu() {
            label.textColor = color
        }
        
        staticAnim()
        
        if let path = tmp {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                print("jsonData:\(jsonResult)")
            } catch {
                
            }
        }
        
    }

    func staticAnim() {
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        self.view.addSubview(animationView)

        animationView.play(fromProgress: 0, toProgress: 1)
    }

}

