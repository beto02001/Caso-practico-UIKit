//
//  ViewController.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var contenedorDatosView: UIView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var productoImageView: UIImageView!
    
    private var viewmodel: ProductosViewModel = ProductosViewModel()
    private var productos = [Producto](){
        didSet {
          print("cambio")
        }
    }
    var index: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Esto esel indice: \(index)")
        viewmodel.getProductos()
        obtener()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if index != -1 {
            contenedorDatosView.isHidden = false
            nombreLabel.text = productos[index].nombre
            productoImageView.load(urlString: productos[index].urlImagenes![0])
        }
    }

    private func obtener(){
        viewmodel.productosData.bind { [weak self] resp in
            self?.productos = resp
        }
    }
    
    @IBAction func obtenerProductos(_ sender: UIButton) {
        let SBLista = UIStoryboard(name: "ListProductos", bundle: nil)
        if let vc = SBLista.instantiateViewController(withIdentifier: "listaProductos") as?  ListProductosViewController {
            vc.productos = productos
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

