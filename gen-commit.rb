class GenCommit < Formula
  include Language::Python::Virtualenv

  desc "Auto-generate git commit messages"
  homepage "https://github.com/raghavpillai/gen-commit"
  url "https://github.com/raghavpillai/gen-commit/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "dba760891df9ee458d93276fd63b71b0f507581e672b5ce8fc6e0d060edead24"
  license "MIT"

  depends_on "python@3.12"
  depends_on "rust" => :build

  resource "openai" do
    url "https://files.pythonhosted.org/packages/20/49/df107c1171607610e8f02036971da528e004979dbd04875b2bed9144bc9a/openai-1.36.1.tar.gz"
    sha256 "41be9e0302e95dba8a9374b885c5cb1cec2202816a70b98736fee25a2cadd1f2"
  end

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/bb/e6/8b2e3a56571f9fd7bbf763dfb77f9f67b77f2e942e46a058c2821592f8bb/anthropic-0.2.8.tar.gz"
    sha256 "d2629d7e26415bcce2ed0fdff0096a3fdd861099a73a1351ee705511d1c2ea6e"
  end

  resource "instructor" do
    url "https://files.pythonhosted.org/packages/af/e2/b9d5e6cc07d1dcf6edc0c683a7ef46253373b431d036fdb5d78b0a7c92a0/instructor-1.4.0.tar.gz"
    sha256 "79a0c93f2bf37ed5efb7bee03b587f6c9010778599bd05ad4430e2bf2f7d3cfc"
  end

  resource "tiktoken" do
    url "https://files.pythonhosted.org/packages/c4/4a/abaec53e93e3ef37224a4dd9e2fc6bb871e7a538c2b6b9d2a6397271daf4/tiktoken-0.7.0.tar.gz"
    sha256 "1077266e949c24e0291f6c350433c6f0971365ece2b173a23bc3b9f9defef6b6"
  end

  resource "tomli" do
    url "https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3/tomli-2.0.1.tar.gz"
    sha256 "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
  end

  def install
    ENV["TIKTOKEN_BUILD_RUST"] = "1"
    ENV["RUSTFLAGS"] = "-C target-cpu=native"
    
    venv = virtualenv_create(libexec, "python3.12")
    
    # Install all resources
    resources.each do |r|
      r.stage do
        venv.pip_install Pathname.pwd
      end
    end
    
    # Install the main package
    venv.pip_install_and_link buildpath
    
    # Ensure all dependencies are installed
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
  end
end