//
//  UIImageExtension.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import Foundation
import UIKit

extension UIImageView{
    func load(urlString: String){
        //let nuevaURL = urlString.replacingOccurrences(of: "http", with: "https", options: NSString.CompareOptions.literal, range: nil)
        guard let url = URL(string: urlString)else{
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
