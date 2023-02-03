//
//  DetailViewController.swift
//  flixster
//
//  Created by Chris Qiu on 1/27/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    var movie: Movie!

    
    
    @IBOutlet weak var movIM: UIImageView!
    @IBOutlet weak var moveNM: UILabel!
    
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var voteAVG: UILabel!
    @IBOutlet weak var overVW: UILabel!
    
    @IBOutlet weak var votesNUM: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)!, into: movIM)
        
        moveNM.text = movie.original_title
        voteAVG.text = "VoteAVG: " + String(movie.vote_average)
        votesNUM.text = "Votes: " + String(movie.vote_count)
        popularity.text = "Popularity: " + String(movie.popularity)
        overVW.text = movie.overview
        
        
    }

}
