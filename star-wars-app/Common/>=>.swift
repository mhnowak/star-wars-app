//
//  compose.swift
//  star-wars-app
//
//  Created by Michał Nowak on 13/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

precedencegroup EffectiveComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator >=>: EffectiveComposition

func >=> <A, B, C>(
  _ f: @escaping (A) -> (B, [String]),
  _ g: @escaping (B) -> (C, [String])
  ) -> (A) -> (C, [String]) {
  return { a in
    let (b, logs) = f(a)
    let (c, moreLogs) = g(b)
    return (c, logs + moreLogs)
  }
}
