class GenCommit < Formula
  include Language::Python::Virtualenv

  desc "Auto-generate git commit messages"
  homepage "https://github.com/raghavpillai/gen-commit"
  url "https://github.com/raghavpillai/gen-commit/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "f5943f4327bd8766e6c970fbca4f363184086edc27d922022cc0be324d167b2a"
  license "MIT"

  depends_on "python@3.12"
  depends_on "rust" => :build

  resource "requirements" do
    url "https://raw.githubusercontent.com/raghavpillai/gen-commit/v0.5.5/requirements.txt"
    sha256 "388cce92db0cb24d4883d2a2cac9a3622cbe70b8839ef2161cdb8be4ce5e0bbe"
  end

  def install
    ENV["TIKTOKEN_BUILD_RUST"] = "1"
    ENV["RUSTFLAGS"] = "-C target-cpu=native"
    
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
    
    # Install requirements from the content of the file
    resource("requirements").stage do
      system libexec/"bin/pip", "install", "-r", "requirements.txt"
    end
  end

  test do
    system "#{bin}/gencommit", "--version"
  end
end