class GenCommit < Formula
  include Language::Python::Virtualenv

  desc "Auto-generate git commit messages"
  homepage "https://github.com/raghavpillai/gen-commit"
  url "https://github.com/raghavpillai/gen-commit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4f984b4b1d476f047181cddc1416f7287997d0a5dbf4c9888f53ba301dd4d242"
  license "MIT"

  depends_on "python@3.12"
  depends_on "rust" => :build

  resource "openai" do
    url "https://files.pythonhosted.org/packages/a6/57/1c471f6b3efb879d26686d31582997615e969f3bb4458111c9705e56332e/openai-1.97.1.tar.gz"
    sha256 "a744b27ae624e3d4135225da9b1c89c107a2a7e5bc4c93e5b7b5214772ce7a4e"
  end

  resource "tiktoken" do
    url "https://files.pythonhosted.org/packages/ea/cf/756fedf6981e82897f2d570dd25fa597eb3f4459068ae0572d7e888cfd6f/tiktoken-0.9.0.tar.gz"
    sha256 "d02a5ca6a938e0490e1ff957bc48c8b078c88cb83977be1625b1fd8aac792c5d"
  end

  resource "tomli" do
    url "https://files.pythonhosted.org/packages/18/87/302344fed471e44a87289cf4967697d07e532f2421fdaf868a303cbae4ff/tomli-2.2.1.tar.gz"
    sha256 "cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff"
  end

  def install
    ENV["PIP_PREFER_BINARY"] = "1"
    virtualenv_install_with_resources
  end
end