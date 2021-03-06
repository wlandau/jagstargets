% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tar_jags_rep.R
\name{tar_jags_rep_run}
\alias{tar_jags_rep_run}
\title{Run a batch of iterations for a jags model
and return only strategic output.}
\usage{
tar_jags_rep_run(
  jags_lines,
  jags_name,
  jags_file,
  parameters.to.save,
  data,
  variables = NULL,
  summaries = NULL,
  summary_args = NULL,
  reps,
  output,
  n.cluster = n.cluster,
  n.chains = n.chains,
  n.iter = n.iter,
  n.burnin = n.burnin,
  n.thin = n.thin,
  jags.module = jags.module,
  inits = inits,
  RNGname = RNGname,
  jags.seed = jags.seed,
  stdout = stdout,
  stderr = stderr,
  progress.bar = progress.bar,
  refresh = refresh
)
}
\arguments{
\item{jags_lines}{Character vector of lines from a JAGS file.}

\item{jags_name}{Friendly suffix of the jags model target.}

\item{jags_file}{Original path to the input jags file.}

\item{parameters.to.save}{character vector of the names of the
    parameters to save which should be monitored.}

\item{data}{A list, the original JAGS dataset.}

\item{variables}{Character vector of model parameter names.
The output posterior summaries are restricted to these variables.}

\item{summaries}{List of summary functions passed to \code{...} in
\code{posterior::summarize_draws()} through \verb{$summary()}
on the \code{CmdStanFit} object.}

\item{summary_args}{List of summary function arguments passed to
\code{.args} in \code{posterior::summarize_draws()} through \verb{$summary()}
on the \code{CmdStanFit} object.}

\item{output}{Character of length 1 denoting the type of output \code{tibble}
to return: \code{"draws"} for MCMC samples (which could take up a lot of space)
\code{"summary"} for lightweight posterior summary statistics,
and \code{"dic"} for the overall deviance information criterion
and effective number of parameters}

\item{n.cluster}{number of clusters to use to run parallel chains.
    Default equals n.chains.}

\item{n.chains}{number of Markov chains (default: 3)}

\item{n.iter}{number of total iterations per chain (including burn in;
    default: 2000)}

\item{n.burnin}{length of burn in, i.e. number of iterations to
    discard at the beginning. Default is \code{n.iter/2}, that is,
    discarding the first half of the simulations. If n.burnin is 0,
    \code{jags()} will run 100 iterations for adaption.}

\item{n.thin}{thinning rate. Must be a positive integer.  Set
    \code{n.thin} > 1 to save memory and computation time if
    \code{n.iter} is large.  Default is \code{max(1, floor(n.chains *
    (n.iter-n.burnin) / 1000))} which will only thin if there are at
    least 2000 simulations.}

\item{jags.module}{the vector of jags modules to be loaded.  Default are \dQuote{glm} and \dQuote{dic}. Input NULL if you don't want to load any jags module.}

\item{inits}{a list with \code{n.chains} elements; each element of the
    list is itself a list of starting values for the \code{BUGS} model,
    \emph{or} a function creating (possibly random) initial values. If inits is
    \code{NULL}, \code{JAGS} will generate initial values for parameters.}

\item{RNGname}{the name for random number generator used in JAGS. There are four RNGS
  supplied by the base moduale in JAGS: \code{Wichmann-Hill}, \code{Marsaglia-Multicarry},
  \code{Super-Duper}, \code{Mersenne-Twister}}

\item{jags.seed}{random seed for \code{JAGS}, default is 123.  This function is used for jags.parallell() and does not work for jags().  Use set.seed() instead if you want to produce identical result with jags() }

\item{stdout}{Character of length 1, file path to write the stdout stream
of the model when it runs. Set to \code{NULL} to print to the console.
Set to \code{R.utils::nullfile()} to suppress stdout.
Does not apply to messages, warnings, or errors.}

\item{stderr}{Character of length 1, file path to write the stderr stream
of the model when it runs. Set to \code{NULL} to print to the console.
Set to \code{R.utils::nullfile()} to suppress stderr.
Does not apply to messages, warnings, or errors.}

\item{progress.bar}{type of progress bar. Possible values are \dQuote{text},
      \dQuote{gui}, and \dQuote{none}. Type \dQuote{text} is displayed
      on the R console. Type \dQuote{gui} is a graphical progress bar
      in a new window. The progress bar is suppressed if \code{progress.bar} is
      \dQuote{none}}

\item{refresh}{refresh frequency for progress bar, default is \code{n.iter/50}}
}
\value{
A data frame of posterior summaries.
}
\description{
Not a user-side function. Do not invoke directly.
}
\keyword{internal}
