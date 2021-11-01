//
//  Resource.swift
//  Networking
//
//  Created by Luka Šarčević on 06.01.2021..
<<<<<<< Updated upstream
//  Copyright © 2021 Libera la Musica Oy. All rights reserved.
=======
//  Copyright © 2021 Codeopolis. All rights reserved.
>>>>>>> Stashed changes
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
