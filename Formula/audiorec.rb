class Audiorec < Formula
  desc "Record microphone + system audio as separate crash-safe files"
  homepage "https://github.com/pmoust/audiorec"
  url "https://github.com/pmoust/audiorec/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "079ae315feb63f46c61147b8641ccee6e0414044351d10b9aaac6a4a5543b891"
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
