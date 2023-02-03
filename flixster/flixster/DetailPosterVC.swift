//
//  DetailPosterVC.swift
//  flixster
//
//  Created by Chris Qiu on 2/3/23.
//

import UIKit
import Nuke

class DetailPosterVC: UIViewController {
    
    var movie: Movie!
    var posters: Poster!
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var film: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + posters.poster_path)!, into: poster)
            
            film.text = posters.original_title;
            overview.text = posters.overview;
        
            
        }
    
    
    
}
