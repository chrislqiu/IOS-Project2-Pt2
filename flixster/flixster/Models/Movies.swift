//
//  Movies.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import Foundation

struct MoviesResponse: Decodable {
    var results: [Movie]
    
    static func loadJson() -> [Movie] {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesResponse.self, from: data)
                return jsonData.results
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}

struct Movie: Decodable {
    var original_title: String
    var overview: String
    
    var poster_path: String // when loading image with Nuke, make sure you convert to url by prepending base url
    static var posterBaseURLString: String = "https://image.tmdb.org/t/p/w185"
    
    var popularity: Double
    var vote_average: Double
    var vote_count: Int
}
/*
extension Movie {
 static var movieList: [Movie] = [Movie(original_title: "Puss in Boots: The Last Wish", overview: "Puss in Boots discovers that his passion for adventure has taken its toll: He has burned through eight of his nine lives, leaving him with only one life left. Puss sets out on an epic journey to find the mythical Last Wish and restore his nine lives.", poster_path:  "/kuf6dutpsT0vSVehic3EZIqkOBt.jpg", popularity: "Popularity: 9062", vote_average: "Vote AVG: 8.6", vote_count: "Vote: 2077"), Movie(original_title: "M3GAN", overview: "A brilliant toy company roboticist uses artificial intelligence to develop M3GAN, a life-like doll programmed to emotionally bond with her newly orphaned niece. But when the doll's programming works too well, she becomes overprotective of her new friend with terrifying results.", poster_path: "/7CNCv9uhqdwK7Fv4bR4nmDysnd9.jpg", popularity: "Popularity: 2679.327", vote_average: "Vote AVG: 7", vote_count: "Vote: 321"), Movie(original_title: "Avatar: The Way of Water", overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.", poster_path: "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg", popularity: "Popularity: 2619.368", vote_average: "Vote AVG: 7.7", vote_count: "Vote: 4361"),Movie(original_title: "The Enforcer", overview: "A noir thriller set in Miami, the film follows an enforcer who discovers his femme fatale boss has branched out into cyber sex trafficking, putting a young runaway he’s befriended at risk. He sacrifices everything to save the young girl from the deadly organization he’s spent his life building.", poster_path: "/72V1r1G8S87ELagVxjqAUdChMCt.jpg", popularity: "Popularity: 1962.503", vote_average: "Vote AVG: 6.4", vote_count: "Vote: 50"), Movie(original_title: "Violent Night", overview: "When a team of mercenaries breaks into a wealthy family compound on Christmas Eve, taking everyone inside hostage, the team isn’t prepared for a surprise combatant: Santa Claus is on the grounds, and he’s about to show why this Nick is no saint.", poster_path: "/1XSYOP0JjjyMz1irihvWywro82r.jpg", popularity: "Popularity: 1716.73", vote_average: "Vote AVG: 7.7", vote_count: "Vote: 952"), Movie(original_title: "Devotion", overview: "The harrowing true story of two elite US Navy fighter pilots during the Korean War. Their heroic sacrifices would ultimately make them the Navy's most celebrated wingmen.", poster_path: "/26yQPXymbWeCLKwcmyL8dRjAzth.jpg", popularity: "Popularity: 1564.34", vote_average: "Vote AVG: 6.8", vote_count: "Vote: 63"), Movie(original_title: "Glass Onion: A Knives Out Mystery", overview: "World-famous detective Benoit Blanc heads to Greece to peel back the layers of a mystery surrounding a tech billionaire and his eclectic crew of friends.", poster_path: "/vDGr1YdrlfbU9wxTOdpf3zChmv9.jpg", popularity: "Popularity: 1294.59", vote_average: "Vote AVG: 7.1", vote_count: "Vote: 2776"), Movie(original_title: "The Woman King", overview: "The story of the Agojie, the all-female unit of warriors who protected the African Kingdom of Dahomey in the 1800s with skills and a fierceness unlike anything the world has ever seen, and General Nanisca as she trains the next generation of recruits and readies them for battle against an enemy determined to destroy their way of life.", poster_path: "/438QXt1E3WJWb3PqNniK0tAE5c1.jpg", popularity: "Popularity: 1131.805", vote_average: "Vote AVG: 7.9", vote_count: "Vote: 1071")]
 }
*/
