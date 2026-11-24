class PipetailCloud < Formula
  desc "Command-line client and MCP server for pipetail.cloud"
  homepage "https://pipetail.cloud"
  url "https://github.com/pipetail/homebrew-tap/releases/download/v0.1.10/pipetail-cloud.mjs"
  version "0.1.10"
  sha256 "8e4a19c5ea05f369f72429280c52c8b21b9ea8e5bde3df9bc2faf91c0c9f900e"

  depends_on "node"

  def install
    libexec.install "pipetail-cloud.mjs"
    (bin/"pipetail-cloud").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/pipetail-cloud.mjs" "$@"
    SH
  end

  test do
    assert_match "Usage: pipetail-cloud", shell_output("#{bin}/pipetail-cloud --help")
  end
end
