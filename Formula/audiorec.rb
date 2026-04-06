class Audiorec < Formula
  desc "Record microphone + system audio as separate crash-safe files"
  homepage "https://github.com/pmoust/audiorec"
  url "https://github.com/pmoust/audiorec/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "f1f6984af04fef2e3e9a4386ca87f6b8a49ca68ae31750e9d98842e9be95f155"
  license "MIT"
  head "https://github.com/pmoust/audiorec.git", branch: "main"

  depends_on "go" => :build
  depends_on "opus"
  depends_on "opusfile"
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/audiorec"
  end

  test do
    assert_match "audiorec", shell_output("#{bin}/audiorec 2>&1", 2)
  end
end
