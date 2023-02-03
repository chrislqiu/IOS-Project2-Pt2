//
//  PosterViewController.swift
//  flixster
//
//  Created by Chris Qiu on 2/1/23.
//

import UIKit
import Nuke

class PosterViewController: UIViewController, UICollectionViewDataSource {
    
    var poster: [Poster] = []
    var movie: [Movie] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        poster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let poster = poster[indexPath.item]
        let imageUrl = URL(string: Poster.posterBaseURLString + poster.poster_path)!
        Nuke.loadImage(with: imageUrl, into: cell.posterImageView)
        return cell
    }
    
    

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a search URL for fetching albums (`entity=album`)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.minimumInteritemSpacing = 0

        layout.minimumLineSpacing = 10

        let numberOfColumns: CGFloat = 4
        let numberOfRows: CGFloat = 5


        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        let height = (collectionView.bounds.height - layout.minimumInteritemSpacing * (numberOfRows - 1)) / numberOfRows

        layout.itemSize = CGSize(width: width, height: height)
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=0960ca1c8b6aef0f89cd1cf9683fdb98")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PosterSearchResponse.self, from: data)
                let poster = response.results
                DispatchQueue.main.async {
                    self?.poster = poster
                    self?.collectionView.reloadData()
                }
                print(poster)
                self?.poster = poster
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        collectionView.dataSource = self
    }
    
    
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if let cell = sender as? UICollectionViewCell,
               
               let indexPath = collectionView.indexPath(for: cell),
               
               let detailViewController = segue.destination as? DetailPosterVC {

               
                let posters = poster[indexPath.row]
              
                
                detailViewController.posters = posters
            }


        }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
