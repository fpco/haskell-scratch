# haskell-scratch

Base Docker image which includes minimal shared libraries for GHC-compiled executables.
For more information, see [Haskell Web Server in a 5MB Docker Image](https://www.fpcomplete.com/blog/2015/05/haskell-web-server-in-5mb).

__NOTE__: Many people have sent pull requests to increase the scope of this image.
While changes will almost certainly be necessary to this image for most real-world
applications, adding them to the base image defeats its purpose as an example of
a minimalistic scratch image. Such additional features should rather go in
separate images. Consider the requirements of this image to be able to successfully
run a "hello world" GHC statically-compiled application.
