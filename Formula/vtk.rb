  revision 6
  head "https://gitlab.kitware.com/vtk/vtk.git", branch: "master"

  stable do
    url "https://www.vtk.org/files/release/9.1/VTK-9.1.0.tar.gz"
    sha256 "8fed42f4f8f1eb8083107b68eaa9ad71da07110161a3116ad807f43e5ca5ce96"

    # Fix vtkpython support for Python 3.10. Remove in the next release.
    # First patch backports part of older commit so we can directly patch in upstream commit.
    patch :DATA
    patch do
      url "https://gitlab.kitware.com/vtk/vtk/-/commit/3eea0e12acfb608a76d6ae36fb36566a4a6b0e9b.diff"
      sha256 "1c1c4622a58f8c852d196759c8d9036e4d513a5ebe16fe0bfa14583832886572"
    end
  end
    sha256                               arm64_monterey: "33456b64eecdf614f7db9d5b4a11145e660d9d6dc3f5c48b7c9e19958b722b78"
    sha256                               arm64_big_sur:  "f03fb2e0b2c54b0eef6fc5f1f7665c5e9fade0025c3fe62a4e57eb0622c160cd"
    sha256                               monterey:       "d651127e36f34dc5218d9bf36b700bf6786261e3237092569382d31e94fbfbe6"
    sha256                               big_sur:        "aa60276bc28b6a8d94d95f098caaa2ed3652c4ae7a536842f49c049b5dcc151e"
    sha256                               catalina:       "8290e82320543d08c058312d803d3cbd78ba58d7bce9e44e6853b010129b08ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f15c9f69ea940f69a2938f8cfdfa742fa5eac35e7d4788d5785856db7f06245b"
  depends_on "jpeg-turbo"
  depends_on "python@3.10"
      -DPython3_EXECUTABLE:FILEPATH=#{which("python3.10")}
    system "cmake", ".", "-DCMAKE_BUILD_TYPE=Debug", "-DCMAKE_VERBOSE_MAKEFILE=ON", "-DVTK_DIR=#{vtk_dir}"

__END__
diff --git a/Documentation/release/dev/python-3.10-wheels.md b/Documentation/release/dev/python-3.10-wheels.md
new file mode 100644
index 0000000000000000000000000000000000000000..f4e81411c73f30724ad420ccb7f3c6c07a6f8e3d
--- /dev/null
+++ b/Documentation/release/dev/python-3.10-wheels.md
@@ -0,0 +1,7 @@
+## Python 3.10 wheels
+
+VTK now generates Python 3.10 wheels. Note that `vtkpython` and other tools
+using `vtkPythonInterpreter` still do not support the new initialization
+behaviors introduced in Python 3.10. See [this issue][vtk-python-3.10-support].
+
+[vtk-python-3.10.support]: https://gitlab.kitware.com/vtk/vtk/-/issues/18317