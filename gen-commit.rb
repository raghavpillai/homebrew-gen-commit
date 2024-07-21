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
    sha256 "the_actual_sha256_of_your_requirements_file"
  end

  def install
    ENV["TIKTOKEN_BUILD_RUST"] = "1"
    ENV["RUSTFLAGS"] = "-C target-cpu=native"
    
    venv = virtualenv_create(libexec, "python3.12")
    
    resource("requirements").stage do
      system libexec/"bin/pip", "install", "-v", "-r", "requirements.txt"
    end
    
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/gencommit", "--version"
  end
end