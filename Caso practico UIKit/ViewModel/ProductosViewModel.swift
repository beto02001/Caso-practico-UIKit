//
//  ProductosViewModel.swift
//  Caso practico
//
//  Created by Luis Humberto Martinez Echegaray on 15/07/22.
//

import Foundation


class ProductosViewModel{
    
    var productosData = Observable([Producto]())
    
    func getProductos(){
        guard let url = URL(string: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a") else { return }
        let urlsession = URLSession.shared
        urlsession.dataTask(with: url){ data, response, error in
            if let _ = error{
                print("error!")
            } else {
                print("no hay error")
            }
            
            guard let data = data else { return }
            
            do{
                let dataProductos = try JSONDecoder().decode(ProductosModel.self, from: data)
                let prods = dataProductos.resultado.productos
                self.productosData.value.append(contentsOf: prods)
            } catch{
                print("No se pudo")
                return
            }

            
        }.resume()
    }
    
}
