/**
 * Models request-derived props passed to Deco action and loader callbacks.
 *
 * This boundary is application-local: models-as-data access paths start from
 * named package APIs and cannot select default-exported callbacks by their
 * location under an application's actions or loaders directory.
 * Import this module in the query context that should use the source.
 */
import javascript
import semmle.javascript.security.dataflow.RemoteFlowSources

private predicate isDecoBlockModule(Module mod) {
  exists(Folder blockFolder, PackageJson packageJson |
    blockFolder.getBaseName() in ["actions", "loaders"] and
    blockFolder = mod.getFile().getParentContainer*() and
    packageJson.declaresDependency("@deco/deco", _) and
    packageJson.getFolder() = mod.getFile().getParentContainer*()
  )
}

private DataFlow::FunctionNode getADecoBlockHandler() {
  exists(Module mod |
    isDecoBlockModule(mod) and
    result = mod.getAnExportedValue("default").getAFunctionValue()
  )
}

/** The props object supplied to an invoked Deco action or loader. */
class DecoRequestProps extends RemoteFlowSource {
  DecoRequestProps() { this = getADecoBlockHandler().getParameter(0) }

  override string getSourceType() { result = "Deco request-derived props" }
}
