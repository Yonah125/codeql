// generated by codegen/codegen.py
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.typerepr.TypeRepr

class TypeExprBase extends @type_expr, Expr {
  override string toString() { result = "TypeExpr" }

  TypeRepr getTypeRepr() {
    exists(TypeRepr x |
      type_expr_type_reprs(this, x) and
      result = x.resolve()
    )
  }
}
