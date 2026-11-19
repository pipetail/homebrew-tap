class PipetailCloud < Formula
  desc "Command-line client and MCP server for pipetail.cloud"
  homepage "https://pipetail.cloud"
  url "https://github.com/pipetail/homebrew-tap/releases/download/v0.1.3/pipetail-cloud.mjs"
  version "0.1.3"
  sha256 "efdbc4f0645b082845a81518d72288abee306e34e043037bd965beb1afce7e1e"

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
