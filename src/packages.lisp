(defpackage #:magicl.foreign-libraries
  (:use #:common-lisp)
  (:export #:libgfortran
           #:libblas
           #:liblapack
           #:libexpokit
           #:foreign-symbol-available-p
           #:print-availability-report))

(defpackage #:magicl.cffi-types
  (:use #:common-lisp
        #:cffi)
  (:export #+sbcl #:array-pointer       ; FUNCTION
           #:with-array-pointers        ; MACRO
           #:complex-single-float
           #:complex-double-float
           #:fortran-int
           #:fortran-float
           #:fortran-double
           #:fortran-complex-float
           #:fortran-complex-double
           #:fortran-logical))

(defpackage #:magicl.blas-cffi
  (:use)
  #-package-local-nicknames
  (:nicknames #:blas))

(defpackage #:magicl.lapack-cffi
  (:use)
  #-package-local-nicknames
  (:nicknames #:lapack))

(defpackage #:magicl.expokit-cffi
  (:use)
  #-package-local-nicknames
  (:nicknames #:expokit))

(defpackage #:magicl
  (:use #:common-lisp
        #:cffi
        #:abstract-classes)
  #+package-local-nicknames
  (:local-nicknames (#:blas #:magicl.blas-cffi)
                    (#:lapack #:magicl.lapack-cffi)
                    (#:expokit #:magicl.expokit-cffi))
  (:import-from #:magicl.foreign-libraries
                #:print-availability-report)
  (:shadow #:vector
           #:+
           #:-
           #:=
           #:map
           #:trace
           #:every
           #:some
           #:notevery
           #:notany)
  (:export #:with-blapack
           
           ;; abstract-tensor protocol
           #:specialize-tensor
           #:generalize-tensor
           #:shape
           #:tref
           #:rank
           #:size
           #:element-type
           #:lisp-array

           #:every
           #:some
           #:notevery
           #:notany

           #:map
           #:map!
           
           ;; Classes
           #:tensor
           #:matrix

           ;; Accessors
           #:nrows
           #:ncols

           ;; Subtypes
           #:tensor/single-float
           #:tensor/double-float
           #:matrix/single-float
           #:matrix/double-float

           ;; Constructors
           #:make-tensor
           #:empty
           #:const
           #:rand
           #:deye
           #:arange
           #:from-array
           #:from-list
           #:from-diag

           #:random-unitary

           ;; Operators
           #:+
           #:-
           #:=
           #:map
           
           ;; Matrix operators
           #:square-matrix-p
           #:identity-matrix-p
           #:unitary-matrix-p
           #:row
           #:column
           #:@
           #:kron
           #:scale
           #:scale!
           #:diag
           #:det
           #:transpose
           #:transpose!
           #:orthonormalize
           #:orthonormalize!
           #:trace
           #:direct-sum
           #:conjugate-transpose
           #:dagger
           #:eig
           #:inverse
           #:lu
           #:csd
           #:svd
           #:ql
           #:qr
           #:rq
           #:lq

           ;; Vector operators
           #:dot

           ;; LAPACK stuff
           #:lapack-csd
           ))
