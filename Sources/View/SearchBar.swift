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
//	ID: 8307DA14-0A3D-4539-B244-FE5EAA05CEB4
//
//	Pkg: GitHubBrowser
//
//	Swift: 5.0 
//
//	MacOS: 10.15
//

import SwiftUI

struct SearchBar: View {
	
	@EnvironmentObject var store: RepositoryStore
	@State private var query: String = "Swift"

    var body: some View {
		HStack() {
			TextField("Type repository name...", text: $query, onCommit: fetch)
				.textFieldStyle(.roundedBorder)
			
			Button("Clear") {
				self.query = ""
				self.fetch()
			}
		}
		.padding(.top, 10)
		.padding(.bottom, 10)
		.onAppear(perform: fetch)
    }

	private func fetch() {
		store.search(query: query)
	}
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
#endif
