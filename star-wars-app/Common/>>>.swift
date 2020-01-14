//
//  >>>.swift
//  star-wars-app
//
//  Created by Michał Nowak on 13/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

precedencegroup ForwardComposition {
  associativity: left
  higherThan: EffectiveComposition
}

infix operator >>>: 

func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
  return { a in
    g(f(a))
  }
}
