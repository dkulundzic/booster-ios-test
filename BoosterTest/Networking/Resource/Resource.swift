//
//  Resource.swift
//  Networking
//
//  Created by Luka Šarčević on 06.01.2021..
//  Copyright © 2021 Libera la Musica Oy. All rights reserved.
//

import Foundation

protocol Resource {
  var endpoint: String { get }
}

extension Resource {
  var url: URL {
    Host.baseUrl.appendingPathComponent(endpoint)
  }
}
