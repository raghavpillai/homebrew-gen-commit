class GenCommit < Formula
  include Language::Python::Virtualenv

  desc "Auto-generate git commit messages"
  homepage "https://github.com/raghavpillai/gen-commit"
  url "https://github.com/raghavpillai/gen-commit/archive/refs/tags/v0.8.5.tar.gz"
  sha256 "adde2b05cc4388d41b00bd915656f23c97a6724784a66c887e8651e28ebb852f"
  license "MIT"

  depends_on "python@3.12"
  depends_on "rust" => :build

  resource "openai" do
    url "https://files.pythonhosted.org/packages/8c/1f/310b0b5efb6178ad9f9ca4a80b2ead3cb7cbc16a1b843941bcf1c52dd884/openai-1.42.0.tar.gz"
    sha256 "c9d31853b4e0bc2dc8bd08003b462a006035655a701471695d0bfdc08529cde3"
  end

  resource "anthropic" do
    url "https://files.pythonhosted.org/packages/6a/78/3f8a617187b607e78689b03e063b4fb75dd6bd9ea9df365ec1273e44a06f/anthropic-0.31.2.tar.gz"
    sha256 "0134b73df8d1f142fc68675fbadb75e920054e9e3437b99df63f10f0fc6ac26f"
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

  resource "docstring_parser" do
    url "https://files.pythonhosted.org/packages/08/12/9c22a58c0b1e29271051222d8906257616da84135af9ed167c9e28f85cb3/docstring_parser-0.16.tar.gz"
    sha256 "538beabd0af1e2db0146b6bd3caa526c35a34d61af9fd2887f3a8a27a739aa6e"
  end

  resource "tenacity" do
    url "https://files.pythonhosted.org/packages/cd/94/91fccdb4b8110642462e653d5dcb27e7b674742ad68efd146367da7bdb10/tenacity-9.0.0.tar.gz"
    sha256 "807f37ca97d62aa361264d497b0e31e92b8027044942bfa756160d908320d73b"
  end

  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/ca/28/ca549838018140b92a19001a8628578b0f2a3b38c16826212cc6f706e6d4/aiohttp-3.10.5.tar.gz"
    sha256 "f071854b47d39591ce9a17981c46790acb30518e2f83dfca8db2dfa091178691"
  end

  resource "multidict" do
    url "https://files.pythonhosted.org/packages/f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836/multidict-6.0.5.tar.gz"
    sha256 "f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da"
  end

  resource "attrs" do
    url "https://files.pythonhosted.org/packages/fc/0f/aafca9af9315aee06a89ffde799a10a582fe8de76c563ee80bbcdc08b3fb/attrs-24.2.0.tar.gz"
    sha256 "5cfb1b9148b5b086569baec03f20d7b6bf3bcacc9a42bebf87ffaaca362f6346"
  end

  resource "yarl" do
    url "https://files.pythonhosted.org/packages/e0/ad/bedcdccbcbf91363fd425a948994f3340924145c2bc8ccb296f4a1e52c28/yarl-1.9.4.tar.gz"
    sha256 "566db86717cf8080b99b58b083b773a908ae40f06681e87e589a976faf8246bf"
  end

  resource "aiohappyeyeballs" do
    url "https://files.pythonhosted.org/packages/2d/f7/22bba300a16fd1cad99da1a23793fe43963ee326d012fdf852d0b4035955/aiohappyeyeballs-2.4.0.tar.gz"
    sha256 "55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2"
  end

  resource "aiosignal" do
    url "https://files.pythonhosted.org/packages/ae/67/0952ed97a9793b4958e5736f6d2b346b414a2cd63e82d05940032f45b32f/aiosignal-1.3.1.tar.gz"
    sha256 "54cd96e15e1649b75d6c87526a6ff0b6c1b0dd3459f43d9ca11d48c339b68cfc"
  end

  resource "frozenlist" do
    url "https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085/frozenlist-1.4.1.tar.gz"
    sha256 "c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b"
  end

  def install
    # ENV["TIKTOKEN_BUILD_RUST"] = "1"
    # ENV["RUSTFLAGS"] = "-C target-cpu=native"
    
    virtualenv_install_with_resources
  end
end