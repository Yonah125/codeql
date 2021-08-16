/** Provides classes and predicates related to support coverage of external libraries. */

import java
private import semmle.code.java.dataflow.FlowSources

/**
 * Gets the coverage support for the given `Callable`. If the `Callable` is not supported, returns "?".
 */
string supportKind(Callable api) {
  if api instanceof TaintPreservingCallable
  then result = "taint-preserving"
  else
    if summaryCall(api)
    then result = "summary"
    else
      if sink(api)
      then result = "sink"
      else
        if source(api)
        then result = "source"
        else result = "?"
}

private predicate summaryCall(Callable api) {
  summaryModel(packageName(api), typeName(api), _, api.getName(), _, _, _, _, _)
}

private predicate sink(Callable api) {
  sinkModel(packageName(api), typeName(api), _, api.getName(), _, _, _, _)
}

private predicate source(Callable api) {
  sourceModel(packageName(api), typeName(api), _, api.getName(), _, _, _, _)
  or
  exists(Call call, DataFlow::Node arg |
    call.getCallee() = api and
    [call.getAnArgument(), call.getQualifier()] = arg.asExpr() and
    arg instanceof RemoteFlowSource
  )
}

private string packageName(Callable api) {
  result = api.getCompilationUnit().getPackage().toString()
}

private string typeName(Callable api) {
  result = api.getDeclaringType().getAnAncestor().getSourceDeclaration().toString()
}
