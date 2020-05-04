//	MIT License
//
//	Copyright © 2020 Emile, Blue Ant Corp
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
//	ID: 11A876E5-C3C5-4C5F-A169-1A43AC271100
//
//	Pkg: GitHubBrowser
//
//	Swift: 5.2
//
//	MacOS: 10.15
//

import SwiftUI

struct RepositoryViewModel: Identifiable {
	let id: UUID = UUID()
	let name: String
	let fullName: String
	
	// Detail
	let description: String
	let url: String
	let forks: Int
	let watchers: Int
	let created: Date
	let openIssues: Int
	
	var createdString: String {
		let dateFormatterPrint = DateFormatter()
		dateFormatterPrint.dateFormat = "MMM dd,yyyy"
		return "Created: \(dateFormatterPrint.string(from: created))"
	}
}

extension RepositoryViewModel  {
	init(source: Repository) {
		
		self.init(name: source.name,
				  fullName: source.fullName,
				  description: source.description ?? "N/A",
				  url: source.url,
				  forks: source.forks,
				  watchers: source.watchers,
				  created: source.createdAt,
				  openIssues: source.openIssuesCount)
	}
}

// MARK: - Preview
extension RepositoryViewModel {
	static var preview: RepositoryViewModel {
		return RepositoryViewModel(source: Repository(name: "source.name",
													  fullName: "source.fullName",
													  description: "source.description",
													  url: "URL",
													  forks: 102,
													  watchers: 103,
													  createdAt: Date(),
													  openIssuesCount: 104))
	}
}
