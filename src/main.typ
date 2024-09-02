#import "lib.typ": conf

#let ANONYMOUS = false

// IMPORTANT: Reproduction of the `\anon{anonymous}{known}` command
//   1. To ensure anonymity during the double-blind review, 
//   2. To easily switch to a non-anonymous version for publication.
// 
// With the anon function, first argument shows when anonymous and the second when non-anonymous (known).
// e.g. #anon("Me, Scott Mitchell, wrote this paper.","The author will remain anonymous during the double blind review.")
// e.g. Our code is available at #anon("http://github.com/myname/mycode", "anonymized for double blind review.")
//
// The author and acknowledgements section have already been wrapped in this macro for your convenience.
#let anon(anonymous,known) = {
  if ANONYMOUS {
    anonymous
  }
  else {
    known
  }
}

#show: doc => conf(
  title: [#anon("Anonymized","Known-authors") SIAM/ACM Preprint for Use With Typst#footnote([The full version of the paper can be accessed at #anon([`redacted-url`],link("https://arxiv.org/abs/1902.09310"))])],
  authors: anon(
    "Submission ID XYZ",
    (
      (
        name: "Corey Gray",
        affiliation: "Society for Industrial and Applied Mathematics."
      ),
      (
        name: "Tricia Manning",
        affiliation: "Society for Industrial and Applied Mathematics."
      )
    )
  ),
  abstract: "An abstract is a brief summary of the paper’s contributions, written for experts. " + anon("Authors are anonymized for double-blind review.","It was written by Gray and Manning."),
  doc,
)

= Introduction

An introduction is a gentler description and summary
of the paper than the abstract, written for non-experts.
It describes the paper’s concepts, contribution, context
and significance.

== Problem Specification.
In this paper, we consider the solution of the $N times N$ linear system

// numbered equation
$
A x = B
$ <linear_system>

where $A$ is large, sparse, symmetric, and positive definite.
We consider the direct solution of @linear_system by
means of general sparse Gaussian elimination. In such
a procedure, we find a permutation matrix $P$, and compute
the decomposition

// not-numbered equation
#align(center)[
  $P A P^t = L D L^t$
]

where $L$ is unit lower triangular and $D$ is diagonal.

Several good ordering algorithms (nested dissection and
minimum degree)
are available for computing $P$~@GEORGELIU @ROSE72.
Since our interest here does not
focus directly on the ordering, we assume for convenience that $P=I$,
or that $A$ has been preordered to reflect an appropriate choice of $P$.

#h(1.5em)
Our purpose here is to examine the nonnumerical complexity of the
sparse elimination algorithm given in~@BANKSMITH.
As was shown there, a general sparse elimination scheme based on the
bordering algorithm requires less storage for pointers and
row/column indices than more traditional implementations of general
sparse elimination.  This is accomplished by exploiting the m-tree,
a particular spanning tree for the graph of the filled-in matrix.

#bibliography("bib.yml", title: "References")
// TODO small caps for authors
