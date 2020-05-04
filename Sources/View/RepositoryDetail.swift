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
//	ID: E3F73908-FD2E-4349-8C9E-7176230B3817
//
//	Pkg: GitHubBrowser
//
//	Swift: 5.2
//
//	MacOS: 10.15
//

import SwiftUI

struct RepositoryDetail: View {
	
	@EnvironmentObject var store: RepositoryStore
	@State var repo: RepositoryViewModel
	
    var body: some View {
		VStack(alignment: .leading) {
			
			RepositoryName(repo: $repo)
			
			Divider()
			
			Text(repo.description)
				.font(.subheadline)
				.foregroundColor(.secondary)
			
			Divider()
			
			RepositoryStats(repo: $repo)
			
			Divider()

			Text(repo.createdString)
				.font(.subheadline)
				.fontWeight(.light)
				.foregroundColor(.secondary)
			
			Divider()
			
			Text("# ProductBrowser\nAn iOS project implementing REST service and MVVP pattern\n")
				.font(.subheadline)
				.foregroundColor(.secondary)
			
			Spacer()
		}
		.navigationBarTitle(Text("Repository"), displayMode: .inline)
		.padding()
		.onAppear(perform: fetch)
    }
	
	private func fetch() {
		store.fetch(repo: repo.fullName)
	}
}

#if DEBUG
struct RepositoryDetail_Previews: PreviewProvider {
    static var previews: some View {
		RepositoryDetail(repo: RepositoryViewModel.preview)
    }
}
#endif
