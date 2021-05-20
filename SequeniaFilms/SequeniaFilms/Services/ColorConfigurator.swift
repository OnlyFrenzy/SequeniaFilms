//
//  ColorConfigurator.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 21.05.2021.
//

import UIKit

class ColorConfigurator {
    
    func configureColorRatingLabel( rating : Double) -> UIColor {
        switch rating {
        case 7...:
            return #colorLiteral(red: 0, green: 0.4823529412, blue: 0, alpha: 1)
        case 5...6:
            return #colorLiteral(red: 0.3725490196, green: 0.3725490196, blue: 0.3725490196, alpha: 1)
        case ..<5:
            return #colorLiteral(red: 1, green: 0.0431372549, blue: 0.0431372549, alpha: 1)
        default:
            return UIColor.black
        }
    }
}
