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
//	Swift: 5.2 
//
//	MacOS: 10.15
//

import SwiftUI

struct SearchBar: View {

	@EnvironmentObject var store: RepositoryStore
	@State private var query = ""
	@State private var isActiveBar = false
	
    var body: some View {
		
		HStack {
			
			SearchField(store: store, text: $query, isActiveBar: $isActiveBar)
			
			Button("Search") {
				self.fetch()
			}
			.padding(.trailing, isActiveBar ? -10 : -100)
			.accentColor(.primary)
		}
		.padding(EdgeInsets(top: 8, leading: -10, bottom: 8, trailing: 0))
		.animation(.default)
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

private struct SearchField: View {
	
	var store: RepositoryStore
	@Binding var text: String
	@Binding var isActiveBar: Bool
	
	var body: some View {
		
		ZStack {
			RoundedRectangle(cornerRadius: 10).foregroundColor(.white)
			
			HStack {
				Image(systemName: "magnifyingglass").foregroundColor(.secondary)
				
				TextField("Type repository name...", text: $text, onEditingChanged: { isActive in
					self.isActiveBar = isActive
				})
				
				if !text.isEmpty {
					Button(action: {
						self.text = ""
						self.store.clear()
					}) {
						Image(systemName: "multiply.circle")
					}.accentColor(.secondary)
				}
			}
			.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
		}
	}
}


//struct SearchBar: View {
//
//	@Binding var text: String
//	@Binding var isActiveBar: Bool
//
//	var body: some View {
//		HStack(alignment: VerticalAlignment.center, spacing: 0, content: {
//
//			ContainerView(text: $text, isActiveField: $isActiveBar)
//
//			Button("Cancel") {
//				self.isActiveBar = false
//				self.text = ""
//			}
//			.padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: isActiveBar ? 16 : -52))
//
//		}).animation(.default)
//	}
//}
//
//struct ContainerView: View {
//
//	@Binding var text: String
//	@Binding var isActiveField: Bool
//
//	var body: some View {
//		ZStack {
//			//BackgroundView()
//			HStack {
//				Image(systemName: "magnifyingglass")
//
//				TextField("Type repository name...", text: $text, onEditingChanged: { isActive in
//					self.isActiveField = isActive as Bool
//				})
//
//				if !text.isEmpty {
//					Button(action: {
//						self.text = "" as String
//					}) {
//						Image(systemName: "multiply.circle")
//					}
//				}
//			}
//		}
//	}
//}
