//
//  ViewController.swift
//  Caso practico UIKit
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import UIKit

class ViewController: UIViewController {

    private var viewmodel: ProductosViewModel = ProductosViewModel()
    private var productos = [Producto](){
        didSet {
          print("cambio")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.getProductos()
        obtener()
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

