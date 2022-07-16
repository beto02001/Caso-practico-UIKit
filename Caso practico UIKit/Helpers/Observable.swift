//
//  Observable.swift
//  Caso practico
//
//  Created by Luis Humberto Martinez Echegaray on 16/07/22.
//

import Foundation

class Observable<T> {
    var value: T{
        didSet{
            listeners.forEach{$0(value)}
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    private var listeners: [((T) -> Void)] = []
    
    func bind(_ listener:@escaping (T) -> Void) {
   
        self.listeners.append(listener)
    }
}
