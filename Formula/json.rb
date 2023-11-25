class Json < Formula
  desc "Simple C++ JSON File Reader"
  homepage "https://github.com/ccmagruder/json"
  url "https://github.com/ccmagruder/json/archive/refs/tags/json-0.0.5.tar.gz"
  sha256 "5405892abc008e5c8e31e429e55be9d87e96776198e3a25481d5c69e92ef79e9"
  license "Apache-2.0"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test json`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "ctest"
  end
end
