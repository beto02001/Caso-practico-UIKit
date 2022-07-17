//
//  ProductoTableViewCell.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ProductoTableViewCell: UITableViewCell {
    
    //--------------------------------------------------------------------------
    //MARK: - Outlets
    //--------------------------------------------------------------------------
    @IBOutlet weak var vistaAmarillaView: UIView!
    @IBOutlet weak var productoUIImage: UIImageView!
    @IBOutlet weak var nombreProductoLabel: UILabel!
    @IBOutlet weak var precioProductoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vistaAmarillaView.layer.cornerRadius = 17
        
        productoUIImage.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
