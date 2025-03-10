## 0.2.0

### Breaking Changes

* The signature of `allowImplicitRead` on `DataFlow::Configuration` and `TaintTracking::Configuration` has changed from `allowImplicitRead(DataFlow::Node node, DataFlow::Content c)` to `allowImplicitRead(DataFlow::Node node, DataFlow::ContentSet c)`.

### Minor Analysis Improvements

* Improved the data flow support for the Android class `SharedPreferences$Editor`. Specifically, the fluent logic of some of its methods is now taken into account when calculating data flow.
  * Added flow sources and steps for JMS versions 1 and 2.
  * Added flow sources and steps for RabbitMQ.
  * Added flow steps for `java.io.DataInput` and `java.io.ObjectInput` implementations.
* Added data-flow models for the Spring Framework component `spring-beans`.

### Bug Fixes

* The QL class `JumpStmt` has been made the superclass of `BreakStmt`, `ContinueStmt` and `YieldStmt`. This allows directly using its inherited predicates without having to explicitly cast to `JumpStmt` first.

## 0.1.0

### Breaking Changes

* The recently added flow-state versions of `isBarrierIn`, `isBarrierOut`, `isSanitizerIn`, and `isSanitizerOut` in the data flow and taint tracking libraries have been removed.
* The `getUrl` predicate of `DeclaredRepository` in `MavenPom.qll` has been renamed to `getRepositoryUrl`. 

### New Features

* There are now QL classes ErrorExpr and ErrorStmt. These may be generated by upgrade or downgrade scripts when databases cannot be fully converted.

### Minor Analysis Improvements

* Added guard preconditon support for assertion methods for popular testing libraries (e.g. Junit 4, Junit 5, TestNG).

## 0.0.13

## 0.0.12

### Breaking Changes

* The flow state variants of `isBarrier` and `isAdditionalFlowStep` are no longer exposed in the taint tracking library. The `isSanitizer` and `isAdditionalTaintStep` predicates should be used instead.

### Deprecated APIs

* Many classes/predicates/modules that had upper-case acronyms have been renamed to follow our style-guide. 
  The old name still exists as a deprecated alias.

### New Features

* The data flow and taint tracking libraries have been extended with versions of `isBarrierIn`, `isBarrierOut`, and `isBarrierGuard`, respectively `isSanitizerIn`, `isSanitizerOut`, and `isSanitizerGuard`, that support flow states.

### Minor Analysis Improvements

 * Added new guards `IsWindowsGuard`, `IsSpecificWindowsVariant`, `IsUnixGuard`, and `IsSpecificUnixVariant` to detect OS specific guards.
 * Added a new predicate `getSystemProperty` that gets all expressions that retrieve system properties from a variety of sources (eg. alternative JDK API's, Google Guava, Apache Commons, Apache IO, etc.).
 * Added support for detection of SSRF via JDBC database URLs, including connections made using the standard library (`java.sql`), Hikari Connection Pool, JDBI and Spring JDBC.
 * Re-removed support for `CharacterLiteral` from `CompileTimeConstantExpr.getStringValue()` to restore the convention that that predicate only applies to `String`-typed constants.
* All deprecated predicates/classes/modules that have been deprecated for over a year have been deleted.

## 0.0.11

### New Features

* Added `hasDescendant(RefType anc, Type sub)`
* Added `RefType.getADescendant()`
* Added `RefType.getAStrictAncestor()`

### Minor Analysis Improvements

 * Add support for `CharacterLiteral` in `CompileTimeConstantExpr.getStringValue()`

## 0.0.10

### New Features

* Added predicates `ClassOrInterface.getAPermittedSubtype` and `isSealed` exposing information about sealed classes.

## 0.0.9

## 0.0.8

### Deprecated APIs

* The `codeql/java-upgrades` CodeQL pack has been removed. All upgrades scripts have been merged into the `codeql/java-all` CodeQL pack.

## 0.0.7

## 0.0.6

### Major Analysis Improvements

* Data flow now propagates taint from remote source `Parameter` types to read steps of their fields (e.g. `tainted.publicField` or `tainted.getField()`). This also applies to their subtypes and the types of their fields, recursively.

## 0.0.5

### Bug Fixes

* `CharacterLiteral`'s `getCodePointValue` predicate now returns the correct value for UTF-16 surrogates.
* The `RangeAnalysis` module now properly handles comparisons with Unicode surrogate character literals.

## 0.0.4

### Bug Fixes

* `CharacterLiteral`'s `getCodePointValue` predicate now returns the correct value for UTF-16 surrogates.
* The `RangeAnalysis` module and the `java/constant-comparison` queries no longer raise false alerts regarding comparisons with Unicode surrogate character literals.
* The predicate `Method.overrides(Method)` was accidentally transitive. This has been fixed. This fix also affects `Method.overridesOrInstantiates(Method)` and `Method.getASourceOverriddenMethod()`.
