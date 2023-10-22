import SwiftUI

struct RustOptionsView: View {
    let rust: Rust
    
    @ObservedObject var options: RustOptions

    var body: some View {
        Picker("", selection: $options.toolchain) {
            ForEach(rust.toolchains) { toolchain in
                Text(toolchain.name).tag(toolchain)
            }
        }

        Picker("", selection: $options.edition) {
            ForEach(RustEdition.allCases) { edition in
                Text(edition.rawValue).tag(edition)
            }
        }

        Picker("", selection: $options.mode) {
            ForEach(RustMode.allCases) { mode in
                Text(mode.rawValue).tag(mode)
            }
        }
    }

    init(language: Rust) {
        self.rust = language
        self.options = language.options
    }
}