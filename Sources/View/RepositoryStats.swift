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
//	ID: 806C1B53-D758-4419-841F-D03BAE11DAA6
//
//	Pkg: GitHubBrowser
//
//	Swift: 5.2
//
//	MacOS: 10.15
//

import SwiftUI

struct RepositoryStats: View {
	
	@Binding var model: RepositoryViewModel
	
    var body: some View {
		
		HStack() {
			
			Text("Forks: \(model.forks)")
				.font(.subheadline)
				.fontWeight(.light)
				.foregroundColor(.secondary)
			
			Spacer()
			
			Text("Watchers: \(model.watchers)")
				.font(.subheadline)
				.fontWeight(.light)
				.foregroundColor(.secondary)
			
			Spacer()
			
			Text("Issues: \(model.openIssues)")
				.font(.subheadline)
				.fontWeight(.light)
				.foregroundColor(.secondary)
		}
    }
}
