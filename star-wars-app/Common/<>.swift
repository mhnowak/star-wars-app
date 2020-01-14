//
//  <>.swift
//  star-wars-app
//
//  Created by Michał Nowak on 13/01/2020.
//  Copyright © 2020 Michal Nowak. All rights reserved.
//

import Foundation

precedencegroup SingleTypeComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

func <> <A>(
  f: @escaping (A) -> A,
  g: @escaping (A) -> A)
  -> ((A) -> A) {
    return f >>> g
}

func <> <A>(
  f: @escaping (inout A) -> Void,
  g: @escaping (inout A) -> Void)
  -> ((inout A) -> Void) {
    return { a in
        f(&a)
        g(&a)
  }
}

func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
  return { a in
    f(a)
    g(a)
  }
}
