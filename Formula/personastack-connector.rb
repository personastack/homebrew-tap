class PersonastackConnector < Formula
  desc "Local Connector for PersonaStack external personas"
  homepage "https://personastack.ai"
  url "ssh://git@github.com/personastack/personastack-connector.git",
      tag:      "v0.1.8",
      revision: "12b58578200deda68ca056599871eea8390a8b2a"
  license :cannot_represent

  depends_on "go" => :build

  def install
    git_commit = "12b58578200deda68ca056599871eea8390a8b2a"
    ldflags = %W[
      -s -w
      -X github.com/personastack/personastack-connector/internal/buildinfo.Version=#{version}
      -X github.com/personastack/personastack-connector/internal/buildinfo.GitCommit=#{git_commit}
      -X github.com/personastack/personastack-connector/internal/buildinfo.ReleaseChannel=stable
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/personastack-connector"
  end

  test do
    assert_match "personastack-connector version=", shell_output("#{bin}/personastack-connector version")
  end
end
