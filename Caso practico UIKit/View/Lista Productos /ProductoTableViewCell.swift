//
//  ProductoTableViewCell.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ProductoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productoUIImage: UIImageView!
    @IBOutlet weak var nombreProductoLabel: UILabel!
    @IBOutlet weak var precioProductoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
