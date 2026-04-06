class Audiorec < Formula
  desc "Record microphone + system audio as separate crash-safe files"
  homepage "https://github.com/pmoust/audiorec"
  url "https://github.com/pmoust/audiorec/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "363d424338a2629eba1b6f3dc52d9d49b98f43fcf33b0474d10264622195d6b9"
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
