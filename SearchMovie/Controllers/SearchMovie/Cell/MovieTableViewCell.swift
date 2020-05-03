//
//  MovieTableViewCell.swift
//  SearchMovie
//
//  Created by AlexanderKogut on 03.05.2020.
//  Copyright © 2020 AlexanderKogut. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak private var moviePoster: UIImageView!
    @IBOutlet weak private var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        moviePoster.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.lightGray.withAlphaComponent(0.4).cgColor)
            context.setLineWidth(1.4)
            context.move(to: CGPoint(x: 16, y: bounds.height))
            context.addLine(to: CGPoint(x: bounds.width - 16, y: bounds.height))
            context.strokePath()
        }
    }
    
    func configure(movie: Search) {
        movieTitle.text = movie.title ?? ""
        guard let urlStr = movie.poster, let url = URL(string: urlStr) else {
            return
        }
        moviePoster.af.setImage(withURL: url)
    }

}
