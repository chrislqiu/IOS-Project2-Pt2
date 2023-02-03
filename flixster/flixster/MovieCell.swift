//
//  MovieCell.swift
//  flixster
//
//  Created by Chris Qiu on 1/26/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBOutlet weak var movieIMG: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    func configure(with movie: Movie) {
        title.text = movie.original_title
        overview.text = movie.overview
        
        //Sync img from Nuke import
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString + movie.poster_path)!, into: movieIMG)
    }
    
    
}
