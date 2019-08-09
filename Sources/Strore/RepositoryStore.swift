//	MIT License
//
//	Copyright © 2019 Emile, Blue Ant Corp
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
//
//	ID: 3D2B2EEF-85B6-4A55-A10E-FC076E45A658
//
//	Pkg: GitHubBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import SwiftUI
import Combine

enum GitHubEndPoint: EndPoint {
	
	case search
	case readme(repo: String)
	
	var baseURL: URL {
		return URL(string: "https://api.github.com/")!
	}
	
	var path: String {
		switch self {
		case .search: return "search/repositories"
		case .readme(let repo): return "repos/\(repo)/readme"
		}
	}
	
	var httpMethod: HTTPMethod {
		switch self {
		default: return .GET
		}
	}
}

struct Response: Codable {
	let totalCount: Int
	let items: [Repository]
}

final class RepositoryStore: ObservableObject {

	let objectWillChange = PassthroughSubject<Void, Never>()

	let service = Service()

	var items: [RepositoryViewModel] = [] {
		didSet { objectWillChange.send() }
	}
	
	init(items: [RepositoryViewModel] = []) {
		self.items = items
	}
}

extension RepositoryStore {
	
	func search(query: String) {
		
		items = []
		
		if query != "" && query.count > 3 {
			service.fetch(endpoint: GitHubEndPoint.search, params: ["q": query]) { (result: Result<Response, ServiceError>) in
				DispatchQueue.main.sync {
					switch result {
					case .success(let response):
						self.items = response.items.map { repository in
							RepositoryViewModel(source: repository)
						}
					case .failure(let error): print(error)
					}
				}
			}
		}
	}
	
	func fetch(repo: String) {
		service.fetch(endpoint: GitHubEndPoint.readme(repo: repo), params: nil) { (result: Result<ReadMe, ServiceError>) in
			DispatchQueue.main.sync {
				switch result {
				case .success(let readme): print(readme.content.base64EncodedString())//print(RepositoryViewModel(source: repository))
				case .failure(let error): print(error)
				}
			}
		}
	}
}
